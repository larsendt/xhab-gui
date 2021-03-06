$ ->
  window.init_ui = ->
    $("button#rogr-pump-on").on 'click', ->
      $('button#rogr-pump-on').addClass('green-bg')
      $('button#rogr-pump-off').removeClass('red-bg')
      $.ajax(url: window.rogr_url, type: 'patch', data:{ rogr: { water_pump_power: true } })
  
    $("button#rogr-pump-off").on 'click', ->
      $('button#rogr-pump-on').removeClass('green-bg')
      $('button#rogr-pump-off').addClass('red-bg')
      $.ajax(url: window.rogr_url, type: 'patch', data:{ rogr: { water_pump_power: false } })
 
    $("button#rogr-nutrient-pump-on").on 'click', ->
      $('button#rogr-nutrient-pump-on').addClass('green-bg')
      $('button#rogr-nutrient-pump-off').removeClass('red-bg')
      $.ajax(url: window.rogr_url, type: 'patch', data:{ rogr: { nutrient_pump_power: true } })

    $("button#rogr-nutrient-pump-off").on 'click', ->
      $('button#rogr-nutrient-pump-on').removeClass('green-bg')
      $('button#rogr-nutrient-pump-off').addClass('red-bg')
      $.ajax(url: window.rogr_url, type: 'patch', data:{ rogr: { nutrient_pump_power: false } })
 
    $(document).on 'mouseup', ->
      $(".hold").removeClass('green-bg')

    $("button.hold").on 'mousedown', (e) ->
      $(e.target).addClass('green-bg')

    $("button.hold").on 'mouseup', (e) ->
      $(e.target).removeClass('green-bg')
   
    $("i.hold").on 'mousedown', (e) ->
      $(e.target).parent().addClass('green-bg')

    $("i.hold").on 'mouseup', (e) ->
      $(e.target).parent().removeClass('green-bg')
 
    $('form.edit_spot').on 'ajax:success', ->
      $("#spot-saved").show().delay(1000).fadeOut('slow')
  
    $("#spot-links a").on 'click', (e) ->
      $("#spot-links a").removeClass("active")
      $(e.target).addClass("active")
      $(".spot-panel").hide()
      panel = $(e.target).data('panel')
      $("#spot-panel-status").show()
      $("#spot-panel-#{panel}").show()
  
    $(".timepicker").timepicker()
    $(".slider").slider()

    $("button#fans-on").on 'click', ->
      console.log 'click'
      $("button#fans-off").removeClass('red-bg')
      $("button#fans-on").addClass('green-bg')
      $(".fan-icon").addClass("fa-spin").addClass('on')
      $.ajax(url: window.spot_url, type: 'patch', data:{ spot: { fan_power: true } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { fan_power: true } })

    $("button#fans-off").on 'click', ->
      $("button#fans-on").removeClass('green-bg')
      $("button#fans-off").addClass('red-bg')
      $(".fan-icon").removeClass("fa-spin").removeClass('on')
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { fan_power: false } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { fan_power: false } })

    $("button#white-lights-on").on 'click', ->
      $("button#white-lights-off").removeClass('red-bg')
      $("button#white-lights-on").addClass('green-bg')
      $("#white-light").show()
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { white_light_power: true } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { white_light_power: true } })
  
    $("button#white-lights-off").on 'click', ->
      $("button#white-lights-on").removeClass('green-bg')
      $("button#white-lights-off").addClass('red-bg')
      $("#white-light").hide()
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { white_light_power: false } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { white_light_power: false } })

    $("button#red-lights-on").on 'click', ->
      $("button#red-lights-off").removeClass('red-bg')
      $("button#red-lights-on").addClass('green-bg')
      $("#red-light").show()
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { red_light_power: true } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { red_light_power: true } })
  
    $("button#red-lights-off").on 'click', ->
      $("button#red-lights-on").removeClass('green-bg')
      $("button#red-lights-off").addClass('red-bg')
      $("#red-light").hide()
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { red_light_power: false } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { red_light_power: false } })

    $("button#camera-refresh-on").on 'click', ->
      $("button#camera-refresh-off").removeClass('red-bg')
      $("button#camera-refresh-on").addClass('green-bg')
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { refresh: true } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { refresh: true } })
  
    $("button#camera-refresh-off").on 'click', ->
      $("button#camera-refresh-on").removeClass('green-bg')
      $("button#camera-refresh-off").addClass('red-bg')
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { refresh: false } })
      $.ajax(url: window.spot_command_url, type: 'post', data:{ spot: { refresh: false } })

    $("button#enclosure-open").on 'click', ->
      $("button#enclosure-close").removeClass('red-bg')
      $("button#enclosure-open").addClass('green-bg')
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { enclosure: true } })
      $.ajax(url: window.spot_command_url, type: 'post', data: { spot: { enclosure: true } })
  
    $("button#enclosure-close").on 'click', ->
      $("button#enclosure-open").removeClass('green-bg')
      $("button#enclosure-close").addClass('red-bg')
      $.ajax(url: window.spot_url, type: 'patch', data: { spot: { enclosure: false } })
      $.ajax(url: window.spot_command_url, type: 'post', data: { spot: { enclosure: false } })
