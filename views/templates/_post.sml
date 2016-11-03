extends(src='views/layout.sml')

  block(name='nav')

    nav(class='navbar navbar-static-top navbar-dark bg-inverse')
      a(class='navbar-brand' href='#') Project name
      ul(class='nav navbar-nav')
        li(class='nav-item active')
          a(class='nav-link' href='#') Home
            span(class='sr-only') (current)


  block(name='content')
    div(class='jumbotron' style="{{item.bannerImage ? item.bannerImage.fields.file.url : ''}}")
      div(class='container')
        h1(class='display-3') {{item.title}}
          a(class='btn btn-primary btn-lg' href='#' role='button') Learn more &raquo;

    div(class='container')

      h2 {{item.title}}
      p {{Date.prototype.getDay(item.publishDate)}}
      div {{{item.body}}}
