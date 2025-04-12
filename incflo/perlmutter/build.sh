#!/usr/bin/env bash

cd test_no_eb_3d
make clean
make -j16 USE_OMP=FALSE QED=FALSE USE_CUDA=TRUE
