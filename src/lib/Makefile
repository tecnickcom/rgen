# MAKEFILE
#
# @author      ~#OWNER#~ <~#OWNEREMAIL#~>
# @link        ~#PROJECTLINK#~
# ------------------------------------------------------------------------------

# List special make targets that are not associated with files
.PHONY: help version conda conda_dev build dbuild test clean

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

# --- MAKE TARGETS ---

# Display general help about this command
help:
	@echo ""
	@echo "~#PROJECT#~ Makefile."
	@echo "The following commands are available:"
	@echo ""
	@echo "    make version    : Set version from VERSION file"
	@echo "    make conda      : Build minimal Conda environment"
	@echo "    make conda_dev  : Build development Conda environment"
	@echo "    make build      : Build a Conda package"
	@echo "    make dbuild     : Build everything inside a Docker container"
	@echo "    make test       : Execute test command"
	@echo "    make clean      : Remove any build artifact"
	@echo ""

all: clean format conda

# Set the version from VERSION file
version:
	sed -i "s/version:.*$$/version: $(VERSION)/" conda/meta.yaml
	sed -i "s/number:.*$$/number: $(RELEASE)/" conda/meta.yaml
	sed -i "s/Version:.*$$/Version: $(VERSION).$(RELEASE)/" ~#PROJECT#~/DESCRIPTION
	R -e 'library(devtools);library(roxygen2);setwd("./~#PROJECT#~");document()'

# Build minimal Conda environment
conda:
	./conda/setup-conda.sh

# Build development Conda environment
conda_dev:
	ENV_NAME=env-dev-~#PROJECT#~ ./conda/setup-conda.sh
	. ../env-dev-~#PROJECT#~/bin/activate && \
	../env-dev-~#PROJECT#~/bin/conda install --override-channels $(CONDA_CHANNELS) -y $(ALLPACKAGES)

# Build a conda package
build: clean version conda
	mkdir -p target
	"${CONDA_ENV}/bin/conda" build --prefix-length 128 --no-anaconda-upload --no-remove-work-dir --override-channels $(CONDA_CHANNELS) conda

# Remove any build artifact
clean:
	rm -rf ~#PROJECT#~.Rcheck

# Build everything inside a Docker container
dbuild:
	@mkdir -p target
	@rm -rf target/*
	@echo 0 > target/make.exit
	CVSPATH=$(CVSPATH) VENDOR=$(VENDOR) PROJECT=$(PROJECT) MAKETARGET='$(MAKETARGET)' ./dockerbuild.sh
	@exit `cat target/make.exit`

# Execute test command
test:
	R -e 'library(testthat);testthat::test_dir("~#PROJECT#~/tests")'
