#!/bin/sh


round()
{
echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

input="P_HYB.2009.217.00.17.58.eqr.txt"
while IFS= read -r var
do
c=`echo "$var"`
amp=`echo $c | awk '{print $3}'`
time=`echo $c | awk '{print $1}'`
short=`echo $(round $time/1 2)`
short2=`echo $short | awk '{print $1}'`
final=`echo $short2 $amp | awk '{print $1 " " $2}'`
echo $final >> realdata.txt 
done < "$input"



