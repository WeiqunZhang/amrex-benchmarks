#!/bin/bash -l

#PBS -A Tornados_with_ERF
#PBS -N linsolver
#PBS -l walltime=30:00
#PBS -l filesystems=flare
#PBS -q debug-scaling
#PBS -l place=scatter
#PBS -l select=4

cd ${PBS_O_WORKDIR}

NNODES=`wc -l < $PBS_NODEFILE`
NRANKS=12 # Number of MPI ranks to spawn per node
NTOTRANKS=$(( NNODES * NRANKS ))

CPU_BIND_SCHEME="--cpu-bind=list:1-8:9-16:17-24:25-32:33-40:41-48:53-60:61-68:69-76:77-84:85-92:93-100"

echo "NUM_OF_NODES= ${NNODES} TOTAL_NUM_RANKS= ${NTOTRANKS} RANKS_PER_NODE= ${NRANKS}"

MPIR_CVAR_ENABLE_GPU=1

mpiexec -n ${NTOTRANKS} -ppn ${NRANKS} ${CPU_BIND_SCHEME} \
    /soft/tools/mpi_wrapper_utils/gpu_tile_compact.sh \
    ./main3d.sycl.MPI.ex inputs > output.txt

grep "Solve Time is " output.txt >& result.txt
