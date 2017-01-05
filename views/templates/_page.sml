extends(src='views/_layout.sml')

    block(name='sections')

      if(condition='item.sections')
        each(loop='section in item.sections')
          if(condition='section.fields.type == "jumbotron"')
            div.jumbotron.feature(style='background-image: url({{section.fields.image.fields.file.url}})')
              p {{section.fields.body}}
              // TODO: If this is going to eventually point only to blog posts, update this URL
              a.btn.btn-outline-secondary.btn-lg(href='/{{section.fields.links[0].fields.slug}}', role='button') Learn more &raquo;

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
              div.row
                div.col-md-7
                  h2 {{section.fields.title}}
                  if(condition='section.fields.body')
                    div.text.body {{{  md.render(section.fields.body) }}}
                div.col-md-5
                  img.right.img-fluid(src="{{section.fields.image.fields.file.url + '?w=400'}}")

          if(condition='section.fields.type == "text only"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              div.text {{section.fields.body}}

          if(condition='section.fields.type == "3up"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
                h2 {{{section.fields.body}}}
                .row
                  each(loop='card in section.fields.links')

                    div.card.col-md-4.row-eq-height
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
                            h4 Directions
                              p {{{ md.render(card.fields.directions) }}}

          if(condition='section.fields.type == "2up"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              h2 2up
              div.container
                div.row
                  each(loop='card in section.links')
                    div.card.col-md-6
                      h3 {{card.fields.title}}

          if(condition='section.fields.type == "standard"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              h2 {{section.fields.title}}
              if(condition='section.fields.body')
                div.text.body {{{  md.render(section.fields.body) }}}
              if(condition='section.fields.classes')
                if(condition='section.fields.classes.includes("grid")')
                  if(condition='section.fields.links')
                    .row.s-center
                      each(loop='link in section.fields.links')
                        .col-md-4.col-xs-6.row-eq-height
                          img.img-fluid(src="{{link.fields.logo.fields.file.url + '?w=100'}}" alt="{{link.fields.logo.fields.title}}")
