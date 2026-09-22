import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="movies_db"
)
cursor = conn.cursor()
query = """
    SELECT g.genre_name,m.budget
    FROM movies m
    JOIN movie_genres mg ON m.movie_id = mg.movie_id
    JOIN genres g ON mg.genre_id = g.genre_id
    WHERE m.budget IS NOT NULL AND m.budget > 0
"""
cursor.execute(query)
rezultati = cursor.fetchall()
kolone = [opis[0] for opis in cursor.description]
df = pd.DataFrame(rezultati,columns=kolone)
cursor.close()
conn.close()

print("OSNOVNE STATISTIKE:")
print(df['budget'].describe())
prosjecni_budzet = (
    df.groupby("genre_name")["budget"]
    .mean()
    .sort_values(ascending=False)
    .reset_index()
)
prosjecni_budzet.columns = ["genre_name","prosjecan_budzet"]
print("\nPROSJEČNI BUDŽET PO ŽANRU:")
print(prosjecni_budzet)
fig, ax = plt.subplots(figsize=(14,8))
ax.barh(
    prosjecni_budzet["genre_name"],
    prosjecni_budzet["prosjecan_budzet"],
    color="skyblue"
)
ax.set_title("Prosječni Budžet po Žanru")
ax.set_xlabel("Prosječni Budžet (USD)")
ax.set_ylabel("Žanr")

plt.tight_layout()
plt.savefig("png.png",dpi=150,bbox_inches="tight")
plt.show()
print("Vizualizacija spremljena kao 'png.png'")