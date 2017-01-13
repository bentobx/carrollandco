section.tagline
  div.text How to serve Carroll &amp; Co.

each(loop='recipe, i of contentful.recipes')
  .recipe(id="{{recipe.slug}}")
    h3 {{recipe.title}}

    div.text.featuring
      each(loop='link in recipe.products')
        h4 Featuring Carroll &amp; Co.
          p: a(href='/products/#{{link.fields.slug}}') {{ link.fields.name }}

    .row
      .col-sm.flex-sm-unordered.row-eq-height.text
        h4 Ingredients
        ul.list-unstyled.em-bullet
          each(loop='ingredient in recipe.ingredients')
            li {{ ingredient}}


      .col-sm.flex-sm-unordered.row-eq-height
        h4 Directions
        div {{{ recipe.directions }}}
      if(condition='recipe.image')

        .col-sm.flex-sm-unordered.row-eq-height
          img.img-fluid(src="{{recipe.image.fields.file.url + '?h=200&w=400'}}")
