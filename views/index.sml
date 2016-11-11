extends(src='views/_layout.sml')

  block(name='nav')
    include(src='views/includes/_main-nav.sml')

  block(name='content')

    div.jumbotron
      div.container

        :marked
          Lorem ipsum dolor sit amet

        a.btn.btn-outline-primary.btn-lg(href='#', role='button') Learn more &raquo;

    div.container

      h2 Posts

      //- for post in contentful.posts
      //-   p: strong: a(href='/posts/{post.slug}') post.title
      //-   :marked
      //-     post.body
