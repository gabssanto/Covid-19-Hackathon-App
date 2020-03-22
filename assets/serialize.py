import pandas as pd
import numpy as np


data = pd.read_csv('data.csv')

for c in data.columns:
    filename = c + '.txt'
    with open(filename, 'w') as f:
        for item in np.array(data[c]).tolist():
            f.write("'%s'," % item)
