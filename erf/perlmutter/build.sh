#!/usr/bin/env bash

run_dir=$PWD
src_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
test_dir=/pscratch/sd/w/wqz/git/ERF/Exec/ABL

cd ${test_dir}
make clean
make -j16 USE_MPI=TRUE USE_OMP=FALSE USE_CUDA=TRUE TEST=FALSE USE_ASSERTION=FALSE
/bin/mv ERF3d.gnu.TPROF.MPI.CUDA.ex ${run_dir}
make clean

cd ${src_dir}
/bin/cp inputs run.sh ${run_dir}

