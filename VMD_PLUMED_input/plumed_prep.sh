#!/bin/bash

#oxygen=`cat list.txt | tr ' ' '\n' | sed '/^$/d' | awk '{print $1+1}' | paste -s -d","`

#h1=`cat list.txt | tr ' ' '\n' | sed '/^$/d' | awk '{print $1+2}' | paste -s -d","`

#h2=`cat list.txt | tr ' ' '\n' | sed '/^$/d' | awk '{print $1+3}' | paste -s -d","`

#echo $h2


cat list.txt | tr ' ' '\n' | sed '/^$/d' |awk 'BEGIN {print "HBOND_COORD SPECIES="}{print $1+1}'| paste -s -d"," >O

cat list.txt | tr ' ' '\n' | sed '/^$/d' | awk 'BEGIN {print "HYDROGENS="}{print $1+2}' | paste -s -d"," >>O

cat list.txt | tr ' ' '\n' | sed '/^$/d' | awk '{print $1+3}' | paste -s -d"," >>O

cat O H >plumed.dat
