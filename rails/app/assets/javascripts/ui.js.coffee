$ ->
  $("button#fans-on").on 'click', ->
    $("button#fans-off").removeClass('red-bg')
    $("button#fans-on").addClass('green-bg')
    $(".fan-icon").removeClass('inactive').addClass("fa-spin").addClass('green').addClass('active')

  $("button#fans-off").on 'click', ->
    $("button#fans-on").removeClass('green-bg')
    $("button#fans-off").addClass('red-bg')
    $(".fan-icon").removeClass("fa-spin").removeClass('green').removeClass('active').addClass('inactive')

  $("button#white-lights-on").on 'click', ->
    $("button#white-lights-off").removeClass('red-bg')
    $("button#white-lights-on").addClass('green-bg')
    $("#white-light").show()
  
  $("button#white-lights-off").on 'click', ->
    $("button#white-lights-on").removeClass('green-bg')
    $("button#white-lights-off").addClass('red-bg')
    $("#white-light").hide()

  $("button#red-lights-on").on 'click', ->
    $("button#red-lights-off").removeClass('red-bg')
    $("button#red-lights-on").addClass('green-bg')
    $("#red-light").show()
  
  $("button#red-lights-off").on 'click', ->
    $("button#red-lights-on").removeClass('green-bg')
    $("button#red-lights-off").addClass('red-bg')
    $("#red-light").hide()

  $("button#camera-refresh-on").on 'click', ->
    $("button#camera-refresh-off").removeClass('red-bg')
    $("button#camera-refresh-on").addClass('green-bg')
  
  $("button#camera-refresh-off").on 'click', ->
    $("button#camera-refresh-on").removeClass('green-bg')
    $("button#camera-refresh-off").addClass('red-bg')

  $("button#enclosure-open").on 'click', ->
    $("button#enclosure-close").removeClass('red-bg')
    $("button#enclosure-open").addClass('green-bg')
  
  $("button#enclosure-close").on 'click', ->
    $("button#enclosure-open").removeClass('green-bg')
    $("button#enclosure-close").addClass('red-bg')
