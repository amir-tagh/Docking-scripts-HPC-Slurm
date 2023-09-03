#!/bin/bash


#prepare_receptor4.py -r RNA.pdb -A "bonds_hydrogens" -v

#obabel -ipdb RNA.pdb -opdbqt -O RNA.pdbqt --partialcharge gasteiger

#prepare_ligand4.py -l ligand.pdb -o ligand.pdbqt -A "bonds_hydrogens"

#prepare_gpf4.py -l ligand.pdbqt -r RNA.pdbqt -y

#prepare_dpf4.py -l ligand.pdbqt -r RNA.pdbqt

#autogrid4 -p RNA.gpf

autodock_gpu_64wi -ffile RNA.maps.fld -lfile ligand.pdbqt

#extract the pdbqt files
grep '^DOCKED' ligand.dlg | cut -c9- > my_docking.pdbqt


obabel -ipdbqt my_docking.pdbqt -opdb -O my_docking.pdb
