import csv
import requests
import xml.etree.ElementTree as ET
API_KEY ="96f9ddf5"
BASE_URL = "http://www.omdbapi.com/"
input_file = "movies.csv"
output_file="movies_extended.xml"
movies = []
with open(input_file,mode="r",encoding="utf-8-sig") as file:
    reader = csv.DictReader(file)
    print(reader.fieldnames)
    reader.fieldnames = [field.strip() for field in reader.fieldnames]
    for row in reader:
        row={k.strip():v for k,v in row.items()}
        movies.append(row)
for movie in movies:
    title=movie["title"]
    year=movie["release_year"]
    params={
        "apikey":API_KEY,
        "t":title,
        "y":year
    } 
    response = requests.get(BASE_URL,params=params)
    data=response.json()
    if data.get("Response")=="True":
        movie["imdbRating"]=data.get("imdbRating","N/A")
        movie["imdbVotes"]=data.get("imdbVotes","N/A")
        movie["Actors"]=data.get("Actors","N/A")
    else:
        movie["imdbRating"]="N/A"
        movie["imdbVotes"]="N/A"
        movie["Actors"]="N/A"
root = ET.Element("movies")
for movie in movies:
    movie_element = ET.SubElement(root,"movie")
    for key, value in movie.items():
        child = ET.SubElement(movie_element,key.replace(" ","_"))
        child.text = value
tree = ET.ElementTree(root)
tree.write(output_file,encoding="utf-8",xml_declaration=True)
def prase_rating(rating):
    try:
        return float(rating)
    except:
        return 0.0
movies_sorted=sorted(movies,key=lambda x: prase_rating(x["imdbRating"]),reverse=True)
print("Top 10 filmova po IMDb ocjeni")
for movie in movies_sorted[:10]:
    print(f"{movie['title']} ({movie['release_year']}) - IMDb: {movie['imdbRating']}")