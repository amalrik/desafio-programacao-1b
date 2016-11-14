ready = ->
  setTimeout (->
    $('.flash_notice').fadeOut 'slow', ->
      $(this).remove()
      return
    return
  ), 2500
  return

$(document).ready(ready)
$(document).on('page:load', ready)