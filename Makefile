# MAKEFILE
#
# @author      Nicola Asuni <info@tecnick.com>
# @link        https://github.com/tecnickcom/rgen
#
# This file is intended to be executed in a Linux-compatible system.
# ------------------------------------------------------------------------------

# List special make targets that are not associated with files
.PHONY: help all new newproject rename template confirm clean

# Current directory
CURRENTDIR=$(shell pwd)

# Set default project type
ifeq ($(TYPE),)
	TYPE=lib
endif

# Set default project configuration file
ifeq ($(CONFIG),)
	CONFIG=default.cfg
endif

# Include the configuration file
include $(CONFIG)

# Generate a prefix for environmental variables
UPROJECT=$(shell echo $(PROJECT) | tr a-z A-Z | tr - _)

# Base project name
BASEPROJECT=${PROJECT}


# --- MAKE TARGETS ---

# Display general help about this command
help:
	@echo ""
	@echo "RGen Makefile."
	@echo "The following commands are available:"
	@echo ""
	@echo "    make new TYPE=app CONFIG=myproject.cfg  :  Generate a new project"
	@echo "    make clean                              :  Remove all generated projects"
	@echo ""
	@echo "    * TYPE is the project type:"
	@echo "        lib      : library"
	@echo ""
	@echo "    * CONFIG is the configuration file containing the project settings."
	@echo ""

# Alias for help target
all: help

# Generate a new project
new: newproject rename template confirm

# Copy the project template in the output folder
newproject:
	@mkdir -p ./target/$(CVSPATH)/$(PROJECT)
	@rm -rf ./target/$(CVSPATH)/$(PROJECT)/*
	@cp -rf ./src/$(TYPE)/. ./target/$(CVSPATH)/$(PROJECT)/

# Rename project files
rename:
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type d -name "_PROJECT_*" -execdir mv '{}' "$(PROJECT)" \; -prune

# Replace text templates in the code
template:
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#PROJECT#~/$(PROJECT)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#BASEPROJECT#~/$(BASEPROJECT)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#UPROJECT#~/$(UPROJECT)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#SHORTDESCRIPTION#~/$(SHORTDESCRIPTION)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s|~#CVSPATH#~|$(CVSPATH)|g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s|~#PROJECTLINK#~|$(PROJECTLINK)|g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#VENDOR#~/$(VENDOR)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#OWNER#~/$(OWNER)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#OWNEREMAIL#~/$(OWNEREMAIL)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#CURRENTYEAR#~/$(CURRENTYEAR)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#LIBPACKAGE#~/$(LIBPACKAGE)/g" {} \;
	@find ./target/$(CVSPATH)/$(PROJECT)/ -type f -exec sed -i "s/~#LICENSE#~/$(LICENSE)/g" {} \;

# Print confirmation message
confirm:
	@echo "A new "$(TYPE)" project has been created: "target/$(CVSPATH)/$(PROJECT)

# Remove all generated projects
clean:
	@rm -rf ./target
