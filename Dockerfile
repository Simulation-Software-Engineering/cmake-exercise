FROM ubuntu:20.04

COPY inittimezone /usr/local/bin/inittimezone

RUN inittimezone && apt update -y && apt install -y build-essential cmake libboost-all-dev libdeal.ii-dev git wget vim htop sudo
RUN apt install -y curl

# Cleanup
RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN rm -rf /tmp/*

# Create user
ARG USER_NAME=alex
ARG USER_HOME=/home/${USER_NAME}
#ARG USER_ID=1000
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g $GROUP_ID "$USER_NAME"
RUN adduser \
    --home "$USER_HOME" \
    --uid $USER_ID \
    --gid $GROUP_ID \
    --disabled-password \
    "$USER_NAME"

RUN echo "$USER_NAME" ALL=\(root\) NOPASSWD:ALL > "/etc/sudoers.d/$USER_NAME" && \
    chmod 0440 "/etc/sudoers.d/$USER_NAME"

USER "$USER_NAME"
WORKDIR "$USER_HOME"

RUN git clone https://github.com/ajaust/dotfiles.git && cd dotfiles && ./setup_dotfiles.sh && curl -L https://raw.github.com/git/git/v$(git --version | cut -d' ' -f3)/contrib/completion/git-prompt.sh > ~/.git-prompt.sh

# Install yaml-cpp version 0.7.0
RUN git clone -b yaml-cpp-0.7.0 https://github.com/jbeder/yaml-cpp.git yaml-cpp && cd yaml-cpp/ &&mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=${HOME}/software/yaml-cpp/0.7.0 -DYAML_BUILD_SHARED_LIBS=ON .. && make -j && make test && make install

# Overwrite generated cmake file from yaml-cpp
COPY yaml-cpp-config.cmake_fixed ${USER_HOME}/software/yaml-cpp/0.7.0/share/cmake/yaml-cpp/yaml-cpp-config.cmake
COPY build-project.sh ${USER_HOME}/bin/build-project.sh
ENV PATH ${USER_HOME}/bin:${PATH}

CMD ["bash"]