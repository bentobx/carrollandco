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

          elseif(condition='section.fields.type == "standard"')
            section(class="{{ section.fields.classes ? section.fields.classes.join(' ') : '' }}")
              div.container
                p {{section.fields.body}}
                p {{ JSON.stringify(section.fields.links) }}
                if(condition='section.fields.links')
                  each(loop='link in section.fields.links')
                    p {{ JSON.stringify(link) }}

