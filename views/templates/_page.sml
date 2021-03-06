extends(src='views/_layout.sml')

  block(name='content')
    if(condition='item.slug != "home"')
      h2 {{ item.title }}

  block(name='sections')

    if(condition='item.sections')
      each(loop='section in item.sections')
        if(condition='section.fields.type == "jumbotron"')
          div.jumbotron.feature(style='background-image: url({{section.fields.image.fields.file.url}})')
            p {{section.fields.body}}
            // TODO: If this is going to eventually point only to blog posts, update this URL
            a.btn.btn-outline-primary.btn-lg(href='/{{section.fields.links[0].fields.slug}}', role='button') Learn more &raquo;

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
            // h2 {{section.fields.title}}
            div.container
              div.row
                div.col-md.flex-md-first
                  if(condition='section.fields.body')
                      div.text.body {{{  md.render(section.fields.body) }}}
                div.col-md.flex-md-last
                  img.right.img-fluid(src="{{section.fields.image.fields.file.url + '?w=400'}}")

        if(condition='section.fields.type == "text only"')
          section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
            div.text {{section.fields.body}}

        if(condition='section.fields.type == "quote"')
          section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
            div.container
              each(loop='link in section.fields.links')
                blockquote {{{  md.render(link.fields.quoteText) }}}
                cite {{ link.fields.attributionName }}, {{ link.fields.attributionTitle }}, {{ link.fields.attributionCompanyText }}
                // I'd rather use a link to a company object here, but i'm hitting max call size in app.js
                // each(loop='company in link.fields.attributionCompany')
                  // div {{ company.name }}
                  // div {{ JSON.stringify(company) }}


        if(condition='section.fields.type == "3up"')
          section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
            h2 {{{section.fields.body}}}
            div.container
              div.row
                each(loop='card in section.fields.links')

                  div.card.col-md.flex-md-unordered.row-eq-height

                    if(condition='card.contentType.sys.id == "2PqfXUJwE8qSYKuM0U6w8M"')
                      h3.card-title {{card.fields.name}}
                      a(href='/products/#{{card.fields.slug}}')
                        img.img-fluid(src="{{card.fields.image[0].fields.file.url + '?&w=600&fit=fill&bg=rgb:000000'}}")

                    if(condition='card.contentType.sys.id == "recipe"')
                      h3.card-title {{card.fields.title}}
                      a(href='/recipes/#{{card.fields.slug}}')
                        img.img-fluid(src="{{card.fields.image.fields.file.url + '?h=300&w=300&fit=fill&bg=rgb:000000'}}")



        if(condition='section.fields.type == "standard"')
          section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
            h2 {{section.fields.title}}
            if(condition='section.fields.body')
              div.container
                div.text.body {{{  md.render(section.fields.body) }}}
            if(condition='section.fields.classes')
              if(condition='section.fields.classes.includes("grid")')
                if(condition='section.fields.links')
                  .container
                    .row.s-center
                      each(loop='link in section.fields.links')
                        .col-md-4.col-xs-6.row-eq-height
                          img.img-fluid(src="{{link.fields.logo.fields.file.url + '?w=300&h=100'}}" alt="{{link.fields.logo.fields.title}}")
