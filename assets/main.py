import json

f = open("dataframe.json", "r")

j = json.load(f)

print(j)
""" 
import pandas as pd
# Read data from file 'filename.csv'
# (in the same directory that your python process is based)
# Control delimiters, rows, column names with read_csv (see later)
data = pd.read_csv("ubs.csv")
df = data.filter(["lat", "long", "no_fantasia", "no_logradouro",
                  "nu_telefone", "co_cep", "uf", "cidade"])
a = df.to_json(
    r'/Users/gabssanto/AndroidStudioProjects/covid_19/assets/dataframe.json')
print(a)
 """
