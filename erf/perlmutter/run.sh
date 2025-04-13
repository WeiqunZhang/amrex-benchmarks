#!/bin/bash -l

#SBATCH -t 00:30:00
#SBATCH -N 16
#SBATCH -J erf
#SBATCH -A mp111_g
#SBATCH -q regular
#S   BATCH --qos=debug
#SBATCH -C gpu&hbm40g
#SBATCH --exclusive
#SBATCH --gpu-bind=none
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1
#SBATCH -c 32
#SBATCH -o erf.o%j
#SBATCH -e erf.e%j

export MPICH_GPU_SUPPORT_ENABLED=1
export SLURM_CPU_BIND="cores"

srun -n 64 ./ERF3d.gnu.TPROF.MPI.CUDA.ex inputs >& output.txt

grep "Total Time:" output.txt >& result.txt
