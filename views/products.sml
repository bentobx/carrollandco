extends(src='views/_layout.sml')

  block(name='nav')
    include(src='views/includes/_main-nav.sml')


  block(name='content')

    div.container
      each(loop='product, i of contentful.products')
        .card
          if(condition='product.bannerImage')
            img.card-img-top(src=product.bannerImage.fields.file.url width=product.bannerImage.fields.file.details.image.width height=product.bannerImage.fields.file.details.image.height)
          .card-block
            h4.card-title
              a(href='/products/{{product.slug}}') {{product.name}}
            if(condition='product.number != undefined')
              h5.number N<sup>o.</sup> {{product.number}}
            p.volume {{product.volume}} ml
            p.abv {{product.abv}}% Alc./Vol.

            div.card-text {{{product.description}}}

            if(condition='product.suggestedUses')
              h4 Suggested Uses
              div.suggested-uses {{{product.suggestedUses}}}

            if(condition='product.recipes')
              h4 Recipes
              each(loop='recipe, i of product.recipes')
                p
                  a(href='/recipes/{{recipe.fields.slug}}') {{recipe.fields.title}}
