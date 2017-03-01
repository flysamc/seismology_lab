import matplotlib.pyplot as plt

'''
help: this program is used to convert seismic data text(converting seismic ascii file from sac file) to array and then
plot the data time v/s amplitude using matplotlib 
'''

#plot the seismic data on x is "time" and y is "amplitude"
def plotseis(x,y):
	plt.plot(x,y)
	plt.ylabel("amplitude")
	plt.show()


#convert the text string file to individual string in an array
def process(input_text,cat_array):
	input_string = input_text.read()
	processed_array = input_string.split()
	cat_array = cat_array + processed_array
	return cat_array

#manage ins and out and our main function
def main():
	cat_array = []
	input_text = open("seis1_cut.txt","r")
	delta = 0.01
	y = stringtofloat(process(input_text,cat_array))
	x = timearray(y,delta)
	plotseis(x,y)
	input_text.close()
#convert the converted string array to float array
def stringtofloat(cat_array):
	floatarray = []
	for i in range(len(cat_array)):
		floatarray.append(float(cat_array[i]))
	return floatarray
#create a time series for ploting purpose
def timearray(floatarray,delta):
	length = len(floatarray)
	timearray = []
	for i in range(length):
		timearray.append(i*delta)
	return timearray		

	

main()

	

