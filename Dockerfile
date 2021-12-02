From ubuntu:20.04

COPY inittimezone /usr/local/bin/inittimezone

# Run inittimezone and install a few dependencies
RUN apt-get -qq update && \
    inittimezone && \
    apt-get -qq -y install \
        build-essential \
        cmake \
        g++ \
        git \
        libboost-all-dev \
        wget \
        libdeal.ii-dev \
        vim
    
# This is some strang Docker problem. Normally, you don't need to add /usr/local/lib to LIBRARY_PATH
ENV LIBRARY_PATH $LIBRARY_PATH:/usr/local/lib/

# Get, unpack, build, and install yaml-cpp        
RUN mkdir Software && cd Software && \
    wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.7.0.tar.gz && \
    tar -xvzf yaml-cpp-0.7.0.tar.gz && \
    cd yaml-cpp-yaml-cpp-0.7.0 && mkdir build && cd build && \
    cmake -DYAML_BUILD_SHARED_LIBS=OFF .. && make -j4 && make install

# I just copy the complete folder to the container
ADD . /cmake-exercise
CMD ["/bin/bash"]
