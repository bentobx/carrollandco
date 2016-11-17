each(loop='product, i of contentful.products')
  section.product.row(id={{product.slug}})
    .container
      .title.col-md-12
        h3
          a(href='/products/{{product.slug}}') {{product.name}}
        if(condition='product.number != undefined')
          div.number N<sup>o.</sup> {{product.number}}
      .product-image.col-md-6
        if(condition='product.image')
          img(src="{{product.image[0].fields.file.url + '?h=600'}}")

      .content.col-md-6
        div.details
          p.volume
            span.label Volume
            span.value {{product.volume}} ml
          p.abv
            span.label Alc./Vol.
            span.value {{product.abv}}%

        div.description {{{product.description}}}

        if(condition='product.suggestedUses')
          h4 Suggested Uses
          div.suggested-uses {{{product.suggestedUses}}}

        if(condition='product.recipes')
          h4 Recipes
          each(loop='recipe, i of product.recipes')
            p
              a(href='/recipes/{{recipe.fields.slug}}') {{recipe.fields.title}}
