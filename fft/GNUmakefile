AMREX_HOME ?= ../../amrex

DEBUG	= FALSE

DIM	= 3

COMP    = gcc

USE_MPI   = TRUE
USE_OMP   = FALSE
USE_CUDA  = FALSE
USE_HIP   = FALSE
USE_SYCL  = FALSE

USE_FFT = TRUE

BL_NO_FORT = TRUE

TINY_PROFILE = FALSE

include $(AMREX_HOME)/Tools/GNUMake/Make.defs

include ./Make.package
include $(AMREX_HOME)/Src/Base/Make.package

include $(AMREX_HOME)/Tools/GNUMake/Make.rules
