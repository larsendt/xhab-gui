$ ->
  time = ->
    current_day_and_time = moment().format("ddd MMM Do, YYYY  h:mm:ss A")
    $("#date-time").html(current_day_and_time)

  setInterval(time, 1000)
