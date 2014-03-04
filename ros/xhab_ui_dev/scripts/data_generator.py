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

  pwr_pub  = [rospy.Publisher('data/spot1/battery', Float32),
              rospy.Publisher('data/spot2/battery', Float32),
              rospy.Publisher('data/spot3/battery', Float32),
              rospy.Publisher('data/spot4/battery', Float32)]

  res_pub  = [rospy.Publisher('data/spot1/res_level', Float32),
              rospy.Publisher('data/spot2/res_level', Float32),
              rospy.Publisher('data/spot3/res_level', Float32),
              rospy.Publisher('data/spot4/res_level', Float32)]

  rospy.init_node('data_generator')
  
  ph      = [10, 60, 160, 240]
  ec      = [50, 0, 300, 250]
  temp    = [200, 340, 30, 100]
  rh      = [90, 80, 20, 200]
  pwr     = [0, 100, 300, 200]
  res     = [100, 300, 200, 0]

  offset = 0
  while not rospy.is_shutdown():
    # ph
    for i in range (0,4):
      y = math.sin(math.radians(ph[i]+offset)) + 6
      rospy.loginfo(y)
      ph_pub[i].publish(Float32(y))
  
    # electrical conductivity
    for i in range (0,4):
      y = (math.sin(math.radians(ec[i]+offset)) + 1 ) / 10 + 0.4 
      rospy.loginfo(y)
      ec_pub[i].publish(Float32(y))

    # temperature
    for i in range (0,4):
      y = (math.sin(math.radians(temp[i]+offset)) + 65) * 1.25
      rospy.loginfo(y)
      temp_pub[i].publish(Float32(y))

    # relative humidity
    for i in range (0,4):
      y = (math.sin(math.radians(rh[i]+offset)) + 60) * 1.5
      rospy.loginfo(y)
      rh_pub[i].publish(Float32(y))

    # battery power
    for i in range (0,4):
      y = (math.sin(math.radians(pwr[i]+offset)) + 1) / 2
      rospy.loginfo(y)
      pwr_pub[i].publish(Float32(y))

    # reservoir level
    for i in range (0,4):
      y = (math.sin(math.radians(res[i]+offset)) + 1) / 2
      rospy.loginfo(y)
      res_pub[i].publish(Float32(y))

    offset += 1
    rospy.sleep(10.0)

if __name__ == '__main__':
  try:
    talker()
  except rospy.ROSInterruptException:
    pass
