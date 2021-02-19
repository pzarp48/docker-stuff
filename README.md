# docker-stuff

### To build image "my-custom-ubuntu:1.00"

    $ docker build -t my-custom-ubuntu:1.00 my-custom-ubuntu/

### To run container from image "my-custom-ubuntu:1.00"

    $ docker run -it --rm -v ~/wa:/tmp/wa my-custom-ubuntu:1.00 /bin/bash
