# docker-stuff

### To build image "gvallfo/my-custom-ubuntu:1.00"

    $ docker build -t gvallfo/my-custom-ubuntu:1.00 my-custom-ubuntu/

### To run container from image "gvallfo/my-custom-ubuntu:1.00"

    $ docker run -it --rm -v ~/wa:/tmp/wa gvallfo/my-custom-ubuntu:1.00 /bin/bash
