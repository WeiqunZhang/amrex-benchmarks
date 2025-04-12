#!/bin/bash -l

#SBATCH -t 00:30:00
#SBATCH -N 16
#SBATCH -J castro
#SBATCH -A mp111_g
#SBATCH -q regular
#S    BATCH --qos=debug
#SBATCH -C gpu&hbm80g
#SBATCH --exclusive
#SBATCH --gpu-bind=none
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1
#SBATCH -c 32
#SBATCH -o incflo.o%j
#SBATCH -e incflo.e%j

export MPICH_GPU_SUPPORT_ENABLED=1
export SLURM_CPU_BIND="cores"

srun -n 64 ./Castro3d.gnu.MPI.CUDA.ex inputs >& output.txt
