#!/bin/bash

v=(4 6 8)
z=(4 5 6)
distance=0
traveltime=0
delaytime=0


# get the length of the arrays
length=${#v[@]}
# do the loop

for p in {1 2 3}
do

for ((i=0;i<$length;i++)); do



distance=`echo ${v[$i]} $p ${z[$i]} $distance| awk '{print $4 + (((1/($1*$1))*$3)/(sqrt($1*$1-$2*$2)))}'`

traveltime=`echo ${v[$i]} $p ${z[$i] $traveltime| awk '{print $4 + ($2*$3/(sqrt((1/($1*$1))-$2*$2)))}'`

delaytime=`echo ${v[$i]} $p ${z[$i] $delaytime | awk '{print $4 + ($3*sqrt((1/($1*$1))-$2*$2))}'`


done
echo $distance $traveltime $delaytime


done
