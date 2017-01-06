section.tagline
  div.text How to serve Carroll &amp; Co.

each(loop='recipe, i of contentful.recipes')
  .recipe(id="{{recipe.slug}}")
    h3: a(href='/recipes/{{recipe.slug}}') {{recipe.title}}
    .row
      .col-xs.flex-xs-unordered.row-eq-height
        h4 Ingredients
        ul.list-unstyled.em-bullet
          each(loop='ingredient in recipe.ingredients')
            li {{ ingredient}}

      .col-xs.flex-xs-unordered.row-eq-height
        h4 Directions
        div {{{ recipe.directions }}}
      if(condition='recipe.bannerImage')

        .col-xs.flex-xs-unordered.row-eq-height
          // div {{ JSON.stringify(recipe.bannerImage.fields.file.url) }}
          img.img-fluid(src="{{recipe.bannerImage.fields.file.url + '?h=200&w=400'}}")

          // img.img-fluid(src="{{recipe.bannerImage + '?h=300&w=300&fit=fill&bg=rgb:000000'}}")
