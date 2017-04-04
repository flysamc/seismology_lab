_____________________________________________________________________________________
SIMPLE RUN THE FILE "compute-by-hk-stacking.sh"
it will take a lot of time cause the programming is very crappy.
it will generate some text files on the way.
final answer for single station of single reciver function is shown in the end.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
STEPS TO CALCULATE THE "H" AND "VP/VS" RATIO USING KANAMORI METHOD

1.	run compute-by-hk-stacking.sh on command line by typing "sh compute-by-hk-stacking.sh"
2.	first it will generate two files with name 
a.	kanamori-time-t1-t2-t3.txt
b.	kanamori-he-ke-te.txt
first file only contain t1 t2 t3 while second file contain h vp/vs and correspond t1 t2 t3
3.	we will then round the time to two decimal places and store in "kanamori-he-ke-roundedtime.txt"
4.	the result of the file will combine with the previous one two form a single file "combine.txt"
5.	we will then change the data of station reciver function using "change-digit.sh" and store in "realdata.txt"
6.  then we use "amplitudecheck.py" to find the amplitude for the correspoding time and store in "finalamplitude.txt"
7.	use the "finalamplitude.txt" to find the calculate S(h,vp/vs) and store in "amplitudesum.txt"
8.	finally compile the whole data into single file using "table.sh" and store the final value in "table.txt"
9.  Lastly using "findmax.py" we will calculate the column for which we get the maximun S value 
10 print the value of h and vp/vs on commmand terminal 

