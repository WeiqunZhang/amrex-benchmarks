#!/bin/bash

#SBATCH -J fft
#SBATCH -A ast106
#SBATCH -o %x-%j.out
#SBATCH -t 00:30:00
#SBATCH -p batch
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=7
#SBATCH --gpus-per-task=1
#SBATCH --gpu-bind=closest
#SBATCH -N 8

module load craype-accel-amd-gfx90a
module load rocm
module list

export MPICH_GPU_SUPPORT_ENABLED=1 

srun -n 64 $(ls -tr main3d.*.MPI.HIP.ex | tail -n 1) n_cell_x=1024 n_cell_y=1024 n_cell_z=1024 >& output.txt
