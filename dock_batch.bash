#!/bin/bash

here=$(pwd)


for i in {78..100}
 do
  echo "i is $i"
  mkdir -p Dock_batch_${i}
   cd Dock_batch_${i}
    here_now=$(pwd)

 for j in {670001..680000} #300001
  do

   if [ "$i" -eq 69 ];then
    j=`expr $j + 10000`

    elif [ "$i" -eq 70 ];then
    j=`expr $j + 20000`   
  
  elif [ "$i" -eq 71 ];then
    j=`expr $j + 30000`     
 
  elif [ "$i" -eq 72 ];then
    j=`expr $j + 40000`  

  elif [ "$i" -eq 73 ];then
    j=`expr $j + 50000`

  elif [ "$i" -eq 74 ];then
    j=`expr $j + 60000`

  elif [ "$i" -eq 75 ];then
    j=`expr $j + 70000`

  elif [ "$i" -eq 76 ];then
    j=`expr $j + 80000`  

  elif [ "$i" -eq 77 ];then
    j=`expr $j + 90000`
 
  elif [ "$i" -eq 78 ];then
    j=`expr $j + 100000`
 
  elif [ "$i" -eq 79 ];then
    j=`expr $j + 110000`

	elif [ "$i" -eq 80 ];then
    j=`expr $j + 120000`

	elif [ "$i" -eq 81 ];then
    j=`expr $j + 130000`

	elif [ "$i" -eq 82 ];then
    j=`expr $j + 140000`

	elif [ "$i" -eq 83 ];then
    j=`expr $j + 150000`

	elif [ "$i" -eq 84 ];then
    j=`expr $j + 160000`

	elif [ "$i" -eq 85 ];then
    j=`expr $j + 170000`

	elif [ "$i" -eq 86 ];then
    j=`expr $j + 180000`

	elif [ "$i" -eq 87 ];then
    j=`expr $j + 190000`

	elif [ "$i" -eq 88 ];then
    j=`expr $j + 200000`

	elif [ "$i" -eq 89 ];then
    j=`expr $j + 210000`

	elif [ "$i" -eq 90 ];then
    j=`expr $j + 220000`

	elif [ "$i" -eq 91 ];then
    j=`expr $j + 230000`

	elif [ "$i" -eq 92 ];then
    j=`expr $j + 240000`
	
	elif [ "$i" -eq 93 ];then
    j=`expr $j + 250000`

	elif [ "$i" -eq 94 ];then
    j=`expr $j + 260000`

	elif [ "$i" -eq 95 ];then
    j=`expr $j + 270000`

	elif [ "$i" -eq 96 ];then
    j=`expr $j + 280000`

	elif [ "$i" -eq 97 ];then
    j=`expr $j + 290000`

	elif [ "$i" -eq 98 ];then
    j=`expr $j + 300000`

	elif [ "$i" -eq 99 ];then
    j=`expr $j + 310000`

	elif [ "$i" -eq 100 ];then
    j=`expr $j + 320000`

  else
         echo "nothing!"
  fi

   echo "j is $j"
   mkdir -p Dock_model_${j}
    cd Dock_model_${j} 

     cp /gpfs/group/disney/ataghavi/Chemspace_virtual_lib_correct_correct/pdb_models_${i}/ligand.${j}.pdb .
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

                cd $here_now
   done
    echo "Now take a nap:)"
     sleep 30m
      cd $here
done      


