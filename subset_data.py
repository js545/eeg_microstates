# Jake Son
# Child Mind Institute
# Creates .mat file with a subset of participants meeting age and data quality requirements

import os
import json
import pandas as pd
from scipy.io import savemat

# os.chdir('/home/matlab/Desktop/Jake-microstates/eeg_micro')
os.chdir('/data2/Projects/Jake_matlab/microstates_project')

pheno = pd.read_csv('HBN_Pheno_EEG.csv')
# pheno = pheno[pheno.Age > 12][pheno.Age < 18]

ratings = pd.read_csv('ratings.csv')
# ratings = ratings[(ratings.Rating == 5) | (ratings.Rating == 4)]
ratings = ratings[(ratings.Rating == 5)]

eid_list = []

for eid in ratings.EID:
    if eid in list(pheno.EID):
        eid_list.append(eid)

eid_dict = {}
eid_dict['EID'] = eid_list

# Save as .mat file
savemat('/data2/Projects/Jake_matlab/microstates_project/eid_list.mat', mdict = eid_dict)

# Save as .txt file (for shell script that copies raw data)
# Shell script can't read in .mat file that contains EID list
with open('/data2/Projects/Jake_matlab/microstates_project/eid_list.txt', 'w') as filehandle:  
    for listitem in eid_list:
        filehandle.write('%s\n' % listitem)
