section.tagline
  div.text What We Make


each(loop='product, i of contentful.mixers')
  include(src='views/includes/_product.sml')
each(loop='product, i of contentful.syrups')
  include(src='views/includes/_product.sml')
each(loop='product, i of contentful.bitters')
  include(src='views/includes/_product.sml')
