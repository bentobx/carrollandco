extends(src='views/_layout.sml')

  block(name='content')
    if(condition='item.bannerImage')

    div.jumbotron(style='background-repeat: no-repeat; background-image: url({{item.bannerImage.fields.file.url}})')
      h1 {{ item.title }}

    div.body {{{ item.body }}}
