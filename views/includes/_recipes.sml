each(loop='recipe, i of contentful.recipes')
  section.recipe(id="{{recipe.slug}}")
    .container
      div.row
        div.col-md-6
          if(condition='recipe.bannerImage')
            img.img-fluid(src="{{recipe.bannerImage.fields.file.url + '?h=300&w=300&fit=fill&bg=rgb:000000'}}")
          else
            p no image
        div.col-md-6
          h3.card-title
            a(href='/recipes/{{recipe.slug}}') {{recipe.title}}
          p: strong Ingredients

          ul.list-unstyled.em-bullet
            each(loop='ingredient in recipe.ingredients')
              li {{ ingredient}}

          p: strong Directions

          div {{{ recipe.directions }}}
