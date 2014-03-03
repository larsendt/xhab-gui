#!/usr/bin/env python
import rospy
import math
from std_msgs.msg import Float32

def talker():
  ph_pub   = [rospy.Publisher('data/spot1/ph', Float32),
              rospy.Publisher('data/spot2/ph', Float32),
              rospy.Publisher('data/spot3/ph', Float32),
              rospy.Publisher('data/spot4/ph', Float32)]
  
  ec_pub   = [rospy.Publisher('data/spot1/ec', Float32),
              rospy.Publisher('data/spot2/ec', Float32),
              rospy.Publisher('data/spot3/ec', Float32),
              rospy.Publisher('data/spot4/ec', Float32)]
  
  temp_pub = [rospy.Publisher('data/spot1/temp', Float32),
              rospy.Publisher('data/spot2/temp', Float32),
              rospy.Publisher('data/spot3/temp', Float32),
              rospy.Publisher('data/spot4/temp', Float32)]
  
  rh_pub   = [rospy.Publisher('data/spot1/rh', Float32),
              rospy.Publisher('data/spot2/rh', Float32),
              rospy.Publisher('data/spot3/rh', Float32),
              rospy.Publisher('data/spot4/rh', Float32)]

  rospy.init_node('data_generator')
  
  ph    = [10, 60, 160, 240]
  ec    = [50, 0, 300, 250]
  temp  = [200, 340, 30, 100]
  rh    = [90, 80, 20, 200]

  offset = 0
  while not rospy.is_shutdown():
    # ph
    for i in range (0,4):
      y = math.sin(math.radians(ph[i]+offset)) + 6
      rospy.loginfo(y)
      ph_pub[i].publish(Float32(y))
  
    # ec
    for i in range (0,4):
      y = (math.sin(math.radians(ec[i]+offset)) + 1 ) / 10 + 0.4 
      rospy.loginfo(y)
      ec_pub[i].publish(Float32(y))

    # temp
    for i in range (0,4):
      y = (math.sin(math.radians(temp[i]+offset)) + 65) * 1.25
      rospy.loginfo(y)
      temp_pub[i].publish(Float32(y))

    # rh
    for i in range (0,4):
      y = (math.sin(math.radians(rh[i]+offset)) + 60) * 1.5
      rospy.loginfo(y)
      rh_pub[i].publish(Float32(y))

    offset += 1
    rospy.sleep(10.0)

if __name__ == '__main__':
  try:
    talker()
  except rospy.ROSInterruptException:
    pass
