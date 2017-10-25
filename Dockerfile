###########################################################
# Dockerfile to build star container images
# Based on Ubuntu
############################################################
#Build the image based on Ubuntu
FROM ubuntu:16.04

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

#Install required packages in ubuntu
RUN apt-get update \
RUN apt-get install --yes \
 build-essential \
 gcc-multilib \
 apt-utils \
 zlib1g-dev \
 git
 
#Install STAR
WORKDIR /usr/local/
RUN git clone https://github.com/alexdobin/STAR.git
WORKDIR /usr/local/STAR/
RUN git checkout 2.5.2b
WORKDIR /usr/local/STAR/source
RUN make STAR
ENV PATH /usr/local/STAR/source:$PATH

#Set Workingdir at Home
WORKDIR /

#Cluster
#USER 10008:9001
#Local
#USER 1001:1001
