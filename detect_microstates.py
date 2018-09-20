import pylab
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

n_timepoints = 5000
df = pd.read_csv('RestingState_data.csv', header=None, usecols=np.arange(n_timepoints, n_timepoints + 10000))
SS_vect = []
data = []

for col in df.columns.tolist():

    data.append(df[col])

    temp = df[col] * df[col]

    temp = np.sqrt(np.sum(temp)/df.shape[0])

    SS_vect.append(temp)

for col in range(df.shape[0]):

    plt.plot(np.arange(df.shape[1]), df.iloc[col], alpha=.1)

plt.plot(np.arange(df.shape[1]), SS_vect)
plt.show()

def thresholding_algo(y, lag, threshold, influence):
    signals = np.zeros(len(y))
    filteredY = np.array(y)
    avgFilter = [0]*len(y)
    stdFilter = [0]*len(y)
    avgFilter[lag - 1] = np.mean(y[0:lag])
    stdFilter[lag - 1] = np.std(y[0:lag])
    for i in range(lag, len(y) - 1):
        if abs(y[i] - avgFilter[i-1]) > threshold * stdFilter [i-1]:
            if y[i] > avgFilter[i-1]:
                signals[i] = 1
            else:
                signals[i] = -1

            filteredY[i] = influence * y[i] + (1 - influence) * filteredY[i-1]
            avgFilter[i] = np.mean(filteredY[(i-lag):i])
            stdFilter[i] = np.std(filteredY[(i-lag):i])
        else:
            signals[i] = 0
            filteredY[i] = y[i]
            avgFilter[i] = np.mean(filteredY[(i-lag):i])
            stdFilter[i] = np.std(filteredY[(i-lag):i])

    return dict(signals = np.asarray(signals),
                avgFilter = np.asarray(avgFilter),
                stdFilter = np.asarray(stdFilter))

# Identify local maxima along GFP

lag = 100
threshold = 3
influence = .5

result = thresholding_algo(SS_vect, lag=lag, threshold=threshold, influence=influence)

pylab.subplot(211)
pylab.plot(np.arange(1, len(SS_vect)+1), SS_vect)

pylab.plot(np.arange(1, len(SS_vect)+1),
           result["avgFilter"], color="cyan", lw=2)

pylab.plot(np.arange(1, len(SS_vect)+1),
           result["avgFilter"] + threshold * result["stdFilter"], color="green", lw=2)

pylab.plot(np.arange(1, len(SS_vect)+1),
           result["avgFilter"] - threshold * result["stdFilter"], color="green", lw=2)

pylab.subplot(212)
pylab.step(np.arange(1, len(SS_vect)+1), result["signals"], color="red", lw=2)
pylab.ylim(-1.5, 1.5)

plt.show()

data = np.array(data)

kmeans = KMeans(n_clusters=4).fit(data)

kmeans.cluster_centers_