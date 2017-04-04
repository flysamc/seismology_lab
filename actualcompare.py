
import math
def check(i):
	if((i*100)%10 > 5):
		i = float(math.ceil(i*10)/10)
	elif((i*100)%10 ==  5):
		pass
	else:
		i = float(math.floor(i*10)/10)
	return i

#f= open('finaltime2.txt','w+')
with open('kanamori-time-t1-t2-t3.txt') as file1:
	for line in file1:
		col = [float(x) for x in line.split()]
		col[0] = check(col[0])
		col[1] = check(col[1])
		col[2] = check(col[2])
		print(col[0], end=" ")
		print(col[1],end=" ")
		print(col[2])




		


	

