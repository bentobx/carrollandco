extends(src='views/layout.sml')

  block(name='nav')
    nav(class='navbar navbar-static-top')
      a(class='navbar-brand' href='#') Carroll &amp; Co.
      ul(class='nav navbar-nav')
        each(loop='path, key in paths.navbar')
          li(class='nav-item')
            a(class='nav-link' href='{{path.url}}') {{path.title}}

  block(name='content')
    div(class='jumbotron' style="background-image: url({{item.bannerImage ? item.bannerImage.fields.file.url : ''}})")
      div(class='container')
        h1(class='display-3') {{item.title}}
          a(class='btn btn-primary btn-lg' href='#' role='button') Learn more &raquo;

    div(class='container')

      main.main {{item.body}}

      aside {{item.aside}}

  block(name='footer')
    footer
      p &copy; 2016 Carroll &amp; Co.