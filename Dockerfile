FROM ubuntu:20.04

# mount directory
ADD . /cmake-exercise
WORKDIR cmake-exercise

# init locale
RUN chmod +x inittimezone
COPY inittimezone /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

# install helpful packages
RUN apt-get update && apt-get install -y \
	build-essential \
	cmake \
	git \
	wget \
	vim
	
# install dependencies
RUN apt-get install -y \
	libboost-all-dev \
	libdeal.ii-dev

# run main
RUN rm -rf build
RUN mkdir build && cd build && cmake ..
RUN make
RUN ./main
