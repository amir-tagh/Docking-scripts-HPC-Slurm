#!/bin/bash


#prepare_receptor4.py -r RNA.pdb -A "bonds_hydrogens" -v

#obabel -ipdb RNA.pdb -opdbqt -O RNA.pdbqt --partialcharge gasteiger

${HPC_MGLTOOLS_SCRIPTS}/AutoDockTools/Utilities24/prepare_ligand4.py -l ligand.pdb -o ligand.pdbqt -A "bonds_hydrogens"

#${HPC_MGLTOOLS_SCRIPTS}/AutoDockTools/Utilities24/prepare_gpf4.py -l ligand.pdbqt -r RNA.pdbqt -y  target specific

${HPC_MGLTOOLS_SCRIPTS}/AutoDockTools/Utilities24/prepare_gpf4.py -l ligand.pdbqt -r RNA.pdbqt -p npts='100,100,100'

${HPC_MGLTOOLS_SCRIPTS}/AutoDockTools/Utilities24/prepare_dpf4.py -l ligand.pdbqt -r RNA.pdbqt
#sed -i '7s/.*/gridcenter 0.094 -21.447 98.832       # xyz-coordinates or auto/' RNA.gpf
#autogrid4 -p RNA.gpf

#autodock_gpu_64wi -ffile RNA.maps.fld -lfile ligand.pdbqt

#extract the pdbqt files
#grep '^DOCKED' ligand.dlg | cut -c9- > my_docking.pdbqt


#obabel -ipdbqt my_docking.pdbqt -opdb -O my_docking.pdb
