nav.navbar.navbar-fixed-top
  ul.nav.navbar-nav
    each(loop='path, key in paths.navbar')
      li.nav-item
        a.nav-link(href='{{path.url}}' class="{{ item.slug == key ? 'current' : '' }}") {{path.title}}
