#!/bin/bash


#SBATCH --job-name=dock1
#SBATCH --partition=gpu
##SBATCH --nodes=1
##SBATCH --ntasks=1
##SBATCH --gpus-per-task=1
#SBATCH --gres=gpu:1
##SBATCH --output=error.out
#SBATCH --account=scripps-dept
#SBATCH --qos=scripps-dept
##SBATCH --mem=10G
##SBATCH --time=1:00:00

module purge

module load mgltools/1.5.7
ml
./GPU_dock.bash

module purge

module load autodock/4.2.6
#module load autodock/4.2.6-cuda

./GPU_dock_auto.bash


module purge

module load autodock-gpu/1.5.3

./GPU_dock_main.bash

module purge
module load openbabel/3.1.1
./obabel.bash

