$ ->
  #-------------------------------------------------
  # GLOBAL VARIABLES
  #-------------------------------------------------
  
  # Initialize a new rosbridge websocket connection
  window.ros = new ROSLIB.Ros(
    url : 'ws://localhost:9090'
  )

  # Global object to hold topic objects, so that they
  # are accessible globally to other scripts
  window.topics = {}


  #------------------------------------------------
  # LOCAL VARIABLES
  #------------------------------------------------
  
  # Topic names should match those specified in the docs:
  # https://github.com/larsendt/xhab-spot/blob/master/notes/spot_topics_and_messages.md
  window._topics =
    alerts:
      type: 'display'
      ids:  [null]
    data:
      type: 'display'
      ids:  ['battery','camera','door','ec','fan','humidity',
             'lights','ph','pump','rotation','air_temperature',
             'water_temperature','water_level','valve']
    tasks:
      type: 'command'
      ids:   ['battery','camera','door','ec','fan','humidity',
              'lights','ph','pump','rotation','air_temperature',
              'water_temperature','water_level','valve']


  #-----------------------------------------
  # FUNCTIONS
  #-----------------------------------------
  
  # Create ROS topics
  create_topic = (topic_type, topic_id) ->
    n = 1 # n is the spot number, so we start with 1

    while n < 5 # build topics for spots 1-4
      spot_key = "spot#{n}"
      topics[topic_type] = {} if topics[topic_type] is undefined
      if topic_id is null
        topics[topic_type][spot_key] =
          new ROSLIB.Topic
            ros: ros
            name: "/#{topic_type}/#{spot_key}"
            messageType: 'std_msgs/Float32'
      else
        topics[topic_type][spot_key] = {} if topics[topic_type][spot_key] == undefined
        topics[topic_type][spot_key][topic_id] =
          new ROSLIB.Topic
            ros: ros
            name: "/#{topic_type}/#{spot_key}/#{topic_id}"
            messageType: 'std_msgs/Float32'
      n += 1

  # create topics and add to global topics object
  for topic_type, topic_attrs of _topics
    for topic_index, topic_id of topic_attrs.ids
      create_topic topic_type, topic_id
