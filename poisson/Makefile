###############################################################################
################### MOOSE Application Standard Makefile #######################
###############################################################################
#
# Required Environment variables
# LIBMESH_DIR	- location of the libMesh library
#
# Required Make variables
# APPLICATION_NAME  - the name of this application (all lower case)
# MOOSE_DIR	        - location of the MOOSE framework
#
# Optional Environment variables
# CURR_DIR	- current directory (DO NOT MODIFY THIS VARIABLE)
#
# Note: Make sure that there is no whitespace after the word 'yes' if enabling
# an application
###############################################################################
CURR_DIR	?= $(shell pwd)
ROOT_DIR        ?= $(shell pwd)/../..

ifeq ($(MOOSE_DEV),true)
	MOOSE_DIR ?= $(ROOT_DIR)/devel/moose
else
	MOOSE_DIR ?= $(ROOT_DIR)/moose
endif
LIBMESH_DIR	?= $(ROOT_DIR)/libmesh

APPLICATION_NAME := poisson

include $(MOOSE_DIR)/build.mk
include $(MOOSE_DIR)/moose.mk
include $(MOOSE_DIR)/app.mk
#include ../test.mk

###############################################################################
# Additional special case targets should be added here

# test: $(APPLICATION_NAME)-$(METHOD)
# 	$(call TEST_exodiff,dirichlet_bc.i,out_coupled_dirichlet.e)
# 	$(call TEST_exodiff,neumann_bc.i,out_coupled_neumann.e)
# 	$(call TEST_exodiff,periodic_bc.i,out_pbc.e)
# 	$(call TEST_exodiff,trapezoid.i,out_trapezoid.e)


