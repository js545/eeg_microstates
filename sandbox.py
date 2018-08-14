import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

n_timepoints = 300

df = pd.read_csv('RestingState_data.csv', header=None, usecols=np.arange(n_timepoints))

plt.figure()

for col in df.columns.tolist():
    plt.plot(np.arange(df.shape[0]), list(df[col]))

plt.show()

