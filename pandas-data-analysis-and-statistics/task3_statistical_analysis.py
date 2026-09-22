import pandas as pd

df = pd.read_csv('DAPUP4_Task_02_01-online_store_data.csv')

df['quantity_sold'] = pd.to_numeric(df['quantity_sold'], errors='coerce').astype('Int32')
df['num_of_ratings'] = pd.to_numeric(df['num_of_ratings'], errors='coerce').astype('Int32')
df['quantity_in_stock'] = pd.to_numeric(df['quantity_in_stock'], errors='coerce').astype('Int32')
df['date_added'] = pd.to_datetime(df['date_added'], errors='coerce')

def extract_rating(value):
    try:
        return float(value.split()[0])
    except (ValueError, AttributeError):
        return None
    
df['rating'] = df['rating'].apply(extract_rating)
df = df.dropna(subset=['product_name'])
df = df.dropna(thresh=len(df.columns) - 4)
df = df.drop_duplicates(keep='first')

prosjecna_ocjena = df['rating'].mean()
print('Prosjecna ocjena proizvoda:',round(prosjecna_ocjena, 2))

najcesci_brend = df['brand'].mode()[0]
print('Najcesci brend:', najcesci_brend)

najprodavaniji_brend = df.groupby('brand')['quantity_sold'].sum().sort_values(ascending=False).index[0]
print('Najprodavaniji brend:', najprodavaniji_brend)

ocjena_po_kategorijama = df.groupby('category')['rating'].mean().round(2)
print("\nProsjecna ocjena po kategorijama:")
print(ocjena_po_kategorijama.to_string())

popularnost_po_bojama =df.groupby('color')['quantity_sold'].sum().sort_values(ascending=False)
print("\nPopularnost po bojama:")
print(popularnost_po_bojama.to_string())

efikasnost = df.groupby('brand').agg(
    quantity_sold = ('quantity_sold', 'sum'),
    quantity_in_stock = ('quantity_in_stock', 'sum')
  )
efikasnost['efikasnost'] = efikasnost['quantity_sold'] / (efikasnost['quantity_sold'] + efikasnost['quantity_in_stock'])
top5_brendovi = efikasnost.sort_values(by='efikasnost', ascending=False).head(5)
print("\nTop 5 najefikasnijih brendova:")
print(top5_brendovi[['quantity_sold', 'quantity_in_stock', 'efikasnost']].to_string())