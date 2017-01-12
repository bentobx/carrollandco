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
      if(condition='recipe.image')

        .col-xs.flex-xs-unordered.row-eq-height
          img.img-fluid(src="{{recipe.image.fields.file.url + '?h=200&w=400'}}")
