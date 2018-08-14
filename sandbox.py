import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

n_timepoints = 500

df = pd.read_csv('RestingState_data.csv', header=None, usecols=np.arange(n_timepoints))

SS_vect = []

for col in df.columns.tolist():

    temp = df[col] * df[col]

    temp = np.sqrt(np.sum(temp)/df.shape[0])

    SS_vect.append(temp)

plt.figure()
plt.title("Global Field Power and Individual Channels")
plt.xlabel('Time (ms)')
plt.ylabel('Amplitude')

for col in range(df.shape[0]):

    plt.plot(np.arange(df.shape[1]), df.iloc[col], alpha=.1)

plt.plot(np.arange(df.shape[1]), SS_vect)
plt.savefig('/Users/jakeson/Desktop/eeg_gfp_500ms.png', dpi=600)
plt.show()

# Next steps
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5671986/