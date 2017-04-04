#!/bin/sh

#calculation of crustal thickness and vp/vs ratio using h-k stacking method

#rounding to 2 digits

round()
{
echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};

#check to 2 decimal digit 5 0 


#define the weights value
w1=0.6
w2=0.3
w3=0.1
#define velocity calculated earlier methods
vp=6.5
#initial height
h=20
#initial vp/vs ratio say 'k'

#ray parameter
p=0.072
#start the loop for stacking of multiple reciver function from same station
#single reciver function do the stacking later
#create the for loop no. of iteration necessary
i=0
while [ "$i" -le 1200 ]; do
    h=`echo $h | awk '{print $1+0.05}'`
    i=$(( i + 1 ))
j=0
k=1.6
while [ "$j" -le 175 ]
do
k=`echo $k | awk '{print $1+0.002}'`
#Vs velocity
vs=`echo $vp $k | awk '{print $1/$2 }'`
#t1
t1=`echo $h $vp $vs $p | awk '{print $1*((sqrt((1/($3*$3))-($4*$4))) - sqrt(((1/($2*$2))-($4*$4))))}'`
t2=`echo $h $vp $vs $p | awk '{print $1*((sqrt((1/($3*$3))-($4*$4))) + sqrt(((1/($2*$2))-($4*$4))))}'`
t3=`echo $h $vs $p | awk '{print 2*($1*(sqrt((1/($2*$2))-($3*$3))))}'`
#echo $t1 $t2 $t3 >> data.txt
rt1=`echo $(round $t1/1 2)`
rt2=`echo $(round $t2/1 2)`
rt3=`echo $(round $t3/1 2)`




finaltime=`echo $rt1 $rt2 $rt3 | awk '{print $1 " " $2 " " $3}'`
overall=`echo $h $k $rt1 $rt2 $rt3 | awk '{print $1 " " $2 " " $3 " " $4 " " $5}' `
j=$(( j + 1 ))
echo $finaltime >> kanamori-time-t1-t2-t3.txt
echo $overall >> kanamori-he-ke-te.txt


#s=`echo $w1 $w2 $w3 $t1 $t2 $t3 `
done
done 
#----------------------------------------------------------------------------

echo "running python script....."
python3 actualcompare.py >> kanamori-he-ke-roundedtime.txt
echo "completed actual compare"

#----------------------------------------------------------------------------
#combine the data
echo "combining both data"
sh combine.sh
echo "combining complete......"

#change the input digit to compare form
echo "converting the data to useful format"
sh change-digit.sh
echo "converting complete...."


#comparing two real data with the combine data
echo "calculating amplitude...."
python3 amplitudecheck.py >> finalamplitude.txt
echo "calculation finish...."

echo "calculation of S(h,vp/vs) ration"
python3 calculate-hk-from-amplitude.py >> amplitudesum.txt
echo "sum of amplitude calculated"

echo "creating table for all the data....."
sh table.sh
echo "table created"

echo "find maximum"
python3 findmax.py
echo"done"




