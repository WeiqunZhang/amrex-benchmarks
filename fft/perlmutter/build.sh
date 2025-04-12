#!/usr/bin/env bash

make clean
make -j16 USE_CUDA=TRUE
