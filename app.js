require('dotenv').config();
const path             = require('path')

const Contentful       = require('spike-contentful')
const HardSourcePlugin = require('hard-source-webpack-plugin')
const Records          = require('spike-records')

const cssStandards     = require('spike-css-standards')
const htmlStandards    = require('reshape-standard')
// const htmlStandards    = require('spike-html-standards')
const pageId           = require('spike-page-id')

const jsStandards      = require('babel-preset-latest')

const md               = require('markdown-it')()

const mixins           = require('postcss-mixins')
const nested           = require('postcss-nested')
const nestedProps      = require('postcss-nested-props')
const vars             = require('postcss-simple-vars')


const locals           = {}

module.exports = {
  devtool: 'source-map',
  matchers: {
    html: '*(**/)*.sml',
    css: '*(**/)*.sss'
  },
  ignore: ['**/_*', '**/.*', '_cache/**', 'readme.md', 'prepros.cfg'],
  reshape: (ctx) => {
    return htmlStandards({
      locals
      // https://github.com/static-dev/spike-records/issues/39
      // webpack: ctx,
      // locals: { pageId: pageId(ctx), locals }
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
            path: 'views/templates/_product.sml',
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
            path: 'views/templates/_page.sml',
            output: (i) => { return `${i.slug}.html` }
          }
        }
      ]
    })
  ]
}
