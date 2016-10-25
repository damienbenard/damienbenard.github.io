---
# Jekyll header
---

#site.coffee

$ ->
  $(window).scroll ->
    scrollTop     = $(window).scrollTop()
    headerOffset  = $('header').outerHeight(true)
    elementOffset = $('main:first').offset().top
    distance      = (elementOffset - headerOffset - scrollTop)
    if distance < 0
      $('header').addClass('compact')   
    else
      $('header').removeClass('compact')
            