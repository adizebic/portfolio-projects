import pickle
with open('model.pkl','rb') as fajl:
    model=pickle.load(fajl)
with open('vektorizator.pkl','rb') as fajl:
    vektorizator=pickle.load(fajl)
print("Model i vektorizator su ucitani.")

print("\n---Predvidjanje kategorije proizvoda---")
print("Unesite naziv proizvoda (ili 'exit' za izlaz):")
while True:
    naziv_proizvoda=input("\nNaziv proizvoda: ")
    
    if naziv_proizvoda.lower() == 'exit':
        print("Izlaz iz programa.")
        break
    naziv_vektorizovan=vektorizator.transform([naziv_proizvoda])
    predikcija=model.predict(naziv_vektorizovan)
    print("Predvidjena kategorija proizvoda:", predikcija[0])