h1 Recipes
p.tagline How to serve Carroll &amp; Co.

each(loop='recipe, i of contentful.recipes')
  .recipe(id="{{recipe.slug}}")
    h3: a(href='/recipes/{{recipe.slug}}') {{recipe.title}}
    .row
      .col-md-6.row-eq-height
        h4 Ingredients
        ul.list-unstyled.em-bullet
          each(loop='ingredient in recipe.ingredients')
            li {{ ingredient}}

      .col-md-6.row-eq-height
        h4 Directions
        div {{{ recipe.directions }}}
