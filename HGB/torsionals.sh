#!/bin/bash

f_path="./"
t_file="topol.top"



grep -n "OC301"  $f_path/$t_file | awk '{print $2}' > O4
grep -n "CC3162" $f_path/$t_file | awk '{print $2}' > C1
grep -n "CC3161" $f_path/$t_file | grep "C4" | awk '{print $2}' > C4
grep -n "HCA1"   $f_path/$t_file | grep "H1"| awk '{print $2}' > H1
grep -n "OC3C61" $f_path/$t_file | grep "O5"| awk '{print $2}' > O5
grep -n "CC3161" $f_path/$t_file | grep "C2"| awk '{print $2}' > C2
grep -n "HCA1"   $f_path/$t_file | grep "H4"| awk '{print $2}' > H4
grep -n "CC3163" $f_path/$t_file | grep "C5"| awk '{print $2}' > C5
grep -n "HCA1"   $f_path/$t_file | grep "H2"| awk '{print $2}' > H2
grep -n "OC311"  $f_path/$t_file | grep "O2"| awk '{print $2}' > O2
grep -n "CC3161" $f_path/$t_file | grep -w "C3"| awk '{print $2}' > C3


O4=($(awk '{print $1}' < O4))
lO4=${#O4[@]}

C1=($(awk '{print $1}' < C1))

C4=($(awk '{print $1}' < C4))

H1=($(awk '{print $1}' < H1))

O5=($(awk '{print $1}' < O5))

C2=($(awk '{print $1}' < C2))

H4=($(awk '{print $1}' <H4))

C5=($(awk '{print $1}' < C5))

H2=($(awk '{print $1}' < H2))

O2=($(awk '{print $1}' < O2))

C3=($(awk '{print $1}' < C3))

for ((i=0; i<($lO4); i++)); do

	strvar_phi+="${C4[i]}"$':'"${O4[i]}"$':'"${C1[i+1]}"$':'"${O5[i+1]}"$':'"/n"$':'
 	strvar_psi+="${C5[i]}"$':'"${C4[i]}"$':'"${O4[i]}"$':'"${C1[i+1]}"$':'"/n"$':'
done

#echo "this is phi ${strvar_phi[@]}"

echo "this is psi  ${strvar_psi[@]} "

rm -f C1 C4 O4 H1 O5 C2 H4 C5 H2 O2 C3
