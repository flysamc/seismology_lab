

for file in `ls *.sac`

do
t1=`sac<<! | grep T1|awk '{print $3}'
r $file
lh T1
q
!`

t2=`sac<<! | grep T3|awk '{print $3}'
r $file
lh T3
q
!`


#t2 for denominator
T2=`echo $t1 $t2 | awk '{print $2 - $1}'`
#middle value of equation
A=`echo $t1 $T2 | awk '{print 2*($1/$2) + 1}'`
sqa=`echo $A | awk '{print $1*$1}'`
#fist part of the equation
#define variable Vp and p(ray parameter)
vp=6.4
#the ray parameter
p=`sac<<! | grep USER4|awk '{print $3}'
r $file
lh USER4
q
!`
#firstpart = fp = (1-vp^2*p^2)
fp=`echo $p $vp | awk '{print 1-($1*$1)*($2*$2)  }'`
#third part
lp=`echo $p $vp |awk '{print ($1*$1)*($2*$2)}'`
#final
final=`echo $fp $sqa $lp | awk '{print sqrt($1*$2 + $3)}'`
echo $final


#calculating the Vs velocity

vs=`echo $vp $final |awk '{print $1/$2}'`
echo velocity $vs


#height
height=`echo $vp $vs $p $t1| awk '{print $4/(sqrt((1/($2*$2))-$3*$3) - sqrt((1/($1*$1))-$3*$3))}'`

echo $height







done
