#XHAB GUI

This is one of three repositories for CU Boulder's XHAB project. It contains all of the code for the GUI, as well as a helper ROS package that provides mock data in realtime, and stores the mock data to a MySQL database.

This README assumes you are running Ubuntu, but the assumptions stop there.
Everything needed to set up and configure your development environment for the project is covered below.
Even if you have some of the prerequsisites already, its not a bad idea to skim over the sections to make sure you have everything set up.

=======

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
There are probably several ways to get the package registered with ROS and working in your environment. This symlink method seems to work fine. You'll create a symlink within your catkin workspace ```src``` directory to the package in your clone of the repository.


````bash
# Replace path elements in <> with your own.
# Run the following from your catkin workspace root directory:
$ sudo ln -s <path_to_repo>/ros/xhab_ui_dev src/
$ catkin_make
````

####Using rosbuild
TODO.

###Running the dev nodes
You'll need to update the MySQL database connection credentials in data_logger.py on Line 7:

````python
# in ros/xhab_ui_dev/scripts/data_logger.rb
...
# Line 7:
db = MySQLdb.connect("localhost","root","<root_password>","xhab_ui_dev" )
...
````

Run the nodes.

````bash
$ rosrun xhab_ui_dev data_generator.py
$ rosrun xhab_ui_dev data_logger.py
````

Keep tabs on your database. It'll start filling up with data as the logger inserts new rows about once a second.

##Running the application
From within the Rails root directory (the /rails directory in this repo), you can start the default Rails server on the default port 3000.

````bash
$ rails s
````

Once the server is running, point your browser to http://localhost:3000 to access the application.
