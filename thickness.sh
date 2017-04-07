


round()
{
echo $(printf %.$2f $(echo "scale=$2;(((10^$2)*$1)+0.5)/(10^$2)" | bc))
};


T0=1300 #asthenospher
T1=1150 #lithosphere
k=1e-6
t0=40
c=`echo $T0 $T1 | awk '{print $2/$1}'`
#echo $c

short=`echo $(round $c/1 2)`
#echo $short
erf=`cat erf.txt | grep $short  | awk '{print $1}'`
#echo $erf
echo year depth
for i in $(seq 20 10 100)
do
t=`echo $i | awk '{print $1*(1e6)*(365*24*60*60)}'`
#echo $t
z=`echo $k $erf $t | awk '{print ($2*2*sqrt($1*$3))}'`
short1=`echo $z | awk '{print $1/1000}'`
echo $i $short1 km
done

