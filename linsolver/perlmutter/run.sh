#!/bin/bash -l

#SBATCH -t 00:30:00
#SBATCH -N 8
#SBATCH -J linsolver
#SBATCH -A mp111_g
#SBATCH -q regular
#S    BATCH --qos=debug
#SBATCH -C gpu&hbm40g
#SBATCH --exclusive
#SBATCH --gpu-bind=none
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1
#SBATCH -c 32
#SBATCH -o linsolver.o%j
#SBATCH -e linsolver.e%j

export MPICH_GPU_SUPPORT_ENABLED=1
export SLURM_CPU_BIND="cores"

srun -n 32 ./main3d.gnu.MPI.CUDA.ex inputs >& output.txt

grep "Solve Time is " output.txt >& result.txt
