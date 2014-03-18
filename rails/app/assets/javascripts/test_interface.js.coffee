$ ->
  init = ->
    for topic_type, topic_group of topics
      create_panel topic_type, topic_group
    create_subscribers()
    create_publishers()
  
  create_panel = (topic_type, topic_group) ->
    $(".container").append "
      <div class='panel #{topic_type}'>
        <h1>#{topic_type}</h1>
      </div>"
    create_topic_box topic_type, topic_id, topics for topic_id, topics of topic_group
        
  create_topic_box = (topic_type, topic_id, topics) ->
    return if topics instanceof ROSLIB.Topic
    for topic_key, topic_object of topics
      $(".panel.#{topic_type}").append "
        <div class='row' data-topic='#{topic_object.name}'>
          <div class='label'>#{topic_object.name}:</div>
          <div class='value'></div>
        </div>"

  create_subscribers = ->
    for topic_type, topic_group of window.topics
      for topic_key, topics of topic_group
        if topics instanceof ROSLIB.Topic
          # create subscriber
        else
          for topic_id, topic of topics
            ((t) ->
              t.subscribe (message) ->
                console.log message
                el = $(".row[data-topic='#{t.name}']").find('.value')
                el.html(parseFloat(message.data).toFixed(2))
            )(topic)

  create_publishers = ->
    return

  init()
