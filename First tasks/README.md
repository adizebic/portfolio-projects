# Python Fundamentals & Mini-Projects

> Note: this is the README for the **first folder** in the portfolio. Adjust the
> folder name in the "Folder structure" section below to match how you actually
> named it in the repo, then copy this file into that folder as `README.md`.

## 🇬🇧 English

### Overview

This folder contains a collection of early practice exercises and small scripts
written while learning core Python concepts: object-oriented programming (OOP),
control flow, input validation, error handling, and basic data processing
(CSV, Excel, XML, and a public API).

The scripts are grouped below by what they practice, not necessarily by the
order they were written in — some appear in two versions (e.g. `product.py`
and `product_2.py`) showing the same problem solved first in a simple way,
then refactored using better OOP practices.

### Folder structure & what each script does

**1. OOP mini e-commerce simulation**
- `product.py`, `employee.py`, `user.py`, `main.py` — first version: independent
  classes (`Product`, `Employee`, `User`), each with its own attributes and
  methods, no shared base class.
- `person.py`, `product_2.py`, `employee_2.py`, `user_2.py`, `main_2.py` —
  refactored version: introduces an abstract base class `Person` (using
  Python's `abc` module) that `Employee` and `User` inherit from, plus
  encapsulation (private attributes with getters/setters) in `Product` and
  `Employee`. Demonstrates the jump from flat classes to inheritance +
  abstraction + encapsulation.
- Both `main.py` files build sample products/employees/users, run basic
  operations (salary increase, email validation, shopping totals) and print
  the results to the console.

**2. Movie data ETL & enrichment pipeline**
- `movies.py` — reads a `movies.csv` file, enriches every movie with data
  pulled live from the **OMDb API** (IMDb rating, votes, main actors), then
  exports the enriched dataset to an XML file. Also prints a top-10 list
  sorted by IMDb rating.
- `etl_movies.py` — a small ETL (Extract–Transform–Load) script using
  `pandas`: reads the same `movies.csv`, calculates profit (`box office − budget`)
  per movie, and exports a **top 10 most profitable movies** list to a
  separate Excel file for each country (USA, Russia, UK, South Korea).

**3. Sales data analysis**
- `sales_operations.py` — a small library of functions for analyzing a
  sales dictionary (product → quantity sold): total units sold, best/worst
  selling product, products below a critical stock threshold, safe lookup
  by product name — all with input validation and error handling
  (`try/except`, custom `ValueError`s).
- `task7.py` — a runnable example that uses the functions above on a sample
  sales dataset.

**4. Console input & control-flow practice**
- `task3.py` — order-processing exercise: validates product quantity, price,
  and payment status entered by the user through a series of `while` loops.
- `task5.py` — customer purchase exercise: collects a customer's full name
  and purchase history through user input, calculates totals, determines
  VIP/Standard status, and applies a discount accordingly.

### Technologies used

Python 3, `pandas`, `requests`, built-in modules (`csv`, `xml.etree.ElementTree`,
`abc`), OMDb public API.

---

## 🇧🇦 Bosanski

### Pregled

Ovaj folder sadrži zbirku ranih vježbi i manjih skripti pisanih tokom učenja
osnova Pythona: objektno-orijentisano programiranje (OOP), kontrolu toka,
validaciju unosa, rukovanje greškama, i osnovnu obradu podataka (CSV, Excel,
XML, i javni API).

Skripte su niže grupisane prema onome što vježbaju, ne nužno prema redoslijedu
pisanja — neke postoje u dvije verzije (npr. `product.py` i `product_2.py`),
gdje je isti problem prvo riješen na jednostavan način, a zatim prerađen
korištenjem boljih OOP praksi.

### Struktura foldera i šta koja skripta radi

**1. OOP mini e-commerce simulacija**
- `product.py`, `employee.py`, `user.py`, `main.py` — prva verzija: nezavisne
  klase (`Product`, `Employee`, `User`), svaka sa svojim atributima i
  metodama, bez zajedničke bazne klase.
- `person.py`, `product_2.py`, `employee_2.py`, `user_2.py`, `main_2.py` —
  prerađena verzija: uvodi apstraktnu baznu klasu `Person` (koristeći `abc`
  modul) od koje nasljeđuju `Employee` i `User`, plus enkapsulaciju (privatni
  atributi sa getter/setter metodama) u `Product` i `Employee`. Pokazuje
  napredak od običnih klasa ka nasljeđivanju + apstrakciji + enkapsulaciji.
- Oba `main.py` fajla kreiraju primjer proizvoda/zaposlenih/korisnika,
  izvršavaju osnovne operacije (povećanje plate, validacija email-a, ukupna
  potrošnja) i ispisuju rezultate u konzolu.

**2. ETL pipeline za obradu i obogaćivanje podataka o filmovima**
- `movies.py` — učitava `movies.csv` fajl, obogaćuje svaki film podacima
  preuzetim uživo sa **OMDb API-ja** (IMDb ocjena, broj glasova, glavni
  glumci), zatim izvozi obogaćeni skup podataka u XML fajl. Takođe ispisuje
  top 10 listu sortiranu po IMDb ocjeni.
- `etl_movies.py` — manja ETL (Extract–Transform–Load) skripta koja koristi
  `pandas`: učitava isti `movies.csv`, računa profit (`box office − budžet`)
  po filmu, i izvozi listu **10 najprofitabilnijih filmova** u poseban Excel
  fajl za svaku zemlju (SAD, Rusija, UK, Južna Koreja).

**3. Analiza prodajnih podataka**
- `sales_operations.py` — mala biblioteka funkcija za analizu rječnika
  prodaje (proizvod → prodana količina): ukupan broj prodatih jedinica,
  najbolje/najlošije prodavan proizvod, proizvodi ispod kritičnog nivoa
  zaliha, siguran pristup po nazivu proizvoda — sve uz validaciju unosa i
  rukovanje greškama (`try/except`, prilagođeni `ValueError`).
- `task7.py` — primjer koji koristi gore navedene funkcije na uzorku
  prodajnih podataka.

**4. Vježbe unosa kroz konzolu i kontrole toka**
- `task3.py` — vježba obrade narudžbe: validira količinu proizvoda, cijenu i
  status plaćanja koje korisnik unosi kroz niz `while` petlji.
- `task5.py` — vježba kupovine korisnika: prikuplja puno ime korisnika i
  istoriju kupovina kroz unos, računa ukupan iznos, određuje VIP/Standard
  status, i primjenjuje odgovarajući popust.

### Korištene tehnologije

Python 3, `pandas`, `requests`, ugrađeni moduli (`csv`, `xml.etree.ElementTree`,
`abc`), OMDb javni API.

