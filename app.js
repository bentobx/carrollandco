require('dotenv').config();
const Contentful       = require('spike-contentful')
const cssStandards     = require('spike-css-standards')
const HardSourcePlugin = require('hard-source-webpack-plugin')
const htmlStandards    = require('reshape-standard')
const jsStandards      = require('babel-preset-latest')
const locals           = {}
const md               = require('markdown-it')()
const mixins           = require('postcss-mixins')
const nested           = require('postcss-nested')
const nestedProps      = require('postcss-nested-props')
const pageId           = require('spike-page-id')
const path             = require('path')
const Records          = require('spike-records')
const vars             = require('postcss-simple-vars')

module.exports = {
  devtool: 'source-map',
  matchers: {
    // html: '*(**/)*.jade',
    css: '*(**/)*.sss'
  },
  ignore: ['**/_*', '**/.*', '_cache/**', 'readme.md'],
  reshape: (ctx) => {
    return htmlStandards({
      webpack: ctx,
      locals: locals
    })
  },
  jade: {
    pretty: true,
    locals: locals
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
  module: {
    loaders: [
      { test: /\.jade$/, loader: 'source!jade-static-loader', extension: 'html' }
    ]
  },
  plugins: [
    new Records({
      addDataTo: locals,
      paths: { file: 'data/paths.json' }
    }),
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
          name: 'products',
          id: '2PqfXUJwE8qSYKuM0U6w8M',
          filters: {
            order: 'fields.sku'
          },
          template: {
            path: 'views/templates/_product.jade',
            output: (i) => { return `/products/${i.slug}.html` }
          },
          transform: (product) => {
            product = product.fields
            if (product.description)
              product.description   = md.render(product.description)
            if (product.suggestedUses)
              product.suggestedUses = md.render(product.suggestedUses)
            return product
          }
        },
        {
          name: 'recipes',
          id: 'recipe',
          template: {
            path: 'views/templates/_recipe.sml',
            output: (i) => { return `/recipes/${i.slug}.html` }
          }
        },
        {
          name: 'pages',
          id: 'page',
          template: {
            path: 'views/templates/_page.jade',
            output: (i) => { return `${i.slug}.html` }
          }
        }
      ]
    })
  ]
}
