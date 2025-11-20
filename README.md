# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

It contains a simple C++ project that depends on `yaml-cpp` and `Boost`. The goal is to create a `Dockerfile` that builds the project inside a Docker container.

## Instructions
1. Build docker image with: 
   ```bash
   docker buildx build -t cmake-exercise .
   ```
   - Uses an appropriate base image (e.g., `ubuntu:24.04`).
   - Installs necessary build tools and dependencies.
   - Downloads and installs `yaml-cpp` version `0.6.3` from source.
   - Copies the project files into the container.
   - Builds the project using CMake.

2. Run the docker container and mount the current directory to inspect the build:
   ```bash
   docker run -it --mount type=bind,src=.,dst=/mnt/hst cmake-exercise
   ```
    - The container will run build_and_run.sh script to build and execute the project.

3. Verify the output of the program.
