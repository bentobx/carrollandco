nav.navbar.navbar-light.bg-faded
  // mobile logo
  a.navbar-brand.logo(href='/').hidden-lg-up
    img.img-fluid(src='/img/logo-wordmark.png' width='200')
  .menu-toggler.hidden-lg-up(data-toggle="collapse" data-target="#nav-responsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation") Menu
  a.navbar-brand.logo(href='/').hidden-lg-down
    img.img-fluid(src='/img/logo-wordmark.png' width='300')
  div.collapse.navbar-toggleable-md#nav-responsive
    ul.nav.navbar-nav
      each(loop='path, key in paths.navbar')
        li.nav-item
          a.nav-link(href='{{path.url}}' class="{{ item.slug == key ? 'current' : '' }}") {{path.title}}
