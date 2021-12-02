# Let's fight with CMake, Docker, and some dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/building-and-packaging/material/exercise_cmake_text.md).

## Usefull comands

How to build an image
```
sudo docker build -t cmake-exercise-test-image .

How to run a image (with interactive mode)
```
sudo docker run -i -t cmake-exercise-test-image
```

How to mount the local directory to the docker container
```bash
sudo docker run -d -i -t --name exercise-cmake --mount type=bind,source="$(pwd)",target=/mnt/share ubuntu
```