require('dotenv').config();
const path             = require('path')
const HardSourcePlugin = require('hard-source-webpack-plugin')
const htmlStandards    = require('reshape-standard')
const cssStandards     = require('spike-css-standards')
const jsStandards      = require('babel-preset-latest')
const pageId           = require('spike-page-id')
const md               = require('markdown-it')()
const Contentful       = require('spike-contentful')
const locals           = {}
const mixins           = require('postcss-mixins')
const vars             = require('postcss-simple-vars')
const nestedProps      = require('postcss-nested-props')
const nested           = require('postcss-nested')

module.exports = {
  devtool: 'source-map',
  matchers: {
    html: '*(**/)*.sml',
    css: '*(**/)*.sss'
  },
  ignore: ['**/layout.sml','**/_*', '**/.*', '_cache/**', 'readme.md'],
  reshape: (ctx) => {
    return htmlStandards({
      locals
    })
  },
  postcss: (ctx) => {
    let css = cssStandards({ webpack: ctx })
    let otherPlugins = [mixins, vars, nestedProps, nested]
    otherPlugins.forEach(plugin =>
      css.plugins.push(plugin())
    )
    return css
  },
  babel: { presets: [jsStandards] },
  plugins: [
    new HardSourcePlugin({
      environmentPaths: { root: __dirname },
      recordsPath: path.join(__dirname, '_cache/records.json'),
      cacheDirectory: path.join(__dirname, '_cache/hard_source_cache')
    }),
    new Contentful({
      addDataTo: locals,
      accessToken: process.env.cda,
      spaceId: process.env.space,
      contentTypes: [
        {
          name: 'posts',
          id: 'post',
          transform: (post) => {
            post = post.fields
            post.body = md.render(post.body)
            // console.log(post)
            return post
          },
          template: {
            path: 'views/templates/_post.sml',
            output: (post) => { return `posts/${post.slug}.html` }
          }
        },
        {
          name: 'pages',
          id: 'page',
          template: {
            path: 'views/templates/_page.sml',
            output: (i) => { return `${i.slug}.html` }
        }
      }
      ]
    })
  ]
}
