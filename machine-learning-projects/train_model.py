import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import LinearSVC
import pickle

podaci=pd.read_csv('products.csv')
podaci.columns=podaci.columns.str.strip()
podaci.columns=podaci.columns.str.lstrip('_')

zamjene_kategorija={
    'fridge':'Fridges',
    "CPU":"CPUs",
    "Mobile Phone":"Mobile Phones"
}
podaci["Category Label"]=podaci["Category Label"].replace(zamjene_kategorija)

podaci=podaci.dropna(subset=["Product Title","Category Label"]).copy()
print("Broj proizvoda za treniranje:",len(podaci))

x=podaci['Product Title']
y=podaci['Category Label']

vektorizator=TfidfVectorizer()
x_vektorizovano=vektorizator.fit_transform(x)
model=LinearSVC()
model.fit(x_vektorizovano,y)
print("Model je treniran.")
with open('model.pkl','wb') as fajl:
    pickle.dump(model,fajl)
with open('vektorizator.pkl','wb') as fajl:
    pickle.dump(vektorizator,fajl)
print("Model je sacuvan model.pkl.")
print("Vektorizator je sacuvan vektorizator.pkl.")