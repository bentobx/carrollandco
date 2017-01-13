
const path             = require('path')
const Contentful       = require('spike-contentful')
const HardSourcePlugin = require('hard-source-webpack-plugin')
const Records          = require('spike-records')
const cssStandards     = require('spike-css-standards')

const htmlStandards    = require('reshape-standard')
// const pageId           = require('spike-page-id')
const jsStandards      = require('babel-preset-latest')
const md               = require('markdown-it')()
const mixins           = require('postcss-mixins')
const nested           = require('postcss-nested')
const nestedProps      = require('postcss-nested-props')
const vars             = require('postcss-simple-vars')
const colorFunction    = require('postcss-color-function')

const locals           = {}

formatProductText = (product) => {
  product = product.fields
  if (product.description)
    product.description   = md.render(product.description)
  if (product.suggestedUses)
    product.suggestedUses = md.render(product.suggestedUses)
  return product
}

module.exports = {
  cleanUrls: true,
  // devtool: 'source-map',
  matchers: {
    html: '*(**/)*.sml',
    css: '*(**/)*.sss'
  },
  ignore: ['**/.*', '*/**/_*.*','_cache/**', '*.md', 'prepros.cfg', '*.log'],
  reshape: (ctx) => {
    return htmlStandards({
      locals: Object.assign(
        locals,
        { md: md })
      // webpack: ctx,
      // locals: { pageId: pageId(ctx), locals }
    })
  },
  postcss: (ctx) => {
    let css = cssStandards({ webpack: ctx })
    let otherPlugins = [mixins, vars, nestedProps, nested, colorFunction]
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
      includeLevel: 2,
      contentTypes: [
        {
          name: 'mixers',
          id: '2PqfXUJwE8qSYKuM0U6w8M',
          filters: {
            order: 'fields.sku',
            'fields.category[in]': 'Mixers'
          },
          transform: function(product) {
            return formatProductText(product)
          }
        },
        {
          name: 'syrups',
          id: '2PqfXUJwE8qSYKuM0U6w8M',
          filters: {
            order: 'fields.sku',
            'fields.category[in]': 'Specialty Syrups'
          },
          transform: function(product) {
            return formatProductText(product)
          }
        },
        {
          name: 'bitters',
          id: '2PqfXUJwE8qSYKuM0U6w8M',
          filters: {
            order: 'fields.sku',
            'fields.category[in]': 'Bitters'
          },
          transform: function(product) {
            return formatProductText(product)
          }
        },
        {
          name: 'pages',
          id: 'page',
          // filters: { 'fields.slug[nin]': 'home' },
          template: {
            path: 'views/templates/_page.sml',
            output: (i) => {
              if (i.slug == 'home')
                return `index.html`
              else
                return `/${i.slug}/index.html`
            }
          }
        },
        {
          name: 'posts',
          id: 'post',
          template: {
            path: 'views/templates/_post.sml',
            output: (i) => {
              return `/posts/${i.slug}/index.html`
            }
          },
          transform: (post) => {
            post = post.fields
            post.body = md.render(post.body)
            post.classes = ['post']
            return post
          }
        },
        {
          name: 'recipes',
          id: 'recipe',
          // filters: {
          //   order: 'fields.products[0].sys.id'
          // },
          // template: {
          //   path: 'views/templates/_recipe.sml',
          //   output: (i) => { return `/recipes/${i.slug}.html` }
          // },
          transform: (recipe) => {
            recipe = recipe.fields
            if (recipe.directions)
              recipe.directions   = md.render(recipe.directions)
            return recipe
          }
        }
      ]
    })
  ]
}
