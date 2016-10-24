require('dotenv').config();
const path = require('path')
const HardSourcePlugin = require('hard-source-webpack-plugin')
const htmlStandards = require('reshape-standard')
const cssStandards = require('spike-css-standards')
const jsStandards = require('babel-preset-latest')
const pageId = require('spike-page-id')
const Contentful = require('spike-contentful')
const locals = {}


module.exports = {
  devtool: 'source-map',
  matchers: {
    html: '*(**/)*.sgr',
    css: '*(**/)*.sss'
  },
  ignore: ['**/layout.sgr', '**/_*', '**/.*', '_cache/**', 'readme.md'],
  reshape: (ctx) => {
    return htmlStandards({
      locals
    })
  },
  postcss: (ctx) => {
    return cssStandards({ webpack: ctx })
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
          template: {
            path: 'views/index.sgr',
            output: (post) => { return `posts/${post.id}.html` }
          }
        },
        {
          name: 'pages',
          id: 'page'
        }
      ]
    })
  ]
}
