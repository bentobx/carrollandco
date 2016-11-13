.container
  each(loop='product, i of contentful.products')
    section.product.row(id={{product.slug}})

      .title.col-md-12
        h3
          a(href='/products/{{product.slug}}') {{product.name}}
        if(condition='product.number != undefined')
          h4.number N<sup>o.</sup> {{product.number}}
      .product-image.col-md-6
        if(condition='product.image')
          img(src="{{product.image[0].fields.file.url + '?h=600'}}")

      .content.col-md-6
        p.volume {{product.volume}} ml
        p.abv {{product.abv}}% Alc./Vol.

        div.description {{{product.description}}}

        if(condition='product.suggestedUses')
          h4 Suggested Uses
          div.suggested-uses {{{product.suggestedUses}}}

        if(condition='product.recipes')
          h4 Recipes
          each(loop='recipe, i of product.recipes')
            p
              a(href='/recipes/{{recipe.fields.slug}}') {{recipe.fields.title}}
