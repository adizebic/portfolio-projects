import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database = "movies_db"
)
cursor = conn.cursor()
query = """
    SELECT m.title,m.budget,m.box_office,g.genre_name,c.country_name
    FROM movies m
    JOIN movie_genres mg ON m.movie_id =mg.movie_id
    JOIN genres g ON mg.genre_id = g.genre_id
    JOIN countries c ON m.country_id = c.country_id
    WHERE m.budget > 0 AND m.box_office > 0
"""
cursor.execute(query)
rezultati = cursor.fetchall()
kolone = [opis[0] for opis in cursor.description]
movies = pd.DataFrame(rezultati, columns=kolone)
cursor.close()
conn.close()
print("PRVIH PET REDOVA:")
print(movies.head())

zarada_po_zanru = (
    movies.groupby("genre_name")["box_office"]
    .sum()
    .sort_values(ascending=False)
    .reset_index()
)
print("TOP 3 NAJISPLATIVIJA ZANRA:")
print(zarada_po_zanru.head(3))
fig,ax = plt.subplots(figsize=(12,6))
ax.barh(
    zarada_po_zanru["genre_name"],
    zarada_po_zanru["box_office"],
    color = "steelblue"
)
ax.set_title = "Ukupna zarada po žanru"
ax.set_xlabel("Ukupnda zarada (USD)")
ax.set_ylabel("Žanr")
plt.tight_layout()
plt.savefig("zanrovi.png",dpi=150,bbox_inches="tight")
plt.show()
print("Sacuvano: zanrovi.png")

correlation = movies[["budget","box_office"]].corr().iloc[0,1]
print(f"\nPearson koeficijent između budžeta i zarade: {correlation:.2f}")
fig,ax = plt.subplots(figsize=(10,6))
ax.scatter(
    movies["budget"],
    movies["box_office"],
    color = "steelblue",
    alpha = 0.6
)
ax.set_title("Odnos između budžeta i zarade")
ax.set_xlabel("Budžet (USD)")
ax.set_ylabel("Zarada (USD)")
plt.tight_layout()
plt.savefig("korelacija.png",dpi=150,bbox_inches="tight")
plt.show()
print("Sacuvano: korelacija.png")

zarada_po_zemlji = (
    movies.groupby("country_name")["box_office"]
    .sum()
    .sort_values(ascending=False)
    .head(5)
    .reset_index()
)
print("TOP 5 ZEMALJA PO ZARADI:")
print(zarada_po_zemlji)
fig,ax = plt.subplots(figsize=(10,6))
ax.bar(
    zarada_po_zemlji["country_name"],
    zarada_po_zemlji["box_office"],
    color = "steelblue"
)
ax.set_title("Top 5 zemalja po zaradi")
ax.set_xlabel("Zemlja")
ax.set_ylabel("Prosjecna zarada (USD)")
plt.tight_layout()
plt.savefig("zemlje.png",dpi=150,bbox_inches="tight")
plt.show()
print("Sacuvano: zemlje.png")

top10 = (
    movies[["title","box_office"]]
    .sort_values("box_office",ascending=False)
    .head(10)
    .reset_index(drop=True)
)
print("TOP 10 FILMOVA PO ZARADI:")
print(top10)
