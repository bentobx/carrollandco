extends(src='views/_layout.sml')

  main(role='main')

    block(name='nav')

    block(name='content')

      h1 {{ item.title }}

    block(name='footer')
