#!/usr/bin/env bash
set -euo pipefail

mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j"$(nproc 2>/dev/null || echo 1)"
./main ../yamlParser/config.yml