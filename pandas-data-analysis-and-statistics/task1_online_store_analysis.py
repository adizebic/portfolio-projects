import pandas as pd
df = pd.read_csv("DAPUP4_Task_01_01-online_store_data.csv")

print("Ukupan broj proizvoda: ")
print(df.shape[0])

print("Najprodavaniji proizvod: ")
sortirani = df.sort_values('quantity_sold', ascending=False)
print(sortirani.head(1))

print(" Top 5 najprodavanijih mobilnih telefona: ")
smartphones = df[df['category'] == 'Smartphones']
sortirani_smartphones = smartphones.sort_values('quantity_sold', ascending=False)
print(sortirani_smartphones.head(5))

print("Cijene laptopa:")
laptops = df[df['category'] == 'Laptops']
laptops = laptops.dropna()
laptops = laptops[laptops["price"] > 0]
sortirani_laptopi = laptops.sort_values('price', ascending=False)
najskuplji = sortirani_laptopi.head(1)
najjeftiniji = sortirani_laptopi.tail(1)
print("Najskuplji laptop-cijena : ",najskuplji['price'].values[0])
print("Najjeftiniji laptop-cijena : ",najjeftiniji['price'].values[0])