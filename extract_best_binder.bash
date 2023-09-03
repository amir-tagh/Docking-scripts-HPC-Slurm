#!/bin/bash


#SBATCH --job-name=extract
#SBATCH --partition=shared
#SBATCH -n 1
##SBATCH --ntasks=1
##SBATCH --gpus-per-task=1
##SBATCH --gres=gpu:1
#SBATCH --output=error.out
##SBATCH --mail-type=ALL
##SBATCH --exclude=nodegpu001
#SBATCH --time=UNLIMITED


here=$(pwd)


#rm -rf all.dat
#rm -rf best_binders_greater*
#rm -rf energy_greater*
#rm -rf PDB_GREATER_


lim1="-8.0"
lim2="-10.7"
lim3="-11.0"

file="$1"

#rm -rf PDB_GREATER_9.0.dat
#mkdir -p PDB_GREATER_9.0.dat


k="0"

for i in {1..2030}
 do

  cd Dock_batch_${i}
   here_now=$(pwd)

   for j in {1..100}
    do
    
     if [ $i -eq $k ]
      then
        echo "now i $i equals k $k"
        z=`expr $i - 1`
         b=`expr $z \* 100`
          j=`expr $j + $b` 
          
    fi 

       echo "j is $j"

     cd Dock_model_${j}

      #grep -A 12 "RMSD TABLE" ligand.dlg  | awk '{print $4}' | grep -E '[0-9]' > all.dat
       grep -A 4  "Lowest" *.dlg | awk '{print $3}' | tail -n 1 > all.dat
 
     avg=$(awk '{ sum += $1 } END { if (NR > 0) print sum / NR }' all.dat)
      echo "$avg"
       echo "$avg" >> $here/all_energies.dat

     #if (( $(echo "$avg < $lim1" |bc -l) ))
     #then
     # echo "This is a good binder!"
       
	  #sed -n ${j}p $here/2500_frag.smi >> $here/best_binders_greater_9_0.smi
           #echo "$avg" >> $here/energy_greater_8_0.dat           
            #echo "${j}" >> $here/energy_greater_8_0_pdb_number.dat
             #cp ligand.${j}.pdb ../../PDB_GREATER_8.0.dat

      #if (( $(echo "$avg < $lim2" |bc -l) ))
       #then
        #echo "This is a good binder!"
          #sed -n ${j}p $here/2500_frag.smi >> $here/best_binders_greater_10.smi
          #echo "$avg" >> $here/energy_greater_10.dat      

     #if (( $(echo "$avg < $lim3" |bc -l) ))
       #then
        #echo "This is a good binder!"
          #sed -n ${j}p $here/2500_frag.smi >> $here/best_binders_greater_11.smi
           #echo "$avg" >> $here/energy_greater_11.dat
            #echo "${j}" >> $here/energy_greater_11_0_pdb_number.dat
 
     #else
      #echo "not a good binder"	       
     #fi
    #fi
   #fi	
      
    cd $here_now
 done

     k=`expr $i + 1`
      
cd $here
done     


