This README assumes you are running Ubuntu, but the assumptions stop there.
Everything needed to set up and configure your development environment for the project is covered below.
Even if you have some of the prerequsisites already, its not a bad idea to skim over the sections to make sure you have everything set up.

##Prerequisites

###Install dependencies

A few key packages should be installed first.

````bash
$ sudo apt-get install build-essential nodejs mysql-server mysql-client libmysqlclient-dev
````

###Install ROS

If you're not already running ROS, follow the [ROS installation instructions](http://wiki.ros.org/ROS/Installation) on ROS.org. ROS Groovy is being used for this project (due to limitations of some system components), so be sure that you follow the instructions for ROS Groovy.

###Install Ruby (using RVM)

The preferred method of managing Ruby installations is the Ruby Version Manager (RVM).
RVM allows you to have multiple versions of Ruby installed on your system so that you can use a specific Ruby version and gemset for each project.
This helps a team of developers on a project synchonize their development environments.

````bash
$ \curl -sSL https://get.rvm.io | bash -s stable
````
Once you've installed RVM, you'll need to close and reopen your shell in order for the rvm init scripts to run, setting up your environment.

Install the version of Ruby used for this project (2.1.0). This could take a few minutes, depending on your system specs.

````bash
$ rvm install 2.1.0
````

##Bootstrapping
To support UI development, the xhab_ui_dev ROS package is provided in this repository. The package provides two python nodes: data_generator.py and data_logger.py. The data_generator produces a simple sin wave of data, publishing data points each second on the dev/data topic. The data_logger subscribes to the topic and inserts each data point into a MySQL database. 

Using these two nodes, X-Hab UI developers have a means of generating and storing timeseries data so they can simulate realtime and historical plotting of the data during development.

The xhab_ui_dev package is found in the ros directory of this project.

###Create the database
````bash
# The data table has three columns:
# timetamp: UNIX timestamp
# source: Which component provided the data, e.g., 'spot3' or 'rogr'
# type: What sensor provided the data, e.g., 'ph', 'temp'
# value: unsigned float (the data)
$ mysql -u root -p<mysql_root_password>
mysql> CREATE DATABASE xhab_ui_dev;
mysql> use xhab_ui_dev;
mysql> CREATE TABLE data (timestamp INT(11), source VARCHAR(255), type VARCHAR(255), data FLOAT, INDEX timestamp USING BTREE (timestamp), INDEX source USING BTREE (source), INDEX type USING BTREE (type));
mysql> exit
````

###Install the package
The data_logger requires the python MySQL package, so be sure to install that before you build the package.
If you're using a python environment management system (like virtualenv), you may want to install the extension in the way that works for your environment.
If you're using a global python installation on your system, you can grab the extension using apt-get.

````bash
$ sudo apt-get install python-mysqldb
````

####Using catkin
Add the xhab_ui_dev directory to your catkin workspace and build it.

````bash
# Replace path elements in <> with your own.
$ cp -r <xhab-ui-dir>/ros/xhab_ui_dev <your_catkin_ws>/
$ catkin_make --source xhab_ui_dev/
````

####Using rosbuild
TODO.

###Running the dev nodes
You'll need to update the MySQL database connection credentials in data_logger.py on Line 7:

````python
# in xhab_ui_dev/scripts/data_logger.rb
...
# Line 7:
db = MySQLdb.connect("localhost","root","<root_password>","xhab_ui_dev" )
...
````

````bash
$ rosrun xhab_ui_dev data_generator.py
$ rosrun xhab_ui_dev data_logger.py
````

##Running the application
From within the Rails root directory (the directory containing this README),  
