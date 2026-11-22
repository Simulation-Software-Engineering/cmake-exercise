FROM ubuntu:24.04

RUN <<EOF
apt-get update -y && apt-get install -y build-essential \
    cmake unzip wget vim libboost-all-dev libdeal.ii-dev
cd /tmp
wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz
tar -xzf yaml-cpp-0.6.3.tar.gz
cd yaml-cpp-yaml-cpp-0.6.3
mkdir build && cd build
cmake ..
make
make install
EOF

COPY  . /cmake-exercise/

CMD [ "/bin/bash" ]


