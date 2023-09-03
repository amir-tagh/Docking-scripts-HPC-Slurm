#!/bin/bash



#SBATCH --job-name=obabel
#SBATCH -n 1
#SBATCH --output=error.out
#SBATCH --account=scripps-dept
#SBATCH --qos=scripps-dept
#SBATCH --time=7-00:00

module purge
#module load openbabel/3.1.1
module load openbabel/2.4.1

./process.bash

