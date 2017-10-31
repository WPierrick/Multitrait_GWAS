### Script to build the genetic correlation matrix from

import pandas as pd
import numpy as np
import re
from os import listdir
from os.path import isfile, join

mypath = "/home/uqpwains/GWA_sumstats/data/06_genetic_correlations/"
file_names = [f for f in listdir(mypath) if isfile(join(mypath, f))]

#Populate a matrix with file names
#for f in file_names:
#	print f

# Get the genetic correlation for each combination
#result_array = np.empty((0, 3))

listRG = []
GWAS_names = []
#w, h = 45, 45
#matrix_corr = [[0 for x in range(w)] for y in range(h)] 
posx = 0
posy = 0
print GWAS_names
for f_name in file_names:
	df_tmp = open(f_name, "r")
	lines=df_tmp.readlines()
	for i in lines:
		if "--rg" in i :
			localfile = re.split('/|,\n', i)
			a = localfile[8][:-1]
			b = localfile[16][:-3]
			if a not in GWAS_names:
				GWAS_names.append(a)
			elif b not in GWAS_names:
				GWAS_names.append(b)
			else:
				pass
			#matrix_corr.insert([posx][], localfile[8][:-1])
			#posx += 1 
			#matrix_corr.insert([][posy], localfile[16][:-3])
			#posy += 1
		else:
			pass


correlations = np.eye(45)
genet_corr = pd.DataFrame(correlations, index = GWAS_names, columns = GWAS_names)
#print genet_corr

for f_name in file_names:
	df_tmp = open(f_name, "r")
	lines=df_tmp.readlines()
	for i in lines:
		if "--rg" in i :
			localfile = re.split('/|,\n', i)
			a = localfile[8][:-1]
			b = localfile[16][:-3]
		else:
			if "Genetic Correlation:" in i :
				local_rg  = str(i).split()
				local_rg  = local_rg[2]
				#print local_rg
				genet_corr.loc[a,b] = local_rg
				genet_corr.loc[b,a] = local_rg
			else:
				pass

genet_corr.to_csv("correlation_matrix.csv", sep='\t')


			'''if "Genetic Correlation:" in i :
				local_rg  = str(i).split()
				listRG.append(local_rg[2])
			else:
				pass'''

#dim(files1)
#print matrix_corr
#print listRG

# Add the the genetic correlation in the correlation matrix


'''
result_array = np.empty((0, 3))

for f_name in file_names:
	df_tmp = pd.read_csv(f_name, sep = r'\s+')
	mean1 = df_tmp['N'].mean()
	median1 = df_tmp['N'].median()
	newrow = [f_name, mean1, median1]
	result_array = np.append(result_array, [newrow], axis=0)
	
with open('GWA_sumstats_N_recap.txt', 'w') as f:
	x=csv.writer(f)
	for i in result_array:
		x.writerow(i)
'''