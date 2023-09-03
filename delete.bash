#!/bin/bash


#SBATCH --job-name=obabel
#SBATCH --partition=shared
#SBATCH -n 1
##SBATCH --ntasks=1
##SBATCH --gpus-per-task=1
##SBATCH --gres=gpu:1
#SBATCH --output=error.out
##SBATCH --mail-type=ALL
##SBATCH --exclude=nodegpu001
#SBATCH --time=UNLIMITED



for i in {1..49}
 do
  echo "i is ${i}"
  #rm -rf pdb_models_${i}
   rm -rf Dock_batch_${i}
done
