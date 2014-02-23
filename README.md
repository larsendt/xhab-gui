This README assumes you are running Ubuntu, but the assumptions stop there.
Everything needed to set up and configure your development environment for the project is covered below.
Even if you have some of the prerequsisites already, its not a bad idea to skim over the sections to make sure you have everything set up.

##Prerequisites
###Install Ruby (using RVM)
The preferred method of managing Ruby installations is the Ruby Version Manager (RVM).
RVM allows you to have multiple versions of Ruby installed on your system so that you can use a specific Ruby version and gemset for each project.
This helps a team of developers on a project synchonize their development environments.
````bash
$ \curl -sSL https://get.rvm.io | bash -s stable
````
