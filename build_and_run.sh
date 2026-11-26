#!/usr/bin/env bash
set -e -o pipefail

PROJECT_DIR="$(dirname "$(realpath "$0")")"
cd "$PROJECT_DIR"

mkdir --parents build
cd build

if [[ ! -s /usr/local/lib/libyaml-cpp.so ]]; then
    rm -r yaml-cpp-yaml-cpp-0.6.3
    curl --silent --location \
        "https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz" \
        | tar --extract --gzip
    mkdir yaml-cpp-yaml-cpp-0.6.3/build
    cd yaml-cpp-yaml-cpp-0.6.3/build
    cmake -DYAML_BUILD_SHARED_LIBS=ON ..
    make install
    cd ../..
fi

cmake -DCMAKE_BUILD_TYPE=Debug ..
make
./cmake-exercise ../yamlParser/config.yml
