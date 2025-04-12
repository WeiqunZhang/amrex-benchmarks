#!/usr/bin/env bash

cd Exec/science/wdmerger/
make clean
make -j16 USE_OMP=FALSE QED=FALSE USE_CUDA=TRUE
