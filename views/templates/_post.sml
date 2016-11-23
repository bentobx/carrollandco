extends(src='views/_layout.sml')

  block(name='content')
    h1 {{ item.title }}
    div.body {{{ item.body }}}
