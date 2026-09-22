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
df = df.dropna(subset =['product_name'])
df = df.dropna(thresh = len(df.columns) - 4)
df = df.drop_duplicates(keep = 'first')

df ['revenue'] = df['price'] * df['quantity_sold']
keyboards = df[df['category'] == 'Keyboards']
top10_keyboards = keyboards.sort_values(by='revenue', ascending=False).head(10)
print("TOP 10 Keyboards by Revenue:")
print(top10_keyboards[['product_name','price','quantity_sold', 'revenue']].to_string(index=False))

tvs = df[df['category'] == 'TVs']
bottom10_tvs = tvs.sort_values(by='revenue', ascending=True).head(10)
print("TOP 10 TVs sa najmanjim prihodom:")
print(bottom10_tvs[['product_name', 'price', 'quantity_sold', 'revenue']].to_string(index=False))