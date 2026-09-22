while True :
    broj_proizvoda = int(input("Unesite broj proizvoda: "))
    if broj_proizvoda < 1 or broj_proizvoda >50:
        print("Greska,nevalidan broj proizvoda.")
        continue
    else:
        break
while True:
    cijena_proizvoda = float(input("Unesite cijenu proizvoda: "))
    if cijena_proizvoda <= 0:
        print("Greska,cijena mora biti veca od 0.")
        continue
    else:
        break
while True:
    status_placanja = input("Unesite status placanja:(placeno/neplaceno/na cekanju)").lower()
    if status_placanja == "placeno":
        print("Narudzba je uspjesno obradjena.")
        print(f"Broj proizvoda je :",broj_proizvoda)
        print(f"Cijena porudzbine je:",cijena_proizvoda)
        print(f"Status placanja je:",status_placanja)
        break
    elif status_placanja == "neplaceno" or status_placanja == "na cekanju":
        print("Narudzba ne moze biti obradjena.")
        break
    else:
        print("Greska:Nepoznat status placanja.")
        continue
