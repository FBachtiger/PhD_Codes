#!/bin/bash
source activate doglycans

cl=8 # chain length
let clm=$cl-1


dg_path="/home/chem/mstscj/DOGLYCANS/doglycans"

s_file="seqfile.seq"

where=`pwd`

cd $where

sed -i "s/TBS/$clm/g" $s_file

python $dg_path/prepreader.py [-Wmdt] -f $dg_path/dat/glycam06h.itp -p $dg_path/dat/GLYCAM_06h.prep -s seqfile.seq -c ${cl}HGB.pdb -o ${cl}HGB.itp --charmm
