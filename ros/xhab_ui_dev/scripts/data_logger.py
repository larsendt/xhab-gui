#!/usr/bin/env python
import rospy
import MySQLdb
import time
from std_msgs.msg import Float32

db = MySQLdb.connect("localhost","root","","xhab_ui_dev" ) 
cursor = db.cursor()

def callback(data):
  try:
    cursor.execute('INSERT INTO data (timestamp, source, type, value) VALUES(%(timestamp)s, %(source)s, %(type)s, %(value)s)', { 'timestamp': time.time(), 'source': 'spot1', 'type': 'ph', 'value': str(data.data) })
    db.commit()
  except:
    db.rollback()
  
  rospy.loginfo(rospy.get_name() + ": Received %s" % data.data)

def listener():
  rospy.init_node('data_logger', anonymous=True)
  rospy.Subscriber("dev/data", Float32, callback)
  rospy.spin()

if __name__ == '__main__':
  listener()
