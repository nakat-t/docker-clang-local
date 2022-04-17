# Supported tags

* `latest`, `14`
* `13`
* `12`
* `11`
* `10`
* `9`
* `8`
* `9`
* `6.0`
* `5.0`
* `4.0`
* `3.9`
* `3.7`

# Introduction

A personal docker image for C/C++ builds with clang and some software added.

# How to use this image

Mount the directory containing your source files on `/data` and run the container.

```
docker run -it --rm -v $PWD:/data nakatt/clang make
```
