# Dockerfile for RevBayes

## Install RevBayes Docker image
To install using Docker, first install [Docker](https://docs.docker.com/install/). Once
Docker is installed move into the directory where you have cloned this repo (in OSX you
will do this via terminal and in Windows using a UNIX terminal emulator (e.g. git bash, putty).
Once inside that directory run  the following command to build the docker file:

    docker build --rm --force-rm -t wadedismukes/revbayes .

Now you can run and use the image in an interactive shell.

    docker run -it --name revbayes wadedismukes/revbayes 

Or if you would like to have a directory from your computer available on the
docker image you could type something like:

    docker run -it -v /host/path/:/container/path --name revbayes wadedismukes/revbayes

Replacing `/host/path/` and `/container/path/` with whichever directory
you would like to have in the container and whatever path you would like to use
inside of the container. This will allow you to work in that directory generating simulated data 
that you can then use outside of the container. In either case of running the image for Windows machines
you will need to prepend the command `winpty` before `docker ...`.
