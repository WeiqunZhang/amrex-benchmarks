#!/bin/bash -l

#SBATCH -J warpx
#SBATCH -A ast106
#SBATCH -o %x-%j.out
#SBATCH -t 00:30:00
#SBATCH -p batch
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=7
#SBATCH --gpus-per-task=1
#SBATCH --gpu-bind=closest
#SBATCH -N 16

export MPICH_GPU_SUPPORT_ENABLED=1

srun -n 128 $(ls -tr main3d.*.MTMPI.HIP.ex | tail -n 1) inputs >& output.txt

grep "Total Time" output.txt >& result.txt
