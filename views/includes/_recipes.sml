.card-columns
  each(loop='recipe, i of contentful.recipes')
    section.recipe(id="{{recipe.slug}}")
      div.card.col-md-4
      .card-block
          h3.card-title
            a(href='/recipes/{{recipe.slug}}') {{recipe.title}}
          p: strong Ingredients

          ul.list-unstyled.em-bullet
            each(loop='ingredient in recipe.ingredients')
              li {{ ingredient}}

          p: strong Directions

          div {{{ recipe.directions }}}
