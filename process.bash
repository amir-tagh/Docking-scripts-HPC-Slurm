#!/bin/bash



file="$1"	

#rm -rf txt.edit.*
#rm -rf txt.*
#rm -rf *.pdb


#convert the sdf to smiles
#obabel -isdf Enamine_search_result.sdf -osmiles -O Enamine_search_result.smiles

#grep -o '"[^"]\+"""' inforna20210518_molecules_smiles.csv | sed 's/"//g' > inforna20210518_molecules_smiles.smiles

#module purge
#module load openbabel/3.1.1

#nl $file > test.txt

while read line
do
    name=`echo $line | awk '{print $1}'`
    echo "$name"
    
    echo "$line" | awk '{print$2}' > txt.$name
   
    obabel -ismi txt.$name -opdb -O ligand.$name.pdb -p7.3 -b -c --gen3D --minimize --ffGAFF --steps5000
done < test_1.txt

#mkdir -p pdb_models
#mv ligand.*.pdb pdb_models

:<<'END'
#add a line number
nl $file > test.txt

while read line
do
    name=`echo $line | awk '{print $1}'`
    echo "$line" > txt.$name
done < test.txt


b=$(wc -l $file | awk '{print $1}')
 echo "number of smi is $b"
  

for (( i=1; i<=$b; i++ ))
 do
  awk '{print $2}' txt.${i} > txt.edit.${i}
done


echo "converting to pdb!"
#convert smiles to pdb 
for (( i=1; i<=$b; i++ ))
 do
  echo "i is ${i}"
obabel -ismi txt.edit.${i} -opdb -O ligand.${i}.pdb -p7.3 -b -c --gen3D --minimize --ffGAFF --steps10000
done

mkdir -p pdb_models
mv ligand.*.pdb pdb_models


rm -rf txt.edit.*
rm -rf txt.*
END

