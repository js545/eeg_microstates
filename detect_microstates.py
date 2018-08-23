import pylab
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

n_timepoints = 100000

df = pd.read_csv('RestingState_data.csv', header=None, usecols=np.arange(n_timepoints, n_timepoints + 10000))

SS_vect = []

data = []

for col in df.columns.tolist():

    data.append(df[col])

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
# plt.savefig('/Users/jakeson/Desktop/eeg_gfp_500ms.png', dpi=600)
plt.show()

# Next steps
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5671986/

# First order derivative of global field power (GFP)


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




########################################################################################################################

# TODO Test new code

from scipy.interpolate import griddata


def read_csv(filename):
    """Read EEG electrode locations in xyz format

    Args:
        filename: full path to the '.xyz' file
    Returns:
        locs: n_channels x 3 (numpy.array)
    """
    # ch_names = []
    # locs = []
    # with open(filename, 'r') as f:
    #     l = f.readline()  # header line
    #     while l:
    #         l = f.readline().strip().split("\t")
    #         if (l != ['']):
    #             ch_names.append(l[0])
    #             locs.append([float(l[1]), float(l[2]), float(l[3])])
    #         else:
    #             l = None

    df = pd.read_csv('cap.csv')

    ch_names = []
    locs = []

    for row in df.iterrows():

        locs.append([row[1][1], row[1][2], row[1][3]])
        ch_names.append(row[1][0])

    return ch_names, np.array(locs)


def locmax(x):
    """Get local maxima of 1D-array

    Args:
        x: numeric sequence
    Returns:
        m: list, 1D-indices of local maxima
    """

    dx = np.diff(x) # discrete 1st derivative
    zc = np.diff(np.sign(dx)) # zero-crossings of dx
    m = 1 + np.where(zc == -2)[0] # indices of local max.
    return m


def findstr(s, L):
    """Find string in list of strings, returns indices.

    Args:
        s: query string
        L: list of strings to search
    Returns:
        x: list of indices where s is found in L
    """

    x = [i for i, l in enumerate(L) if (l==s)]
    return x


def topo(data, n_grid=111):
    """Interpolate EEG topography onto a regularly spaced grid

    Args:
        data: numpy.array, size = number of EEG channels
        n_grid: integer, interpolate to n_grid x n_grid array, default=64
    Returns:
        data_interpol: cubic interpolation of EEG topography, n_grid x n_grid
                       contains nan values
    """
    channels, locs = read_csv('cap.csv')
    n_channels = len(channels)
    #locs /= np.sqrt(np.sum(locs**2,axis=1))[:,np.newaxis]
    locs /= np.linalg.norm(locs, 2, axis=1, keepdims=True)
    c = findstr('Cz', channels)[0]
    # print 'center electrode for interpolation: ' + channels[c]
    #w = np.sqrt(np.sum((locs-locs[c])**2, axis=1))
    w = np.linalg.norm(locs-locs[c], 2, axis=1)
    #arclen = 2*np.arcsin(w/2)
    arclen = np.arcsin(w/2.*np.sqrt(4.-w*w))

    # phi = np.angle(map(complex, locs[:,0]-locs[c][0], locs[:,1]-locs[c][1]))
    phi = 32
    X = arclen*np.real(np.exp(1j*phi))
    Y = arclen*np.imag(np.exp(1j*phi))
    r = max([max(X),max(Y)])
    Xi = np.linspace(-r,r,n_grid)
    Yi = np.linspace(-r,r,n_grid)

    print(X)
    print(Y)
    data_ip = griddata((X, Y), data, (Xi[None,:], Yi[:,None]), method='cubic')
    return data_ip


def eeg2map(data):
    """Interpolate and normalize EEG topography, ignoring nan values

    Args:
        data: numpy.array, size = number of EEG channels
        n_grid: interger, interpolate to n_grid x n_grid array, default=64
    Returns:
        top_norm: normalized topography, n_grid x n_grid
    """
    n_grid = 111
    top = topo(data, n_grid)
    mn = np.nanmin(top)
    mx = np.nanmax(top)
    top_norm = (top-mn)/(mx-mn)
    return top_norm


