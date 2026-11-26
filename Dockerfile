FROM docker.io/ubuntu:24.04

WORKDIR /root/builder

RUN apt update -qq && apt install -y -qq build-essential cmake curl libboost-all-dev libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl --silent --location \
        "https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz" \
        | tar --extract --gzip \
    && mkdir yaml-cpp-yaml-cpp-0.6.3/build \
    && cd yaml-cpp-yaml-cpp-0.6.3/build \
    && cmake -DYAML_BUILD_SHARED_LIBS=ON .. \
    && make install \
    && cd ../.. \
    && rm -r yaml-cpp-yaml-cpp-0.6.3

COPY ./ ./
ENV LD_LIBRARY_PATH=/usr/local/lib
RUN mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Debug .. \
    && make \
    && mv cmake-exercise /usr/local/bin/cmake-exercise \
    && cd .. \
    && rm -r build

CMD [ "cmake-exercise", "yamlParser/config.yml" ]
