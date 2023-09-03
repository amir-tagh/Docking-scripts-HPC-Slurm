#!/bin/bash

k=1
here=$(pwd)


for i in {1..2}
 do
  echo "i is $i"

   mkdir -p pdb_models_${i}
    cd pdb_models_${i}
     cp $here/submit.bash .

      k=`expr $i - 1`

#sed -i "s/test_${k}.txt/test_${i}.txt/g" $here/process.bash
#test_377.txt

       cp $here/test_${i}.txt .
	cp $here/process.bash .
	 sed -i "s/test_1.txt/test_${i}.txt/g" process.bash
          sbatch submit.bash
           echo "here is $here"
            
cd $here
  echo "now here is $here"

done


