extends(src='views/layout.sml')

  block(name='nav')

    nav(class="navbar navbar-static-top navbar-dark bg-inverse")
      a(class="navbar-brand" href="#") Project name
      ul(class="nav navbar-nav")
        li(class="nav-item active")
          a(class="nav-link" href="#") Home
            span(class="sr-only") (current)


  block(name='content')

    div(class="jumbotron")
      div(class="container")
        h1(class="display-3") Carroll &amp; Co.
          p(md) This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.
          a(class="btn btn-primary btn-lg" href="#" role="button") Learn more &raquo;

    div(class='container')
      h2 Carroll &amp; Co.

      each(loop='page of contentful.pages')
        h3 {{page.title}}
        if(condition=page.bannerImage)
          img(src={{page.bannerImage.fields.file.url}} width={{page.bannerImage.fields.file.details.image.width}} height={{page.bannerImage.fields.file.details.image.height}})

      h2 Posts

      each(loop='post of contentful.posts')
        p: strong: a(href='/posts/{{post.slug}}') {{post.title}}
        div(md) {{post.body}}
