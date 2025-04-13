#!/bin/bash -l

#SBATCH -t 00:30:00
#SBATCH -N 32
#SBATCH -J warpx
#SBATCH -A m4272_g
#SBATCH -q regular
#S   BATCH --qos=debug
#SBATCH -C gpu&hbm40g
#SBATCH --exclusive
#SBATCH --gpu-bind=none
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1
#SBATCH -c 32
#SBATCH -o warpx.o%j
#SBATCH -e warpx.e%j

export MPICH_GPU_SUPPORT_ENABLED=1
export SLURM_CPU_BIND="cores"

srun -n 128 ./main3d.gnu.TPROF.MTMPI.CUDA.ex inputs >& output.txt

grep "Total Time" output.txt >& result.txt
