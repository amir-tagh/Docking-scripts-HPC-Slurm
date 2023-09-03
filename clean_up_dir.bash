#!/bin/bash

:<<'END'
#SBATCH --job-name=clea_CB_E
#SBATCH --partition=shared
#SBATCH -n 1
##SBATCH --ntasks=1
##SBATCH --gpus-per-task=1
##SBATCH --gres=gpu:1
#SBATCH --output=error.out
##SBATCH --mail-type=ALL
##SBATCH --exclude=nodegpu001
#SBATCH --time=UNLIMITED
END



here=$(pwd)

upper_lim="-9.5"

k="1681"

for i in {1681..2020}
 do

  cd Dock_batch_${i}
   here_now=$(pwd)

    #k=`expr $k + 1`

   for j in {1..100}
    do
    
     if [ $i -eq $k ]
      then
        echo "now i $i equals k $k"
         z=`expr $i - 1`
          b=`expr $z \* 100`
           j=`expr $j + $b` 
            echo "j now is $j" 
    fi 
      
       echo "j is $j"

     cd Dock_model_${j}
	rm -rf *.map
         #rm -rf RNA.pdb
          rm -rf ligand.xml
           rm -rf RNA.pdbqt
            rm -rf my_docking.pdbqt
             rm -rf RNA.maps.fld
              rm -rf RNA.maps.xyz
               #rm -rf ligand.pdb
                rm -rf ligand.pdbqt
                 rm -rf *.bash
                  rm -rf error.out  
                   rm -rf ligand_RNA.dpf
                    rm -rf RNA.gpf
                     rm -rf RNA.*.map
                      rm -rf slurm-*.out
      
    cd $here_now
 done

     k=`expr $i + 1`
      echo "k is $k"
      
cd $here
done     


