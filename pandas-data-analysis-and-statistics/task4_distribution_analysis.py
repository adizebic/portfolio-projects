import pandas as pd
df= pd.read_csv('DAPUP4_Task_02_01-online_store_data.csv')

#Transformacija
df['quantity_sold'] = pd.to_numeric(df['quantity_sold'],errors='coerce').astype('Int32')
df['num_of_ratings'] = pd.to_numeric(df['num_of_ratings'],errors='coerce').astype('Int32')
df['quantity_in_stock'] = pd.to_numeric(df['quantity_in_stock'],errors='coerce').astype('Int32')
df['date_added'] = pd.to_datetime(df["date_added"],errors='coerce')
def extract_rating(value):
    try:
        return float(str(value).split()[0])
    except(ValueError,AttributeError):
        return None
df['rating']= df['rating'].apply(extract_rating)
df = df.dropna(subset=['product_name'])
df = df.dropna(thresh=len(df.columns)-4)
df = df.drop_duplicates(keep='first')

#Razlika izmedju najboljeg i njalosijeg TVa
tvs =df[df['category'] == 'TVs']
max_ocjena = tvs['rating'].max()
min_ocjena = tvs['rating'].min()
razlika = max_ocjena - min_ocjena
print('Najbolja ocjena TV-a:', max_ocjena)
print('Najlosija ocjena TV-a:', min_ocjena)
print('Razlika(opseg):',round(razlika,2))

#Cjenovni rang smartphonea
smartphones = df[df['category'] == 'Smartphones']
q1= smartphones['price'].quantile(0.25)
q3= smartphones['price'].quantile(0.75)
iqr = q3 - q1
print('\nCjenovni rang pametnih telefona(IQR):')
print('q1(25%):', round(q1,2))
print('q3(75%):', round(q3,2))
print('IQR:', round(iqr,2))
#TOP 5 brendova sa najujednacenijim ocjenama
std_po_brandu = df.groupby('brand')['rating'].std().sort_values(ascending=True).head(5)
print('\nTOP 5 brendova sa najujednacenijim ocjenama:')
print(std_po_brandu.to_string())

#Broj recenzija/broj prodatih jedinica
q1_rec= df['num_of_ratings'].quantile(0.25)
q2_rec= df['num_of_ratings'].quantile(0.50)
q3_rec= df['num_of_ratings'].quantile(0.75)
def dodijela_kvartila(value):
    if value <= q1_rec:
        return '1st quartile'
    elif value <= q2_rec:
        return '2nd quartile'
    elif value <= q3_rec:
        return '3rd quartile'
    else:
        return '4th quartile'
df['kvartil_recenzija'] = df['num_of_ratings'].apply(dodijela_kvartila)
prodaje_po_kvartilu = df.groupby('kvartil_recenzija')['quantity_sold'].sum()
print('\nBroj prodatih jedinica po kvartilima recenzija:')
print(prodaje_po_kvartilu.to_string())

