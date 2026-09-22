import pandas as pd
df = pd.read_csv('DAPUP4_Task_05_01-fit_trackr_data.csv')

df['Duration'] = pd.to_numeric(df['Duration'].str.replace('min', ''),errors='coerce')
df['Calories'] = pd.to_numeric(df['Calories'].str.replace('kcal', ''),errors='coerce')

df = df.drop_duplicates(keep='first')
df = df.dropna(subset=['Username'],how='any')

df['Activity'] = df['Activity'].str.strip().str.lower()
df['Activity']=df['Activity'].replace({
    'walk':'walking',
    'Walk':'walking',
    'swimm':'swimming',
    'swim':'swimming',
})

prosjecno_trajanje = df['Duration'].mean()
print("Prosjecno trajanje aktivnosti:",round (prosjecno_trajanje,2),"min")

najcesce_raspolozenje = df['Mood'].mode()[0]
print("Najcesce raspolozenje korisnika:",najcesce_raspolozenje)

std_kalorije = df['Calories'].std()
print("Standardna devijacija kalorija:",round(std_kalorije,2))

q1 = df['Age'].quantile(0.25)
q3 = df['Age'].quantile(0.75)
iqr = q3 - q1
print("IQR godina korisnika:",iqr)

