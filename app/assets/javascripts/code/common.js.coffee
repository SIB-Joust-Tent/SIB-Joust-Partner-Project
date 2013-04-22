window.isScrolledIntoView = ($elem) ->
  docViewTop = $(window).scrollTop()
  docViewBottom = docViewTop + $(window).height()
  elemTop = $elem.offset().top
  elemBottom = elemTop + $elem.height()
  elemBottom <= docViewBottom && elemTop >= docViewTop