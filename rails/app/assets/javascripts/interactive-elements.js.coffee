$ ->

  $('.toggle-on-off').each ->
    $(this).toggles
      clickable: !$(this).hasClass('noclick')
      dragable: !$(this).hasClass('nodrag')
      click: if ($(this).attr('rel')) then $('.'+$(this).attr('rel')) else undefined
      on: !$(this).hasClass('off')
      checkbox: if ($(this).data('checkbox')) then $('.'+$(this).data('checkbox')) else undefined
      ontext: $(this).data('ontext') || 'ON'
      offtext: $(this).data('offtext') || 'OFF'

  $('.toggle-open-close').each ->
    $(this).toggles
      clickable: !$(this).hasClass('noclick')
      dragable: !$(this).hasClass('nodrag')
      click: if ($(this).attr('rel')) then $('.'+$(this).attr('rel')) else undefined
      on: !$(this).hasClass('off')
      checkbox: if ($(this).data('checkbox')) then $('.'+$(this).data('checkbox')) else undefined
      text:
        on: $(this).data('ontext') || 'OPEN'
        off: $(this).data('offtext') || 'SHUT'
