import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression

# U prvom koraku cu ucitati podatke
podaci=pd.read_csv('messages.csv')
print("Prvih 5 redova u fajlu:")
print(podaci.head())

# U drugom koraku cu analizirati podatke
print("\nBroj praznih vrijednosti po koloni:")
print(podaci.isnull().sum())
print("\nSve razlicite vrijednosti u koloni category:")
print(podaci['category'].unique())

# u trecem koraku cu ocistiti podatke
podaci=podaci.dropna(subset=['message','category'])
podaci['category'] = podaci['category'].str.lower()
podaci['category'] = podaci['category'].str.strip()
podaci['category'] = podaci['category'].replace('not spam', 'ham')
podaci=podaci[podaci['category'].isin(['spam', 'ham'])]
print('\nVrijednosti u category nakon ciscenja:')
print(podaci['category'].unique())
print('Broj redova nakon ciscenja:', len(podaci))

# u cetvrtom koraku podijelit cu ulazne i izlazne podatke(x i y)
# x ce biti ulazni podaci,u ovom slucaju poruke
# y ce biti izlazni podaci,u ovom slucaju kategorija
x= podaci['message']
y= podaci['category']

# u petom koraku cu uraditi vektorizaciju podataka,jer model iz sklearn ne cita recenice,vec radi sa brojevima
vektorizator=TfidfVectorizer()
x_vektorizovano=vektorizator.fit_transform(x)

# u sestom koraku cu trenirati model,koristit cu logisticregression koji ce podatke svrstati u jednu od dvije kategorije,spam ili ham
model=LogisticRegression()
model.fit(x_vektorizovano,y)
print("\nModel je uspjesno treniran.")

# u sedmom koraku cu koristiti interaktivni unos poruka
print('\n===Testiranje modela===')
print('Unesite poruku za provjeru spama (ili unesite "izlaz" za izlazak):')
while True:
    nova_poruka=input("\nUnesite poruku: ")
    if nova_poruka.lower() == 'izlaz':
        print('Zavrseno testiranje.')
        break
    
    nova_poruka_vektorizovana=vektorizator.transform([nova_poruka])
    predikcija=model.predict(nova_poruka_vektorizovana)
    print('Model kaze da je poruka:', predikcija[0])
    

# ZAKLJUCAK:
# Najveci izazov mi je bio napisati kod koji ce raditi perfektno,obzirom da je ovo prvi task i da se prvi put susrecem sa machine learningom
# Improvizirao sam kod "not spam" i "ham",pomocu replace() funckije sam zamijenio not spam sa ham
# Model sam testirao na 4 recenice,3 krace i 1 duza,model je sve 4 recenice prepoznao ispravno
# Za recenicu "Claim your free vacation now!" model je prepoznao kao spam
# Za recenicu "Hey,what time is the meeting tomorrow?" model je prepoznao kao ham
# Za recenicu "Urgent! Your account has been suspended.Act now." model je prepoznao kao spam
# Za duzu recenicu koju ste zadnju stavili kao primjer na tasku izbacio je spam
# Za iduci put bih mozda poboljsao brzinu kucanja koda i kreiranja modela,ali obzirom da mi je ovo prvi task u machine learingu,mislim da sam se ok snasao