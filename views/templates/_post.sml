extends(src='views/_layout.sml')

  block(name='content')
    if(condition='item.bannerImage')

      .jumbotron(style='background-repeat: no-repeat; background-image: url({{item.bannerImage.fields.file.url}})')
      h1 {{ item.title }}
      .body {{{ item.body }}}
