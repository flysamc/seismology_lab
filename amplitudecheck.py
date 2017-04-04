

def findvalue(i):
	with open('realdata.txt') as file2:
		for line in file2:
			col2 = [float(x) for x in line.split()]
			if( i == col2[0]):
				return(col2[1])
			else:
				pass



with open('combine.txt') as file1:
	for line in file1:
		col = [float(x) for x in line.split()]
		c = findvalue(col[2])
		d = findvalue(col[3])
		e = findvalue(col[4])
		print(c, end=" ")
		print(d, end=" ")
		print(e)

