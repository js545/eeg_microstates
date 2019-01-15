import os
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

group = []

for filename in os.listdir('/Users/jake.son/Desktop/labels'):
    
    print(filename)
    
    filename = os.path.join('/Users/jake.son/Desktop/labels/', filename)
    
    df = pd.read_csv(filename)
    labels = df.columns.tolist()
    
    labels = [x[0] for x in labels]
    
    group.append(labels)

global_min = 99999

for i in range(len(group)):
    
    local_min = len(group[i])
    
    if local_min < global_min:
    
        global_min = local_min
    
print(global_min)

group = [[float(x) for x in l[:global_min]] for l in group]

df = pd.DataFrame.from_records(group)

ax = sns.heatmap(df[[x for x in range(12000, 15000)]], annot=False, cbar=False)

# ax = sns.heatmap(df, annot=False, cbar=False)

plt.show()

