extends(src='views/_layout.sml')

  block(name='nav')
    include(src='views/includes/_main-nav.sml')

  block(name='content')

    div.jumbotron.feature
      div.container
        h1 Campari Feature
        p Feature text Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

        a.btn.btn-outline-primary.btn-lg(href='#', role='button') Learn more &raquo;

    div.container

      img.lineup(src='/img/bitters-lineup.jpg')
