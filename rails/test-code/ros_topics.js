//Moving the Arm
function DriveArm()
{
  // Publishing a Topic
var cmdVel = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/arm',
       messageType : 'xhab_rogr/Data'

     });
   
var twist = new ROSLIB.Message({ shoulder1_angle:180,
shoulder2_angle:180,
elbow1_angle:180,
elbow2_angle:280,
wrist_angle:45,
endeffector_angle:360});
       
cmdVel.publish(twist);
}

//Moving the Turret
function MoveTurret()
{

// Publishing a Topic
var turretVel = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/cameraturret',
       messageType : 'xhab_rogr/Data'

     });
var turret = new ROSLIB.Message({ tilt:45,
pan:45});
       
turretVel.publish(turret);
}

//Distance Sensors
function Front()
{
// Publishing a Topic
var front = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/range',
       messageType : 'xhab_rogr/Data'

     });
var frontSensor = new ROSLIB.Message({range_sensor_id:0});
front.publish(frontSensor);
}

function Back()
{
// Publishing a Topic
var back = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/range',
       messageType : 'xhab_rogr/Data'

     });
var backSensor = new ROSLIB.Message({range_sensor_id:1});
back.publish(backSensor);
}

function Left()
{
// Publishing a Topic
var left = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/range',
       messageType : 'xhab_rogr/Data'

     });
var leftSensor = new ROSLIB.Message({range_sensor_id:2});
left.publish(leftSensor);
}

function Right()
{
// Publishing a Topic
var right = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/range',
       messageType : 'xhab_rogr/Data'

     });
var rightSensor = new ROSLIB.Message({range_sensor_id:3});
right.publish(rightSensor);
}

//Toggling water pump 
function WaterPumpOn()
{
	var on = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/',
       messageType : 'xhab_rogr/Data'

     });
var rightSensor = new ROSLIB.Message({range_sensor_id:3});
right.publish(rightSensor);
}

function WaterPumpOff()
{

}

//Toggling nutrient Pump
function NutPumpOn()
{

	var on = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/nutrientpump',
       messageType : 'xhab_rogr/Data'

     });
var pumpSensor = new ROSLIB.Message({ nutrient_pump_status:1});
on.publish(pumpSensor);
}
function NutPumpOff()
{
	
	var off = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/nutrientpump',
       messageType : 'xhab_rogr/Data'

     });
var pumpSensor = new ROSLIB.Message({nutrient_pump_status:0});
off.publish(pumpSensor);
}

//Pressure Sensor
function getPressure1()
{

	var p1 = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/pressure',
       messageType : 'xhab_rogr/Data'

     });
var pressureSensor = new ROSLIB.Message({ pressure_sensor_id:0});
p1.publish(pressureSensor);
}
function getPressure2()
{
	
	var p2 = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/pressure',
       messageType : 'xhab_rogr/Data'

     });
var pressureSensor = new ROSLIB.Message({pressure_sensor_id:1});
p2.publish(pressureSensor);
}

//Lift
function executeLift()
{
	var lift = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/lift',
       messageType : 'xhab_rogr/LiftingTask'

     });
var l = new ROSLIB.Message({lift:0});
lift.publish(l);
}

//Drive
function Forward()
{
var forward = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
forward.publish(drive);
}

function Back()
{
var back = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
back.publish(drive);
}

function Left()
{
var left = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
left.publish(drive);
}

function Right()
{
var right = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
right.publish(drive);
}

function LeftUp()
{
var leftup = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
leftup.publish(drive);
}

function RightUp()
{
var rightup = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
rightup.publish(drive);
}

function LeftDown()
{
var leftdown = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
leftdown.publish(drive);
}

function RightDown()
{
var rightdown = new ROSLIB.Topic({
       ros : ros,
       name : '/tasks/rogr/drive',
       messageType : 'xhab_rogr/DrivingTask'

     });
var drive = new ROSLIB.Message({ trans_x:0 ,
trans_y:0,
rot:0});
rightdown.publish(drive);
}


	

