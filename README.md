# Let's fight with CMake, Docker, and some dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/building-and-packaging/material/exercise_cmake_text.md).


# How to build and run with Docker

To build the image, run the following command in a terminal:

 ```
 docker build -t haagjn_cmake_exercise_image .
 ```

Then, use this to run:

 ```
 docker run -it haagjn_cmake_exercise_image
 ```

Navigate to the build folder and run the executable with:

 ```
 cd cmake-exercise/build
 ./main
 ```
