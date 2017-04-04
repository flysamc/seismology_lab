fname="combine.txt"
fname2="finalamplitude.txt"
fname3="amplitudesum.txt"


exec 3<$fname
exec 4<$fname2
exec 5<$fname3
while IFS= read -r line1 <&3 
	IFS= read -r line2 <&4
	IFS= read -r line3 <&5
   do
  

secondpart=`echo $line2 | awk '{print $1 " " $2 " " $3}'`
firstpart=`echo $line1 | awk '{print $1 " " $2 " " $3 " " $4 " " $5}'`
thirdpart=`echo $line3 | awk '{print $1}'`
final=`echo $firstpart $secondpart $thirdpart | awk '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " "$9}'`
echo $final >> table.txt

        
done
