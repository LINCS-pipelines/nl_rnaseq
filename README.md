# Neurolincs_rna-seq: Docker container for generating Neurolincs RNA-seq signature (Step-2) in RStudio

This docker container is developed to create Neurolincs RNA-seq level 4 signature data from level 3 counts data. The docker has been tested on Neurolincs level 3 data downloaded from [`Lincs data portal`](http://lincsportal.ccs.miami.edu/datasets/#/view/LDS-1398).
The docker has been tested for all of the on Linux (Ubuntu 14.04 and 16.04), macOS (10.11.6), and Windows (Windows 7 Enterprise). 

---
### Installation of Docker

Ubuntu: follow [`the instructions`](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) to get Docker CE for Ubuntu.


Mac: follow [`the instructions`](https://store.docker.com/editions/community/docker-ce-desktop-mac) to install [`the Stable verion of Docker CE`](https://download.docker.com/mac/stable/Docker.dmg) on Mac.

Windows: follow [`the instructions`](https://docs.docker.com/toolbox/toolbox_install_windows/) to install [`Docker Tookbox`](https://download.docker.com/win/stable/DockerToolbox.exe) on Windows.

---
### Download and run the docker container
To obtain the docker image and run the container,
```
[sudo] docker pull ucbd2k/neurolincs_rna-seq:v1
```
Linux users may need to use `sudo` to run Docker.

To run the container execute the following command:

```
[sudo] docker run -d -p <an available port>:8787 ucbd2k/neurolincs_rna-seq:v1
```
Typically one can use port 8787 if not already used by another application. In that case the commad is

```
[sudo] docker run -d -p 8787:8787 ucbd2k/neurolincs_rna-seq:v1
```


First make sure that port 8787 is free to use for the rstudio, (Typically rstudio dockers run on this port, if this port is free ignore the rest of this section). You can stop and kill any othe docker containers on this port by

```
[sudo] docker stop <container ID> && docker rm <container ID>
```
To know the container ID run this command:
```
docker ps -a
```
---

To start an RStudio session, open a browser and type in the address bar `http://localhost:8787` on Mac or Linux systems when 8787 port is used.

Host URL on Ubuntu and Mac is `localhost`, if accessed locally. On Windows, the IP is shown when Docker is launched by double-clicking the Docker Quickstart Terminal icon on desktop, or it can be obtained from the output of `docker-machine ls` in the interactive shell window.

---
### Execute the processing pipeline

After entring the rstudio environment, type the following command in the console:

``` 
source("process_neurolincs_data.R")
```

You can just run the pipeline for the given dataset ("LDS-1398"). The pipeline will generate the signature data and save the data as .csv file in the working directory. 

---
