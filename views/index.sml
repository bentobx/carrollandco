extends(src='views/layout.sml')

  block(name='nav')

    nav(class="navbar navbar-static-top navbar-dark bg-inverse")
      a(class="navbar-brand" href="#") Carroll &amp; Co.
      ul(class="nav navbar-nav")
        li(class="nav-item active")
          a(class="nav-link" href="#") Home
            span(class="sr-only") (current)


  block(name='content')

    div(class="jumbotron")
      div(class="container")
        h1(class="display-3") Carroll &amp; Co.
          p(md) Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          a(class="btn btn-primary btn-lg" href="#" role="button") Learn more &raquo;

    div(class='container')
      h2 Carroll &amp; Co.

      each(loop='page in contentful.pages')
        h3
          a(href="{{page.slug}}") {{page.title}}
        if(condition=page.bannerImage)
          img(src={{page.bannerImage.fields.file.url}} width={{page.bannerImage.fields.file.details.image.width}} height={{page.bannerImage.fields.file.details.image.height}})

      h2 Posts

      each(loop='post of contentful.posts')
        p: strong: a(href='/posts/{{post.slug}}') {{post.title}}
        div {{{post.body}}}
