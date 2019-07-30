# MAKEFILE
#
# @author      ~#OWNER#~ <~#OWNEREMAIL#~>
# @link        ~#PROJECTLINK#~
# ------------------------------------------------------------------------------

# Project name
PROJECT=~#PROJECT#~

# Project version
VERSION=$(shell cat VERSION)

# Project release number (packaging build number)
RELEASE=$(shell cat RELEASE)

# Include conda channels
include conda/channels.mk

# Conda environment
CONDA_ENV=../env-${PROJECT}

# Current directory
CURRENTDIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# --- MAKE TARGETS ---

# Display general help about this command
.PHONY: help
help:
	@echo ""
	@echo "~#PROJECT#~ Makefile."
	@echo "The following commands are available:"
	@echo ""
	@echo "    make version    : Set version from VERSION file"
	@echo "    make init       : Initialize the project"
	@echo "    make conda      : Build minimal Conda environment"
	@echo "    make conda_dev  : Build development Conda environment"
	@echo "    make build      : Build a Conda package"
	@echo "    make dbuild     : Build everything inside a Docker container"
	@echo "    make test       : Execute test command"
	@echo "    make clean      : Remove any build artifact"
	@echo ""

all: clean format conda

# Set the version from VERSION file
.PHONY: version
version:
	sed -i "s/version:.*$$/version: $(VERSION)/" conda/meta.yaml
	sed -i "s/number:.*$$/number: $(RELEASE)/" conda/meta.yaml
	sed -i "s/Version:.*$$/Version: $(VERSION).$(RELEASE)/" ~#PROJECT#~/DESCRIPTION

# Initialize the project
.PHONY: init
init:
	R -e 'library(devtools);library(roxygen2);setwd("./~#PROJECT#~");document()'

# Build minimal Conda environment
.PHONY: conda
conda:
	./conda/setup-conda.sh

# Build development Conda environment
.PHONY: conda_dev
conda_dev:
	ENV_NAME=env-dev-~#PROJECT#~ ./conda/setup-conda.sh
	. ../env-dev-~#PROJECT#~/bin/activate && \
	../env-dev-~#PROJECT#~/bin/conda install --override-channels $(CONDA_CHANNELS) -y $(ALLPACKAGES)

# Build a conda package
.PHONY: build
build: clean version conda
	mkdir -p target
	PROJECT_ROOT=${CURRENTDIR} ${CONDA_ENV}/bin/conda build --prefix-length 128 --no-anaconda-upload --override-channels $(CONDA_CHANNELS) conda

# Remove any build artifact
.PHONY: clean
clean:
	rm -rf ~#PROJECT#~.Rcheck

# Build everything inside a Docker container
.PHONY: dbuild
dbuild:
	@mkdir -p target
	@rm -rf target/*
	@echo 0 > target/make.exit
	CVSPATH=$(CVSPATH) VENDOR=$(VENDOR) PROJECT=$(PROJECT) MAKETARGET='$(MAKETARGET)' ./dockerbuild.sh
	@exit `cat target/make.exit`

# Execute test command
.PHONY: test
test:
	R -e 'library(testthat);testthat::test_dir("~#PROJECT#~/tests")'
