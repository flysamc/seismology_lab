
#heat generation    
a=0.4
exp=1e-6
A1=`echo $a $exp | awk '{print $1*$2}' `
a2=2.5
A2=`echo $a2 $exp | awk '{print $1*$2}' `
#-----------------------------------------------
k=2.5
km=1e3
z1=`echo $km | awk '{print $1*30}'`
z2=`echo $km | awk '{print $1*40}'`
#----variable z = 10,20,30

#z=`echo $km | awk '{print$1*30}'`
#---------------------------------
q2=1e-3
Q2=`echo $q2 | awk '{print $1*20}'`
#----------------------------------------------------
for i in $(seq 10 10 30)
do
s=`echo $i $km | awk '{print $1*$2}'`
firstpart=`echo $A1 $s $k | awk '{print (-1)*($1/(2*$3))*($2*$2)}'`
secondpart=`echo $A1 $A2 $Q2 $z2 $z1 $k $s| awk '{print ($3/$6 + ($2/$6)*($4-$5) + ($1*$5)/($6))*$7}' `
Temp=`echo $firstpart $secondpart | awk '{print $1 + $2}'` #change the value of z to calculate at any depth of 10 2o or 30
echo height=$i temp=$Temp
done


