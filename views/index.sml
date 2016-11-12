extends(src='views/_layout.sml')

  block(name='nav')
    include(src='views/includes/_main-nav.sml')

  block(name='content')

    div.jumbotron
      div.container


        div(md) Lorem ipsum dolor sit amet

        a.btn.btn-outline-primary.btn-lg(href='#', role='button') Learn more &raquo;

    div.container

      img.lineup(src='/img/bitters-lineup.jpg')

      h2 Recipes

      each(loop='recipe, i of contentful.recipes')
        .card
          if(condition='recipe.bannerImage')
            img.card-img-top(src=recipe.bannerImage.fields.file.url width=recipe.bannerImage.fields.file.details.image.width height=recipe.bannerImage.fields.file.details.image.height)
          .card-block
            h4.card-title
              a(href='/recipes/{{recipe.slug}}') {{recipe.title}}

            p: strong Ingredients

            ul.list-unstyled
              each(loop='ingredient in recipe.ingredients')
                li {{ ingredient}}

            p: strong Directions

            div {{{ recipe.directions }}}
