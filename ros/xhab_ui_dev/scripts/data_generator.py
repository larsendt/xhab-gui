#!/usr/bin/env python
import rospy
import math
from std_msgs.msg import Float32

def talker():
  pub = rospy.Publisher('dev/data', Float32)
  rospy.init_node('data_generator')
  i = 0
  while not rospy.is_shutdown():
    y = math.sin(math.radians(i)) + 1
    rospy.loginfo(y)
    pub.publish(Float32(y))
    rospy.sleep(1.0)
    i += 1

if __name__ == '__main__':
  try:
    talker()
  except rospy.ROSInterruptException:
    pass
