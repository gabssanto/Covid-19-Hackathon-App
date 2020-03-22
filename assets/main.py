""" import json

f = open("dataframe.json", "r")

j = json.load(f)

print(j) """
# Read data from file 'filename.csv'
# (in the same directory that your python process is based)
# Control delimiters, rows, column names with read_csv (see later)
""" import csv
import pandas as pd
data = pd.read_csv("ubs.csv")
df = data.filter(["lat", "long", "no_fantasia", "no_logradouro",
                  "nu_telefone", "co_cep", "uf", "cidade"])
a = df.to_csv(
    r'/Users/gabssanto/AndroidStudioProjects/covid_19/assets/dataframe.csv', sep=',',) """
# print(df.values)

""" file = open("test.txt", "w")
file.write('[')
# file.write(str(df.values))


with open('dataframe.csv') as csvfile:
    readCSV = csv.reader(csvfile, delimiter='@')
    for row in readCSV:
        # print(column)
        print(row[0] + ',')
        file.write(row[0] + ',')
        #print(column[0], column[1], column[2],)
file.write(']')

file.close()
 """
import csv
index = []
lat = []
long = []
no_fantasia = []
no_logradouro = []
nu_telefone = []
co_cep = []
uf = []
cidade = []


with open('dataframe.csv', newline='', encoding='utf-8') as csvfile:
    sr = csv.DictReader(csvfile)
    for row in sr:
        index.append(row['index'])
        lat.append(row['lat'])
        long.append(row['long'])
        no_fantasia.append(row['no_fantasia'])
        no_logradouro.append(row['no_logradouro'])
        nu_telefone.append(row['nu_telefone'])
        co_cep.append(row['co_cep'])
        uf.append(row['uf'])
        cidade.append(row['cidade'])

print(index)
