# ServiceX-JupyterLab-Container

This docker image allows the user to run an arbitrary number of instances of jupyterlab in which are contained a number of packages
including the servicex and servicex_clients packages, which allow it, when given an authorization token in the form of a servicex.yaml file, to connect to ServiceX.

It also contains two demos to test the connection to Servicex and the functionality of a few of the packages.

Here is the current method that I have been using to run this image. It is through docker desktop rather than the command line because tags are hard and I still haven't figured that one out yet. If I have figured it out, and haven't updated this readme, that's an issue, but it's my problem and not yours. If you're reading this from inside the instance of jupyterlab, hi!

In order to get the servicex.yaml file, your token which validates you and allows you to access ServiceX's data, into the container, you will have to do one of two things.

The cheating method is to run the container as normal, 

`docker run (thenameofthisimage)` 

and once it's open, create a new file, specify the filetype as a .yaml, and then copy the entire contents of your servicex.yaml file into it. This should work.

The proper way to do it, but which takes a comparable amount of time, is to use a bind mount.

Go to the images tab in docker desktop, and find this image. Click run, and open the optional settings dropdown.
In the "host path" box, paste the path where your servicex.yaml is on the host machine. 

_Make sure the path is not in quotes._

Then, in the target path box, put /home/jovyan/servicex.yaml

Again, make sure it is not in quotes.

Specify a name and a port, and hit run. Your container should now be running. In the containers tab, select the container you just created and click the "open in browser" button. You could open localhost with the port you specified, but I have found this not to work consistently. The jupyterhub should ask you for a token. _This is not the servicex token._ Click on the name of the container in docker desktop and look at the bottom of the log. Where is says to "copy and paste one of these urls", look at either url and select JUST THE PART AFTER "token=". Paste this token into the query box in the tab in your browser, and it should let you in.

Great! Now you should recognize the cozy, familiar screen layout of jupyterlab, with the directories on the right, and the workspace in the middle. If your servicex.yaml file is not in the directory with the demos, something has gone wrong. If it is there, open either demo and run the code to test if you can access ServiceX. If a graph or table shows up as output, everything works! 