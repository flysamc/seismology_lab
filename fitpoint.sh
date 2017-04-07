sumZ=`cat fitdata.txt | awk 'BEGIN{SUM=0}{SUM=SUM+$1}END{print SUM}'`
#echo $sumZ

sumD=`cat fitdata.txt | awk 'BEGIN{SUM=0}{SUM=SUM+$2}END{print SUM}'`
#echo $sumD
N=3
sumZsquare=`cat fitdata.txt | awk 'BEGIN{SUM=0}{SUM=SUM+$1*$1}END{print SUM}'`
sumZD=`cat fitdata.txt | awk 'BEGIN{SUM=0}{SUM=SUM+$1*$2}END{print SUM}'`

echo $sumZD $sumZsquare $sumD $sumZ
#slope
m2=`echo sumZ sumD N sumZsquare sumZD | awk '{print ($5 - ($1*$2)/$3)/($1 - ($1*$1)/$3)}'`
echo $m2
