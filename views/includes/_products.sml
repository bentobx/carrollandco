each(loop='product, i of contentful.products')
  section.product.row(id={{product.slug}})
    .product-image.col-md-4
      if(condition='product.image')
        img(src="{{product.image[0].fields.file.url + '?h=600'}}")

    .content.col-md-8
      .title
        h3 {{product.name}}
        if(condition='product.number != undefined')
          div.number N<sup>o.</sup> {{product.number}}
      div.details
        p.volume
          span.label Volume
          span.value {{product.volume}} ml
        if(condition='product.abv')
          p.abv
            span.label Alc./Vol.
            span.value {{product.abv}}%

      div.description {{{product.description}}}

      if(condition='product.suggestedUses')
        h4 Suggested Uses
        div.suggested-uses {{{product.suggestedUses}}}

      if(condition='product.recipes')
        .recipes
          span: b Try it in…
          each(loop='recipe, i of product.recipes')
            span: a(href='/recipes/{{recipe.fields.slug}}') {{recipe.fields.title}}
