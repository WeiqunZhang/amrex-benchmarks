#!/usr/bin/env bash

make clean
make -j16 USE_OMP=FALSE QED=FALSE USE_CUDA=TRUE
