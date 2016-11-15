div.container
  div.row
    div.col-md-6
      h1 {{ item.title }}

      h3 Ingredients

      ul.list-unstyled
        each(loop='ingredient in item.ingredients')
          li {{ ingredient}}

      h3 Directions

      div {{{ item.directions }}}