def kmeans(data, n_maps, n_runs=10, maxerr=1e-6, maxiter=500, doplot=False):
    """Modified K-means clustering as detailed in:
    [1] Pascual-Marqui et al., IEEE TBME (1995) 42(7):658--665
    [2] Murray et al., Brain Topography(2008) 20:249--264.
    Variables named as in [1], step numbering as in Table I.

    Args:
        data: numpy.array, size = number of EEG channels
        n_maps: number of microstate maps
        n_runs: number of K-means runs (optional)
        maxerr: maximum error for convergence (optional)
        maxiter: maximum number of iterations (optional)
        doplot: plot the results, default=False (optional)
    Returns:
        maps: microstate maps (number of maps x number of channels)
        L: sequence of microstate labels
        gfp_peaks: indices of local GFP maxima
        gev: global explained variance (0..1)
        cv: value of the cross-validation criterion
    """
    n_t = data.shape[0]
    n_ch = data.shape[1]
    data = data - data.mean(axis=1, keepdims=True)

    # GFP peaks
    gfp = np.std(data, axis=1)
    gfp_peaks = locmax(gfp)
    gfp_values = gfp[gfp_peaks]
    gfp2 = np.sum(gfp_values**2) # normalizing constant in GEV
    n_gfp = gfp_peaks.shape[0]

    # clustering of GFP peak maps only
    V = data[gfp_peaks, :]
    sumV2 = np.sum(V**2)

    # store results for each k-means run
    cv_list =   []  # cross-validation criterion for each k-means run
    gev_list =  []  # GEV of each map for each k-means run
    gevT_list = []  # total GEV values for each k-means run
    maps_list = []  # microstate maps for each k-means run
    L_list =    []  # microstate label sequence for each k-means run
    for run in range(n_runs):
        # initialize random cluster centroids (indices w.r.t. n_gfp)
        rndi = np.random.permutation(n_gfp)[:n_maps]
        maps = V[rndi, :]
        # normalize row-wise (across EEG channels)
        maps /= np.sqrt(np.sum(maps**2, axis=1, keepdims=True))
        # initialize
        n_iter = 0
        var0 = 1.0
        var1 = 0.0
        # convergence criterion: variance estimate (step 6)
        while ( (np.abs((var0-var1)/var0) > maxerr) & (n_iter < maxiter) ):
            # (step 3) microstate sequence (= current cluster assignment)
            C = np.dot(V, maps.T)
            C /= (n_ch*np.outer(gfp[gfp_peaks], np.std(maps, axis=1)))
            L = np.argmax(C**2, axis=1)
            # (step 4)
            for k in range(n_maps):
                Vt = V[L==k, :]
                # (step 4a)
                Sk = np.dot(Vt.T, Vt)
                # (step 4b)
                evals, evecs = np.linalg.eig(Sk)
                v = evecs[:, np.argmax(np.abs(evals))]
                maps[k, :] = v/np.sqrt(np.sum(v**2))
            # (step 5)
            var1 = var0
            var0 = sumV2 - np.sum(np.sum(maps[L, :]*V, axis=1)**2)
            var0 /= (n_gfp*(n_ch-1))
            n_iter += 1
        if (n_iter < maxiter):
            print("\t\tK-means run {:d}/{:d} converged after {:d} iterations.".format(run+1, n_runs, n_iter))
        else:
            print("\t\tK-means run {:d}/{:d} did NOT converge after {:d} iterations.".format(run+1, n_runs, maxiter))

        # CROSS-VALIDATION criterion for this run (step 8)
        C_ = np.dot(data, maps.T)
        C_ /= (n_ch*np.outer(gfp, np.std(maps, axis=1)))
        L_ = np.argmax(C_**2, axis=1)
        var = np.sum(data**2) - np.sum(np.sum(maps[L_, :]*data, axis=1)**2)
        var /= (n_t*(n_ch-1))
        cv = var * (n_ch-1)**2/(n_ch-n_maps-1.)**2

        # GEV (global explained variance) of cluster k
        gev = np.zeros(n_maps)
        for k in range(n_maps):
            r = L==k
            gev[k] = np.sum(gfp_values[r]**2 * C[r,k]**2)/gfp2
        gev_total = np.sum(gev)

        # store
        cv_list.append(cv)
        gev_list.append(gev)
        gevT_list.append(gev_total)
        maps_list.append(maps)
        L_list.append(L_)

    # select best run
    k_opt = np.argmin(cv_list)
    #k_opt = np.argmax(gevT_list)
    maps = maps_list[k_opt]
    # ms_gfp = ms_list[k_opt] # microstate sequence at GFP peaks
    gev = gev_list[k_opt]
    L_ = L_list[k_opt]

    if doplot:
        plt.ion()
        # matplotlib's perceptually uniform sequential colormaps:
        # magma, inferno, plasma, viridis
        cm = plt.cm.magma
        fig, axarr = plt.subplots(1, n_maps, figsize=(20,5))
        fig.patch.set_facecolor('white')
        for imap in range(n_maps):
            axarr[imap].imshow(eeg2map(maps[imap, :]), cmap=cm, origin='lower')
            axarr[imap].set_xticks([])
            axarr[imap].set_xticklabels([])
            axarr[imap].set_yticks([])
            axarr[imap].set_yticklabels([])
        title = "K-means cluster centroids"
        axarr[0].set_title(title, fontsize=16, fontweight="bold")
        plt.show()

        # --- assign map labels manually ---
        order_str = input("\n\t\tAssign map labels (e.g. 0, 2, 1, 3): ")
        order_str = order_str.replace(",", "")
        order_str = order_str.replace(" ", "")
        if (len(order_str) != n_maps):
            if (len(order_str)==0):
                print("\t\tEmpty input string.")
            else:
                print("\t\tParsed manual input: {:s}".format(", ".join(order_str)))
                print("\t\tNumber of labels does not equal number of clusters.")
            print("\t\tContinue using the original assignment...\n")
        else:
            order = np.zeros(n_maps, dtype=int)
            for i, s in enumerate(order_str):
                order[i] = int(s)
            print("\t\tRe-ordered labels: {:s}".format(", ".join(order_str)))
            # re-order return variables
            maps = maps[order,:]
            for i in range(len(L)):
                L[i] = order[L[i]]
            gev = gev[order]
            # Figure
            fig, axarr = plt.subplots(1, n_maps, figsize=(20,5))
            fig.patch.set_facecolor('white')
            for imap in range(n_maps):
                axarr[imap].imshow(eeg2map(maps[imap, :]), cmap=cm, origin='lower')
                axarr[imap].set_xticks([])
                axarr[imap].set_xticklabels([])
                axarr[imap].set_yticks([])
                axarr[imap].set_yticklabels([])
            title = "re-ordered K-means cluster centroids"
            axarr[0].set_title(title, fontsize=16, fontweight="bold")
            plt.show()
            plt.ioff()
    #return maps, L_, gfp_peaks, gev, cv
    return maps


kmeans_data = []

for item in data:

    kmeans_data.append(item)

kmeans_data = np.array(kmeans_data)


maps = kmeans(kmeans_data, n_maps=4, n_runs=10, maxerr=1e-6, maxiter=500, doplot=False)

maps0 = maps[0]
maps1 = maps[1]
maps2 = maps[2]
maps3 = maps[3]

output_dict = {'A': maps0, 'B': maps1, 'C': maps2, 'D': maps3}

df = pd.DataFrame.from_dict(output_dict)

df.to_csv('/Users/jakeson/Documents/CMI/eeg_micro/microstates.csv')