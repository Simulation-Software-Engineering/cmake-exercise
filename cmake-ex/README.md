# Let's fight with CMake, Docker, and some dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/building-and-packaging/material/exercise_cmake_text.md).

Before you start, make sure, the files needed are all in a folder called `cmake-ex/`, which has to be in the folder where your current working directory is.

Let the container run by typing

```
{
sudo docker build -t ubuntu:20.04 .
sudo docker container create ubuntu:20.04
sudo docker run -t -d --name NAME_OF_CONTAINER ubuntu:20.04
sudo docker exec -it NAME_OF_CONTAINER bash
}
```

and then execute the executable in `/cmake-exercise/build/`.


