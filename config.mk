# config.mk
# by Wesley J. Landaker
#
# Version 1.5.0

# GNU Make configuration with good defaults.
#
# This work is marked with CC0 1.0. To view a copy of this license, visit
# https://creativecommons.org/publicdomain/zero/1.0/

####################
# Standard Targets #
####################

# Make "default" the default target, not whatever random target comes first.
override .DEFAULT_GOAL := default

# Define standard targets that can be hooked into by make modules.

.PHONY: default
default::

.PHONY: all
all::

.PHONY: build
build::

.PHONY: test
test::

.PHONY: clean
clean::

#######################
# Disable Misfeatures #
#######################

# Don't use any built-in rules or variables.
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables

# Disable built-in suffix rules.
.SUFFIXES:
override SUFFIXES :=

# Disable built-in library patterns.
override .LIBPATTERNS :=

# Disable virtual paths.
ifdef VPATH
DONT_USE_VPATH: $(error Using VPATH is deprecated and harmful.)
endif
override VPATH :=

# Prevent implicit makefiles.
ifdef MAKEFILES
DONT_USE_MAKEFILES: $(error Using MAKEFILES is deprecated and harmful.)
endif
override MAKEFILES :=

# Prevent using DOS-specific MAKESHELL.
ifdef MAKESHELL
DONT_USER_MAKESHELL: $(error Using MAKESHELL is deprecated and harmful.)
endif
override MAKESHELL :=

########################
# Enable Good Features #
########################

# Synchronize output per target.
MAKEFLAGS += --output-sync=target

# Always shuffle parallel prerequisties.
MAKEFLAGS += --shuffle=random

# Warn about undefined variables.
MAKEFLAGS += --warn-undefined-variables

# Secondary expansion in prequestite lists is extremely useful.
# There is never any good reason to have it off.
.SECONDEXPANSION:

#######################
# Shell Configuration #
#######################

# Run rules in a single bash shell with error-checking turned on.
override SHELL := bash
.SHELLFLAGS = -e -u -o pipefail -c
.ONESHELL:

# Don't print out receipes.
.SILENT:

#################
# File Deletion #
#################

# Always delete targets if the rule fails.
.DELETE_ON_ERROR:

# Don't delete intermediate files.
.SECONDARY:

#################
# Macro Helpers #
#################

# Define comma, empty, and space variables for use in macros.
comma := ,
empty :=
space := $(empty) $(empty)
