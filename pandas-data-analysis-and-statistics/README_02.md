# Pandas Data Analysis & Statistics

> Note: this is the README for the **second folder** in the portfolio
> (`02-pandas-data-analysis-and-statistics` or whatever you named it).
> Copy this file into that folder as `README.md`.

## 🇬🇧 English

### Overview

This folder contains a series of `pandas`-based data analysis tasks working
with two datasets: an **online store product catalog** (prices, sales,
ratings, stock) and a **fitness tracker activity log**. The tasks progress
from basic exploration, through data cleaning/preprocessing, to statistical
analysis (mean, standard deviation, quartiles, IQR) and distribution
analysis.

### What each script does

- **`task1_online_store_analysis.py`** — first look at the raw online store
  dataset: total number of products, best-selling product overall, top 5
  best-selling smartphones, and the most/least expensive laptop (after
  removing missing/invalid rows).

- **`task2_data_preprocesing.py`** — data cleaning and preprocessing: converts
  text columns to proper numeric/date types, extracts the numeric rating
  value out of a text field (e.g. `"4.5 out of 5"` → `4.5`), drops rows
  missing a product name or with too many missing values, removes
  duplicates, then calculates revenue per product and shows the top 10
  keyboards by revenue and the bottom 10 TVs by revenue.

- **`task3_statistical_analysis.py`** — builds on the same cleaning steps and
  calculates descriptive statistics: average product rating, most common
  brand, best-selling brand, average rating per category, sales by product
  color, and the top 5 brands by "sell-through efficiency" (units sold vs.
  units still in stock).

- **`task4_distribution_analysis.py`** — distribution-focused statistics on
  the same cleaned dataset: rating range (max − min) for TVs, price spread
  for smartphones using the interquartile range (IQR, Q1/Q3), the 5 brands
  with the most consistent (lowest standard deviation) ratings, and units
  sold grouped by review-count quartile.

- **`task5_fit_trackr_analysis.py`** — cleaning and analysis of a separate
  fitness-tracker dataset: parses duration/calorie values out of text
  (`"30min"` → `30`), normalizes inconsistent activity names (e.g. `"Walk"`,
  `"walk"` → `"walking"`), removes duplicates and rows with no username, then
  calculates average activity duration, most common mood, calorie standard
  deviation, and the IQR of user ages.

### Data files

- `DAPUP4_Task_01_01-online_store_data.csv` and its variants — online store
  product data (price, category, brand, rating, quantity sold/in stock,
  date added).
- `DAPUP4_Task_05_01-fit_trackr_data.csv` — fitness tracker activity log
  (username, activity type, duration, calories, mood, age).

### Technologies used

Python 3, `pandas` — data cleaning, type conversion, `groupby` aggregation,
descriptive statistics (mean, standard deviation, quantiles/IQR), string
normalization.

---

## 🇧🇦 Bosanski

### Pregled

Ovaj folder sadrži niz zadataka analize podataka pomoću `pandas` biblioteke,
sa dva skupa podataka: **katalog proizvoda online prodavnice** (cijene,
prodaja, ocjene, zalihe) i **evidencija aktivnosti fitness trackera**.
Zadaci idu od osnovnog istraživanja podataka, preko čišćenja/preprocesiranja,
do statističke analize (prosjek, standardna devijacija, kvartili, IQR) i
analize distribucije.

### Šta koja skripta radi

- **`task1_online_store_analysis.py`** — prvi pregled sirovog skupa podataka
  online prodavnice: ukupan broj proizvoda, najprodavaniji proizvod u
  cjelini, top 5 najprodavanijih smartphonea, i najskuplji/najjeftiniji
  laptop (nakon uklanjanja nedostajućih/nevažećih redova).

- **`task2_data_preprocesing.py`** — čišćenje i preprocesiranje podataka:
  pretvara tekstualne kolone u prave numeričke/datumske tipove, izdvaja
  numeričku ocjenu iz tekstualnog polja (npr. `"4.5 out of 5"` → `4.5`),
  uklanja redove bez naziva proizvoda ili sa previše nedostajućih vrijednosti,
  uklanja duplikate, zatim računa prihod po proizvodu i prikazuje top 10
  tastatura po prihodu i 10 TV-a sa najmanjim prihodom.

- **`task3_statistical_analysis.py`** — nadograđuje se na isto čišćenje i
  računa opisnu statistiku: prosječnu ocjenu proizvoda, najčešći brend,
  najprodavaniji brend, prosječnu ocjenu po kategoriji, prodaju po boji
  proizvoda, i top 5 brendova po "efikasnosti prodaje" (prodate jedinice u
  odnosu na jedinice još na zalihama).

- **`task4_distribution_analysis.py`** — statistika fokusirana na
  distribuciju, na istom očišćenom skupu podataka: raspon ocjena (max − min)
  za TV-e, cjenovni raspon smartphonea koristeći interkvartilni raspon (IQR,
  Q1/Q3), 5 brendova sa najujednačenijim (najmanja standardna devijacija)
  ocjenama, i broj prodatih jedinica grupisan po kvartilu broja recenzija.

- **`task5_fit_trackr_analysis.py`** — čišćenje i analiza odvojenog skupa
  podataka fitness trackera: izdvaja vrijednosti trajanja/kalorija iz teksta
  (`"30min"` → `30`), normalizuje nedosljedne nazive aktivnosti (npr.
  `"Walk"`, `"walk"` → `"walking"`), uklanja duplikate i redove bez
  korisničkog imena, zatim računa prosječno trajanje aktivnosti, najčešće
  raspoloženje, standardnu devijaciju kalorija, i IQR godina korisnika.

### Fajlovi sa podacima

- `DAPUP4_Task_01_01-online_store_data.csv` i njegove varijante — podaci o
  proizvodima online prodavnice (cijena, kategorija, brend, ocjena, prodate
  jedinice/zalihe, datum dodavanja).
- `DAPUP4_Task_05_01-fit_trackr_data.csv` — evidencija aktivnosti fitness
  trackera (korisničko ime, tip aktivnosti, trajanje, kalorije, raspoloženje,
  godine).

### Korištene tehnologije

Python 3, `pandas` — čišćenje podataka, konverzija tipova, `groupby`
agregacija, opisna statistika (prosjek, standardna devijacija,
kvantili/IQR), normalizacija teksta.
