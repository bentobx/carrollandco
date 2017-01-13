section.row.product(id={{product.slug}})
  if(condition='product.image')
    .product-image.content.col-md.flex-md-unordered.row-eq-height
      img.img-fluid(src="{{product.image[0].fields.file.url + '?h=600'}}")

  .content.col-md.flex-xs-first.row-eq-height
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

      div.suggested-uses
        h4 Suggested Uses
          p {{{product.suggestedUses}}}

    if(condition='product.recipes')
      .recipes.text
        h4 Try it in
        ul.list-unstyled
          each(loop='recipe, i of product.recipes')
            li: a(href='/recipes/#{{recipe.fields.slug}}') {{recipe.fields.title}}
