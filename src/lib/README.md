# ~#PROJECT#~

*~#SHORTDESCRIPTION#~*

* **category**    Library
* **copyright**   ~#CURRENTYEAR#~ ~#OWNER#~
* **license**     see [LICENSE](LICENSE)
* **link**        ~#PROJECTLINK#~


## Description

~#SHORTDESCRIPTION#~


## Quick Start

This project includes a Makefile that allows you to test and build the project in a Linux-compatible system with simple commands.

To see all available options:
```
make help
```

To build and test the project inside a Conda environment:  
```
make build
```

To build the project inside a Docker container (requires Docker):
```
make dbuild
```

An arbitrary make target can be executed inside a Docker container by specifying the "MAKETARGET" parameter:
```
MAKETARGET='build' make dbuild
```
The list of make targets can be obtained by typing ```make```


The base Docker building environment is defined in the following Dockerfile:
```
resources/Docker/Dockerfile.dev
```
