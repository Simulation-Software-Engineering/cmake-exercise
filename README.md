# Let's fight with CMake, Docker, and some dependencies

## Prerequesites:

- docker >= 20

## Building

### In docker

There is a helper script that builds the docker image and afterwards builds the project.
To call it, simply run

```sh
./helper_scripts/build_in_docker
```

However, the docker image is quite heavy as it needs around 2.5GB storage.

## Running

### In docker

This requires the first helper script to be run already as it uses the same image.

```sh
./helper_scripts/run_in_docker
```
