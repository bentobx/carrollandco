doctype html
html
  head
    block(name='meta')
      meta(charset='utf-8')
      meta(http-equiv='X-UA-Compatible' content='IE=edge, chrome=1')
      meta(name='description' content='')
      meta(name='author' content='jennie')
      meta(name="viewport" content="width=device-width, initial-scale=1")
      link(rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous")

    block(name='title')
      title Carroll and Co.: {{item.title}}

    block(name='stylesheets')
      link(rel='stylesheet' href='css/index.css')

  body(role='document' class='{{item.classes}}')
    main(role='main')

      block(name='nav')

      block(name='content')

      block(name='footer')

    block(name='javascript')
      script(src='js/main.js' defer)
