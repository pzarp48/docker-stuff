#
# Each instruction in this file generates a new layer that gets pushed to your local image cache
#

#
# Lines preceeded by # are regarded as comments and ignored
#

#
# Identify the maintainer of an image
# LABEL maintainer="goran.vallfors@gmail.com"

#
# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#
# The default user all commands will be run as within any container created from this image
#USER gova

#
# Working directory for the command defined in the “ENTRYPOINT” or “CMD” instructions
#WORKDIR /home

#
# Update the image to the latest packages
# and install common packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gosu \
    sudo \
    apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#
# Install python3
RUN apt-get update && apt-get install --yes --no-install-recommends \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install python packages
RUN mkdir /opt/python3
COPY requirements.txt /opt/python3
RUN pip3 install -r /opt/python3/requirements.txt

#
# Copy hello.py script to home dir
ADD ./hello.py /tmp/hello.py

#
# Run hello.py
#CMD python3 /tmp/hello.py

#
# Create Docker user for devcontainer (cannot be done at runtime by entrypoint.sh)
#RUN adduser docker

#
# Entrypoint, if it is last here makes it easy to build new image without rebuilding all layers
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]


#
# Define an entrypoint when the container starts
#ENTRYPOINT python3 ./hello.py

#
# Expose port 80
#EXPOSE 80

#
# Last is the actual command to start up NGINX within our Container
#CMD ["nginx", "-g", "daemon off;"]

# Create Docker user for devcontainer (cannot be done at runtime by entrypoint.sh)
RUN adduser docker --gecos "docker user" --disabled-password
