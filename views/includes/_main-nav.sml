nav.navbar.navbar-light.bg-faded
  .menu-toggler.hidden-lg-up(data-toggle="collapse" data-target="#nav-responsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation") Menu
  div.collapse.navbar-toggleable-md#nav-responsive
    a.navbar-brand.logo(href='/')
      img.img-fluid(src='/img/logo-wordmark.png' width='300')
    ul.nav.navbar-nav
      each(loop='path, key in paths.navbar')
        li.nav-item
          a.nav-link(href='{{path.url}}' class="{{ item.slug == key ? 'current' : '' }}") {{path.title}}
