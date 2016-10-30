---
# Jekyll header
---
#site.coffee
setHeader = ->
    scrollTop     = $(window).scrollTop()
    #headerOffset  = $('header').outerHeight true
    headerOffset = if $('#nav-mobile').hasClass 'open' then 200 else 70;
    elementOffset = $('main:first').offset().top
    distance      = (elementOffset - headerOffset - scrollTop)
    if distance < 0
      $('header').addClass('compact')   
    else
      $('header').removeClass('compact')
    return

$(window).scroll(setHeader)

$('header.site-header #nav-default a, header.site-header #nav-mobile a').click (event) ->
  target = $(this).attr 'href'
  speed = 500

  $('#hamburger.open').trigger 'click';

  if target.length && target.charAt(0) == '#'
    event.preventDefault()
    history.replaceState null, '', target
    #headerOffset  = $('header').outerHeight true
    headerOffset = if $('#nav-mobile').hasClass 'open' then 180 else 40;
    $('html,body').animate { scrollTop: $(target).offset().top - headerOffset }, speed
  else if !target.length
    event.preventDefault()
    history.replaceState null, '', ' '
    $('html,body').animate { scrollTop: 0 }, speed
  return

$('#hamburger').click ->
    $(this).toggleClass 'open'
    $('#nav-mobile').toggleClass 'open'
    $('#nav-default').toggleClass 'no-padding'
    
    if $('#nav-mobile li').is ':visible'
      $('#nav-mobile li').slideUp 300
    else
      $('#nav-mobile li').slideDown 300
    return false
  
            