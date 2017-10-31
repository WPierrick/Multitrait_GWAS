#Script to compute the mean and median for the N column across all the files in a directory

import pandas as pd
import numpy as np
from os import listdir
from os.path import isfile, join
from scipy.sparse import vstack
import csv

mypath = "/home/uqpwains/GWA_sumstats/data/03_colpicked/"
file_names = [f for f in listdir(mypath) if isfile(join(mypath, f))]
print file_names

result_array = np.empty((0, 3))

for f_name in file_names:
	df_tmp = pd.read_csv(f_name, sep = r'\s+')
	mean1 = df_tmp['N'].mean()
	median1 = df_tmp['N'].median()
	newrow = [f_name, mean1, median1]
	result_array = np.append(result_array, [newrow], axis=0)
	#df = vstack((df, newrow))
	#A = numpy.concatenate((df,newrow))


with open('GWA_sumstats_N_recap.txt', 'w') as f:
	x=csv.writer(f)
	for i in result_array:
		x.writerow(i)
