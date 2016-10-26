---
# Jekyll header
---

setHeader = ->
    scrollTop     = $(window).scrollTop()
    headerOffset  = $('header').outerHeight true
    elementOffset = $('main:first').offset().top
    distance      = (elementOffset - headerOffset - scrollTop)
    if distance < 0
      $('header').addClass('compact')   
    else
      $('header').removeClass('compact')
    return

#site.coffee
$(window).scroll(setHeader)

$('header.site-header nav a').click ->
  target = $(this).attr 'href'
  speed = 500
  if target.length && target.charAt(0) == '#'
    event.preventDefault()
    history.replaceState null, '', target
    $('html,body').animate { scrollTop: $(target).offset().top - 40 }, speed
  else if !target.length
    event.preventDefault()
    history.replaceState null, '', ' '
    $('html,body').animate { scrollTop: 0 }, speed

#$ ->
  
  
            