nav.navbar.navbar-light.bg-faded
  a.navbar-brand.logo(href='/')
    img.img-fluid(src='/img/logo-wordmark.png')
  button.hidden-lg-up.menu-toggler.navbar-toggler(type="button" data-toggle="collapse" data-target="#nav-mobile" aria-controls="nav-mobile" aria-expanded="false" aria-label="Toggle navigation")
    .navbar-toggler-icon Menu
  div.collapse.navbar-collapse.navbar-toggleable-md#nav-mobile
    ul.nav.navbar-nav
      each(loop='path, key in paths.navbar')
        li.nav-item
          a.nav-link(href='{{path.url}}' class="{{ item.slug == key ? 'current' : '' }}") {{path.title}}
