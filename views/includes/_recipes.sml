.container
  h1 Recipes
  each(loop='recipe, i of contentful.recipes')
    .card
      if(condition='recipe.bannerImage')
        img.card-img-top(src=recipe.bannerImage.fields.file.url width=recipe.bannerImage.fields.file.details.image.width height=recipe.bannerImage.fields.file.details.image.height)
      .card-block
        h3.card-title
          a(href='/recipes/{{recipe.slug}}') {{recipe.title}}

        p: strong Ingredients

        ul.list-unstyled
          each(loop='ingredient in recipe.ingredients')
            li {{ ingredient}}

        p: strong Directions

        div {{{ recipe.directions }}}
