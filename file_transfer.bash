#!/bin/bash

for i in {1..820}
 do
  echo "i is $i"          
  scp -r /media/amir/Expansion1/Chemspace_8M_lib_against_Tau/pdb_models_${i}:
done
