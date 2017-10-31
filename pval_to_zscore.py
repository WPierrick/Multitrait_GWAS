from scipy import stats
from os import listdir
from os.path import isfile, join
import math

#mypath = "/home/uqpwains/GWA_sumstats/data/07/"


#file_names = [f for f in listdir(mypath) if isfile(join(mypath, f))]


#for f_name in file_names:

#with open(f_name+"_zscore.txt", "w") as testfile:
#	df_tmp = open(f_name, "r")

with open("test.txt", "w") as testfile:
	df_tmp = open("/home/uqpwains/GWA_sumstats/data/03_colpicked_a_delete/ADHD_Eur_Demontis_etal_2017_colsubset.txt", "r")
	lines=df_tmp.readlines()[1:]
	for i in lines:
		relou = str(i).split()
		betasign = relou[3]
		pval  = relou[5]
		print pval
		if betasign > 0:
			zval = math.sqrt(scipy.stats.chi2.ppf(float(pval),1))
			print zval
			#testfile.write(i.rstrip('\n') + '\s' + str(zval) + '\n')
			#i.append(sqrt(scipy.stats.chi2.ppf(pval,1)) * 1)
			#testfile.write(str(i))
		else:
			#i.append(sqrt(scipy.stats.chi2.ppf(pval,1)) * -1)
			#testfile.write(str(i))
			pass



