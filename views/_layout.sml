doctype html
html
  head
    block(name='meta')
      meta(charset='utf-8')
      meta(http-equiv='X-UA-Compatible' content='IE=edge, chrome=1')
      meta(name="viewport" content="width=device-width, initial-scale=1")
      link(rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous")
      script(src='https://use.typekit.net/gyt3xeu.js')
      script try{Typekit.load({ async: true });}catch(e){}

      block(name='title')
        title {{item.title}}

    block(name='stylesheets')
      link(rel='stylesheet' href='/css/index.css')

  body(id={{item.slug}} class="{{ item.classes ? item.classes.join(' ') : '' }}")

    block(name='nav')

    main(role='main')

      a.logo(href='/')
        //- object(type='image/svg+xml', data='/img/logo-svg.svg')
        img.img-fluid(src='/img/logo.png')

      block(name='content')

      block(name='sections')

    block(name='footer')
      footer.footer
        p &copy; 2016 Carroll &amp; Co.fdsfdsfsd
