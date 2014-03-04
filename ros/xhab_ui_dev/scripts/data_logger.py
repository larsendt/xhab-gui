#!/usr/bin/env python
import rospy
import MySQLdb
import time
from std_msgs.msg import Float32

def callback_spot1_ph(data):
  insert_data('spot1', 'ph', data)

def callback_spot2_ph(data):
  insert_data('spot2', 'ph', data)

def callback_spot3_ph(data):
  insert_data('spot3', 'ph', data)

def callback_spot4_ph(data):
  insert_data('spot4', 'ph', data)

def callback_spot1_temp(data):
  insert_data('spot1', 'temp', data)

def callback_spot2_temp(data):
  insert_data('spot2', 'temp', data)

def callback_spot3_temp(data):
  insert_data('spot3', 'temp', data)

def callback_spot4_temp(data):
  insert_data('spot4', 'temp', data)

def callback_spot1_ec(data):
  insert_data('spot1', 'ec', data)

def callback_spot2_ec(data):
  insert_data('spot2', 'ec', data)

def callback_spot3_ec(data):
  insert_data('spot3', 'ec', data)

def callback_spot4_ec(data):
  insert_data('spot4', 'ec', data)

def callback_spot1_rh(data):
  insert_data('spot1', 'rh', data)

def callback_spot2_rh(data):
  insert_data('spot2', 'rh', data)

def callback_spot3_rh(data):
  insert_data('spot3', 'rh', data)

def callback_spot4_rh(data):
  insert_data('spot4', 'rh', data)

def callback_spot1_pwr(data):
  insert_data('spot1', 'battery', data)

def callback_spot2_pwr(data):
  insert_data('spot2', 'battery', data)

def callback_spot3_pwr(data):
  insert_data('spot3', 'battery', data)

def callback_spot4_pwr(data):
  insert_data('spot4', 'battery', data)

def callback_spot1_res(data):
  insert_data('spot1', 'res_level', data)

def callback_spot2_res(data):
  insert_data('spot2', 'res_level', data)

def callback_spot3_res(data):
  insert_data('spot3', 'res_level', data)

def callback_spot4_res(data):
  insert_data('spot4', 'res_level', data)

def insert_data(source, prop, data):
  db = MySQLdb.connect("localhost","root","","xhab_ui_dev" ) 
  cursor = db.cursor()
  try:
    cursor.execute('INSERT INTO data (timestamp, source, property, value) VALUES(%(timestamp)s, %(source)s, %(property)s, %(value)s)'
, { 'timestamp': time.time(), 'source': source, 'property': prop, 'value': data.data })
    db.commit()
  except:
    db.rollback()

  db.close()

def listener():
  rospy.init_node('data_logger', anonymous=True)
  rospy.Subscriber("data/spot1/ph", Float32, callback_spot1_ph)
  rospy.Subscriber("data/spot2/ph", Float32, callback_spot2_ph)
  rospy.Subscriber("data/spot3/ph", Float32, callback_spot3_ph)
  rospy.Subscriber("data/spot4/ph", Float32, callback_spot4_ph)
  rospy.Subscriber("data/spot1/ec", Float32, callback_spot1_ec)
  rospy.Subscriber("data/spot2/ec", Float32, callback_spot2_ec)
  rospy.Subscriber("data/spot3/ec", Float32, callback_spot3_ec)
  rospy.Subscriber("data/spot4/ec", Float32, callback_spot4_ec)
  rospy.Subscriber("data/spot1/temp", Float32, callback_spot1_temp)
  rospy.Subscriber("data/spot2/temp", Float32, callback_spot2_temp)
  rospy.Subscriber("data/spot3/temp", Float32, callback_spot3_temp)
  rospy.Subscriber("data/spot4/temp", Float32, callback_spot4_temp)
  rospy.Subscriber("data/spot1/rh", Float32, callback_spot1_rh)
  rospy.Subscriber("data/spot2/rh", Float32, callback_spot2_rh)
  rospy.Subscriber("data/spot3/rh", Float32, callback_spot3_rh)
  rospy.Subscriber("data/spot4/rh", Float32, callback_spot4_rh)
  rospy.Subscriber("data/spot1/battery", Float32, callback_spot1_pwr)
  rospy.Subscriber("data/spot2/battery", Float32, callback_spot2_pwr)
  rospy.Subscriber("data/spot3/battery", Float32, callback_spot3_pwr)
  rospy.Subscriber("data/spot4/battery", Float32, callback_spot4_pwr)
  rospy.Subscriber("data/spot1/res_level", Float32, callback_spot1_res)
  rospy.Subscriber("data/spot2/res_level", Float32, callback_spot2_res)
  rospy.Subscriber("data/spot3/res_level", Float32, callback_spot3_res)
  rospy.Subscriber("data/spot4/res_level", Float32, callback_spot4_res)
  rospy.spin()
 
if __name__ == '__main__':
  listener() 
