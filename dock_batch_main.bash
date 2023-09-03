#!/bin/bash

here=$(pwd)


k="1714"

COUNTER=0
#w="50"

for i in {1714..5000}
 do
  echo "i is $i & k here is $k"
   
    mkdir -p Dock_batch_${i}
     cd Dock_batch_${i}
      here_now=$(pwd)

w="15"       
COUNTER=0

for j in {1..100}
 do
  let COUNTER++
   echo "$COUNTER"

   if [ $i -eq $k ]
      then
        echo "now i $i equals k $k"
        z=`expr $i - 1`
         b=`expr $z \* 100`
          j=`expr $j + $b`
           echo "j now is $j" 
    fi
 
   echo "j is $j"
    mkdir -p Dock_model_${j}
     cd Dock_model_${j} 

     cp $here/pdb_models_${i}/ligand.${j}.pdb .
      cp ligand.${j}.pdb ligand.pdb
       cp $here/RNA.pdb .
        cp $here/RNA.pdbqt .
         cp $here/GPU_dock.bash .
          cp $here/GPU_dock_auto.bash .
           cp $here/GPU_dock_main.bash .
            cp $here/obabel.bash .
             cp $here/do_dock_gpu.bash .
              sed -i "s/dock1/dock${j}/g" do_dock_gpu.bash
               sbatch do_dock_gpu.bash   
                #cd $here_now 
                  
                 if [ $COUNTER -ge $w ]
                  then
                    sleep 30s
                     
                   w=`expr $w + 15`
                 fi 
                    cd $here_now
   done
     k=`expr $i + 1`
      echo "k is $k"
       cd $here
done      


