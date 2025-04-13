#!/usr/bin/env bash

run_dir=$PWD
src_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_dir=${src_dir}/..

cd ${test_dir}
make clean
make -j16 USE_CUDA=TRUE
/bin/mv main3d.gnu.MPI.CUDA.ex ${run_dir}
make clean

cd ${src_dir}
/bin/cp run.sh ${run_dir}
