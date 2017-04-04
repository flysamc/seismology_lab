


#define the weights value
w1=0.6
w2=0.3
w3=0.1

with open("finalamplitude.txt") as file1:
	for line in file1:
		amp = [float(x) for x in line.split()]
		shk = w1*amp[0] + w2*amp[1] + w3*amp[2]
		print(shk)
