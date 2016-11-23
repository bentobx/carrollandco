doctype html
html
  head
    block(name='meta')
      meta(charset='utf-8')
      meta(http-equiv='X-UA-Compatible' content='IE=edge, chrome=1')
      meta(name="viewport" content="width=device-width, initial-scale=1")

      script(src='https://use.typekit.net/gyt3xeu.js')
      script try{Typekit.load({ async: true });}catch(e){}

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
        div.container

          block(name='content')

          block(name='sections')

      block(name='footer')
        footer.footer
          p &copy; 2016 Carroll &amp; Co.
