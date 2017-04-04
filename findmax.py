

with open("table.txt") as file1:
	c = -1000
	for line in file1:
		amp = [float(x) for x in line.split()]
		if(amp[8] > c):
			c = amp[8]
			h = amp[0]
			k = amp[1]
	print(c,h,k)
