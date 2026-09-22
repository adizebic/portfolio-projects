import pandas as pd
df = pd.read_csv('movies.csv')
df["budget"]=pd.to_numeric(df["budget"], errors='coerce')
df["box_office"]=pd.to_numeric(df["box_office"], errors='coerce')
usa = df[df["country"]=="USA"]
usa["balance"]=usa["box_office"]-usa["budget"]
usa=usa.drop(columns=["language","country","duration","budget","box_office"])
usa=usa.sort_values(by="balance", ascending=False)
usa=usa.head(10)
usa.to_excel("USA_top10_movies.xlsx", index=False)

russia= df[df["country"]=="Russia"]
russia["balance"]=russia["box_office"]-russia["budget"]
russia=russia.drop(columns=["language","country","duration","budget","box_office"])
russia=russia.sort_values(by="balance", ascending=False)
russia=russia.head(10)
russia.to_excel("top10_russian_movies.xlsx", index=False)

england = df[df["country"]=="UK"]
england["balance"]=england["box_office"]-england["budget"]
england=england.drop(columns=["language","country","duration","budget","box_office"])
england=england.sort_values(by="balance", ascending=False)
england=england.head(10)
england.to_excel("top10_english_movies.xlsx", index=False)

korea = df[df["country"]=="South Korea"]
korea["balance"]=korea["box_office"]-korea["budget"]
korea=korea.drop(columns=["language","country","duration","budget","box_office"])
korea=korea.sort_values(by="balance", ascending=False)
korea=korea.head(10)
korea.to_excel("top10_korean_movies.xlsx", index=False)

print("ETL proces zavrsen/Etl procces finished.")