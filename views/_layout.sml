doctype html
html
  head
    block(name='meta')
      meta(charset='utf-8')
      meta(http-equiv='X-UA-Compatible' content='IE=edge, chrome=1')
      meta(name="viewport" content="width=device-width, initial-scale=1")


      block(name='title')
        title {{item.title}}

    block(name='stylesheets')
      link(rel='stylesheet' href='/css/bootstrap-flex.min.css')
      link(rel='stylesheet' href='/css/index.css')

  block(name='body')
    body(id={{item.slug}} class="{{ item.classes ? item.classes.join(' ') : '' }}")

      block(name='nav')
        include(src='views/includes/_main-nav.sml')

      div.container
        main(role='main')

            block(name='content')

            block(name='sections')

        block(name='footer')
          footer.footer
            .social
              a(href='https://www.instagram.com/carrollandco.to')
                img.insta(src='/img/glyph-logo_May2016.png')
              a(href='https://twitter.com/betteryourbar')
                img.twitter(src='/img/Twitter_Logo_Blue.png')
            p &copy; 2017 Carroll &amp; Co.



      script(src='https://use.typekit.net/gyt3xeu.js')
      script try{Typekit.load({ async: true });}catch(e){}
      script(src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous")
      script(src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous")
      script(src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous")
