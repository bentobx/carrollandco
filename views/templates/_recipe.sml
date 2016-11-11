extends(src='views/_layout.sml')

  main(role='main')

    block(name='nav')

    block(name='content')
      div.container

        h1 {{ item.title }}

        h3 Ingredients

        ul.list-unstyled
        each(loop='ingredient in item.ingredients')
          li {{ ingredient}}

        h3 Directions

        div {{{ item.directions }}}

    block(name='footer')
