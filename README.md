# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

# Instructions

The imageName has to be chosen! ("cmakeFight" could be a fitting name)

1. Build the image via (getting all dependencies will take some time) 
```shell
docker buildx build -t <imageName> .
```

2. Run the container

```shell
docker run -it --mount type=bind,src=.,dst=/mnt/host/cmake-exercise <imageName>
```

3. Change directory into the repo

```shell
cd cmake-exercise
```

4. Run the shell script (build folder should not exist beforehand!)

```shell
./build_and_run.sh
```

Expected output:

```markdown
Let's fight with CMake, Docker, and some dependencies!

Solve Poisson problem with FEM using deal.II
FEM results available in `solution.vtk`. Try visualizing with Paraview.

Modify a flat set using boost container
Elements in s1: 1       2       3       4

Inspect the current directory using boost filesystem
"." is a directory containing:
    "CMakeCache.txt"
    "CMakeFiles"
    "Makefile"
    "cmake_install.cmake"
    "main"
    "solution.vtk"

Parse some yaml file with yaml-cpp
  ../yamlParser/config.yml
Version: 1.2.3
```