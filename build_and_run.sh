#!/usr/bin/env bash

mkdir build
cd build

# config yamlcpp
YAMLCPP_VER="0.6.3"
YAMLCPP_TGZ="yaml-cpp-${YAMLCPP_VER}.tar.gz"
YAMLCPP_URL="https://github.com/jbeder/yaml-cpp/archive/refs/tags/${YAMLCPP_TGZ}"
PREFIX_DIR="$(pwd)/.third_party/yaml-cpp-${YAMLCPP_VER}"

# download yamlcpp
mkdir -p .build-yamlcpp
if [ ! -f ".build-yamlcpp/${YAMLCPP_TGZ}" ]; then
  echo "[yaml-cpp] downloading ${YAMLCPP_URL}"
  wget -O ".build-yamlcpp/${YAMLCPP_TGZ}" "${YAMLCPP_URL}"
fi

# extract yamlcpp
if [ ! -d ".build-yamlcpp/yaml-cpp-src-${YAMLCPP_VER}" ]; then
  echo "[yaml-cpp] extracting"
  tar -xzf ".build-yamlcpp/${YAMLCPP_TGZ}" -C .build-yamlcpp
  mv ".build-yamlcpp/yaml-cpp-yaml-cpp-${YAMLCPP_VER}" ".build-yamlcpp/yaml-cpp-src-${YAMLCPP_VER}"
fi

# build yamlcpp
mkdir -p ".build-yamlcpp/yaml-cpp-build-${YAMLCPP_VER}" "${PREFIX_DIR}"
cmake -S ".build-yamlcpp/yaml-cpp-src-${YAMLCPP_VER}" -B ".build-yamlcpp/yaml-cpp-build-${YAMLCPP_VER}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="${PREFIX_DIR}" \
  -DYAML_BUILD_SHARED_LIBS=ON \
  -DYAML_BUILD_TESTS=OFF \
  -DYAML_BUILD_TOOLS=OFF
cmake --build ".build-yamlcpp/yaml-cpp-build-${YAMLCPP_VER}" --target install -j


cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j
./sse_cmake_cpp ../yamlParser/config.yml
