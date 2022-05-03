# ServiceX-JupyterLab-Container

This docker image allows the user to run an arbitrary number of instances of jupyterlab in which are contained a number of packages
including the servicex and servicex_clients packages, which allow it, when given an authorization token in the form of a servicex.yaml file, to connect to ServiceX.

It also contains two demos to test the connection to Servicex and the functionality of a few of the packages.

In order to open a container with the token file, called servicex.yaml, you'll need to have it on the host machine somewhere.
If you do, you can then run this command, replacing the source path with the path to the file on the host. No other fields need to be modified, but the ports in the -p option need to be changed if you want to run multiple instances.


```
docker run --rm -p 8888:8888 --mount type=bind,src=host\path\to\your\servicex.yaml,target=/home/jovyan/servicex.yaml cmccubbin/jupyterlab_servicex_image
```
Then, open the localhost port in your browser, or use one of the links in the container's CLI.
The jupyterhub may ask you for a token. _This is not the servicex token._ Click on the name of the container in docker desktop and look at the bottom of the log. Where is says to "copy and paste one of these urls", look at either url and select JUST THE PART AFTER "token=". Paste this token into the query box in the tab in your browser, and it should let you in.

Great! Now you should recognize the cozy, familiar screen layout of jupyterlab, with the directories on the right, and the workspace in the middle. If your servicex.yaml file is not in the directory with the demos, something has gone wrong. If it is there, open either demo and run the code to test if you can access ServiceX. If a graph or table shows up as output, everything works! 