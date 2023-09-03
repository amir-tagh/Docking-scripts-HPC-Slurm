#!/bin/bash

#SBATCH --job-name=tar
#SBATCH --partition=highmem
#SBATCH -n 1
##SBATCH --ntasks=1
##SBATCH --gpus-per-task=1
##SBATCH --gres=gpu:1
#SBATCH --output=error.out
##SBATCH --mail-type=ALL
##SBATCH --exclude=nodegpu001
#SBATCH --time=UNLIMITED

#first zip the dir/


for i in {1..49}
 do
  echo "i is $i"
  tar -zcvf Dock_${i}.tar.gz Dock_batch_${i}
done


#remove the zipped dir/
#for i in {1..388}
# do
#  echo "i is $i"
#  tar -zcvf Dock_${i}.tar.gz Dock_batch_${i}
#done



