extends(src='views/_layout.sml')


    block(name='nav')
      include(src='views/includes/_main-nav.sml')

    block(name='sections')

      if(condition='item.sections')
        each(loop='section in item.sections')
          if(condition='section.fields.type == "jumbotron"')
            div.jumbotron.feature(style='background-image: url({{section.fields.image.fields.file.url}})')
              div.container
                p {{section.fields.body}}
                a.btn.btn-outline-primary.btn-lg(href='{{section.fields.promotedUrl}}', role='button') Learn more &raquo;

          if(condition='section.fields.type == "spike-template"')
          // to use a sugarml template from the application (if you need to use a spike-contentful object)
          // 1. attach section of type spike-template to the page
          // 2. create include file/template, as below
          // 3. check the page's slug
          // Note: This structure is used so you can rearrange the order of sections in contentful
            if(condition='item.slug == "recipes"')
              include(src='views/includes/_recipes.sml')
            if(condition='item.slug == "products"')
              include(src='views/includes/_products.sml')

          if(condition='section.fields.type == "text + image"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              div.container
                div.row
                  div.col-md-4.offset-md-2
                    p {{section.fields.body}}
                  div.col-md-4
                    img.right.img-fluid(src={{section.fields.image.fields.file.url}})

          if(condition='section.fields.type == "text only"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              div.container
                h3 {{section.fields.body}}
                div(md) {{section.fields.body}}

          if(condition='section.fields.type == "3up"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              div.container
                h3 {{{section.fields.body}}}
                div.card-group
                  each(loop='card in section.fields.links')

                    div.card
                      div.card-block
                        h3.card-title {{card.fields.title}}
                      img.img-fluid(src="{{card.fields.bannerImage.fields.file.url + '?h=300&w=300&fit=fill&bg=rgb:000000'}}")
                      // content type template include here
                      div.card-block

                        if(condition='card.contentType.sys.id == "recipe"')
                          div.recipe
                            h4 Ingredients
                            ul.list-unstyled.em-bullet
                              each(loop='ingredient in card.fields.ingredients')
                                li {{ ingredient}}
                            a.card-link(href='/recipes/{{card.fields.slug}}') Recipe



          if(condition='section.fields.type == "2up"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              h3 2up
              div.container
                div.row
                  each(loop='card in section.links')
                    div.card.col-md-6
                      h3 {{card.fields.title}}
