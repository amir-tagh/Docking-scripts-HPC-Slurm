#!/bin/bash


#SBATCH --job-name=cleanup
#SBATCH --partition=highmem
#SBATCH -n 1
##SBATCH --ntasks=1
##SBATCH --gpus-per-task=1
##SBATCH --gres=gpu:1
#SBATCH --output=error.out
##SBATCH --mail-type=ALL
##SBATCH --exclude=nodegpu001


#remove the zipped dir/

for i in {371..388}
 do
  echo "i is $i"
   rm -rf Dock_batch_${i}
done



