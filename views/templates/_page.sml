doctype html
html
  head
    block(name='meta')
      meta(charset='utf-8')
      meta(http-equiv='X-UA-Compatible' content='IE=edge, chrome=1')
      meta(name="viewport" content="width=device-width, initial-scale=1")
      link(rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous")

      block(name='title')
      title {{pageId}}

    block(name='stylesheets')
      link(rel='stylesheet' href='css/index.css')

  body#home

    main(role='main')

      block(name='nav')

      block(name='content')

      block(name='footer')
