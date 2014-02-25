ros = new ROSLIB.Ros({
  url : 'ws://localhost:9090'
});

window.topics = {
  data: new ROSLIB.Topic({ ros: ros, name: '/dev/data', messageType: 'std_msgs/Float32' }) 
}
