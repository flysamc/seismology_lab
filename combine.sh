fname="kanamori-he-ke-te.txt"
fname2="kanamori-he-ke-roundedtime.txt"

exec 3<$fname
exec 4<$fname2

   while IFS= read -r line1 <&3
   IFS= read -r line2 <&4
   do
  
firstpart=`echo $line1 | awk '{print $1 " " $2}'`
secondpart=`echo $line2 | awk '{print $1 " " $2 " " $3}'`
combine=`echo $firstpart $secondpart | awk '{print $1 " " $2 " " $3 " " $4 " " $5}'`
echo $combine >> combine.txt

        
   done



