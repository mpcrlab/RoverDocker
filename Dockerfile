FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Michael Teti

RUN apt-get -y update && apt-get install -y \
    python-opencv \
    firefox \ 
    nano \
    git \
    python-tk

ENV USER root

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 xfce4-goodies vnc4server \
    synaptic  

RUN pip install tflearn \
    pygame \
    h5py 

EXPOSE 8888 5901 6006

RUN cd /root && \
    git clone https://github.com/mpcrlab/RoverDocker.git && \
    cp -r /root/RoverDocker/.vnc /root && \
    chmod +x /root/.vnc/xstartup 

CMD ["/root/.vnc/xstartup"]


#https://tjosm.com/5219/install-remote-desktop-vnc-ubuntu-16-04-server/
#https://hub.docker.com/r/wusuopu/tensorflow-opencv/~/dockerfile/
