#!/bin/bash

#if you don't need to skip lines:
grep CLUSTERING ../../clust.dat | awk '{print $16}' > idx.dat
grep INDICES ../../clust.dat | cut -d":" -f2- >> idx.dat


#if you need to slice the clust file corresponding to a sliced trajectory.
#n=2  # how many lines 
#m=100 # every m lines - skip
#split -l ${m} --filter="head -n ${n}" clust.dat > idx_1.dat
#grep CLUSTERING idx_1.dat | awk '{print $16}' > idx.dat
#grep INDICES idx_1.dat | cut -d":" -f2- >> idx.dat

#rm -r -f idx_1.dat
#rm -f ../clust.dat
#mv idx.dat ../
exit 0
