while True:
    puno_ime = input("Unesite ime i prezime: ").strip()
    if " " in puno_ime:
        ime,prezime = puno_ime.split(" ",1)
        break
    else:
        print("Ime i prezime moraju sadrzavati najmanje dvije rijeci.\n")
broj_kupovina = int(input("\nUnesite broj kupovina u posljednih godinu dana: "))
print()
ukupan_iznos = 0
kupovine_preko_10000 = 0
for i in range(1,broj_kupovina+1):
    iznos = float(input(f"Unesite iznos za kupovinu {i}: "))
    ukupan_iznos += iznos
    if iznos > 10000:
        kupovine_preko_10000 += 1
if ukupan_iznos > 100000 and broj_kupovina > 10:
    status = "Vip"
else:
    status = "Standard"
print(f"Postovani {ime},ukupno ste potrosili {ukupan_iznos},od toga je bilo {kupovine_preko_10000} kupovina iznad 10000 dinara.\n")
print(f"Korisnik {ime} {prezime} ima status {status} korisnika.\n")
cijena_artikla = float(input(f"Postovani {ime},unesite cijenu artikla koji zelite da kupite: "))
if status == "Vip":
    popust = 0.10
else:
    popust = 0.05
cijena_sa_popustom = cijena_artikla *(1-popust)
print(f"Cijena artikla sa popustom iznosi: {cijena_sa_popustom:.2f} dinara.\n")