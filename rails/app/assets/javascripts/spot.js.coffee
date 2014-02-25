$ ->
  return unless $("body").hasClass("spots") && $("body").hasClass("show")

  window.topics.data.subscribe( (message) ->
    console.log('Received message on ' + topics.data.name + ': ' + message.data)
  )
