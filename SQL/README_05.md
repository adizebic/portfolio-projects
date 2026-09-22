# SQL + Python Movies Database Analysis

> Note: this is the README for the **fifth folder** in the portfolio
> (`05-sql-python-movies-analysis` or whatever you named it).
> Copy this file into that folder as `README.md`.
>
> Housekeeping note: `Untitled.sql` and `Untitled kopija.sql` contain
> identical content — one is a duplicate of the other. Consider keeping
> only one before the final push, to keep the folder clean.

## 🇬🇧 English

### Overview

This project combines **MySQL database design** with **Python data
analysis**: a relational database of movies (with directors, genres,
languages, and countries) is designed and populated in SQL, explored with
SQL queries, then connected to from Python (via `mysql.connector`) to run a
box-office analysis with `pandas` and `matplotlib`, producing saved chart
images and a short written summary.

### What each file covers

**Database design & data**
- **`task03_Adi_Zebic.sql`** — creates the `movies_db` database and its
  schema: `directors`, `languages`, `genres`, `countries`, `movies` (with
  foreign keys to the previous four tables), and a `movie_genres` junction
  table for the many-to-many relationship between movies and genres.
- **`queries.sql`** — populates the database with sample data (directors,
  languages, countries, 10 movies, and their genre associations), plus a
  few data-maintenance statements (an `UPDATE` to normalize a country name,
  a `DELETE` to remove very short movies) and an example filtered query.
- **`Dump20260325.sql`** — a full `mysqldump` export of the finished
  database, useful to recreate the exact database state from scratch.

**SQL analysis queries**
- **`sql.sql`** — top 3 highest-grossing genres, average budget/box office
  across all movies, top 5 countries by average box office, and top 10
  movies by box office.
- **`Untitled.sql`** — a broader set of exploratory queries: movies with
  above-average budget, movie count per country, genres with more than 5
  movies, top 10 movies by box office, 5 shortest movies, total box office,
  average duration, min/max budget, and two string-function examples
  (`UPPER`, `SUBSTRING`).

**Python analysis (connects to the MySQL database)**
- **`py.py`** — connects to `movies_db`, pulls budget per genre, and
  visualizes the **average budget per genre** as a horizontal bar chart.
- **`py_2.py`** — connects to the database and produces three analyses with
  matching charts: total box-office earnings per genre (`zanrovi.png`), the
  correlation between budget and box office with a Pearson coefficient and
  scatter plot (`korelacija.png`), and the top 5 countries by average box
  office, plus a printed top-10 highest-grossing movies list.

**Outputs**
- **`zanrovi.png`** — bar chart of total box-office earnings by genre;
  Sci-Fi, Adventure, and Action lead by a wide margin.
- **`korelacija.png`** — scatter plot of budget vs. box office, showing a
  generally positive relationship (higher-budget movies tend to earn more,
  though with notable exceptions).
- **`txt.txt`** — a short written summary of the whole analysis: how the
  database was connected to and queried, and what the genre, correlation,
  and top-countries/top-movies findings showed.

### Technologies used

MySQL (schema design, joins, aggregation, subqueries, `GROUP BY`/`HAVING`),
Python 3, `mysql-connector-python`, `pandas`, `matplotlib`.

---

## 🇧🇦 Bosanski

### Pregled

Ovaj projekat kombinuje **dizajn MySQL baze podataka** sa **Python analizom
podataka**: relaciona baza filmova (sa režiserima, žanrovima, jezicima i
državama) je dizajnirana i popunjena u SQL-u, istražena SQL upitima, zatim
povezana iz Pythona (preko `mysql.connector`) radi analize prihoda pomoću
`pandas` i `matplotlib`, uz sačuvane grafikone i kratak pisani sažetak.

### Šta pokriva svaki fajl

**Dizajn baze podataka i podaci**
- **`task03_Adi_Zebic.sql`** — kreira `movies_db` bazu i njenu šemu:
  `directors`, `languages`, `genres`, `countries`, `movies` (sa stranim
  ključevima ka prethodne četiri tabele), i `movie_genres` spojnu tabelu za
  vezu više-na-više između filmova i žanrova.
- **`queries.sql`** — popunjava bazu primjer podacima (režiseri, jezici,
  države, 10 filmova, i njihove veze sa žanrovima), plus par naredbi za
  održavanje podataka (`UPDATE` da se normalizuje naziv države, `DELETE` da
  se uklone jako kratki filmovi) i primjer filtriranog upita.
- **`Dump20260325.sql`** — potpuni `mysqldump` izvoz gotove baze, koristan
  za rekreiranje tačnog stanja baze od nule.

**SQL analitički upiti**
- **`sql.sql`** — top 3 žanra po ukupnoj zaradi, prosječan budžet/zarada
  kroz sve filmove, top 5 država po prosječnoj zaradi, i top 10 filmova po
  zaradi.
- **`Untitled.sql`** — širi skup istraživačkih upita: filmovi sa budžetom
  iznad prosjeka, broj filmova po državi, žanrovi sa više od 5 filmova, top
  10 filmova po zaradi, 5 najkraćih filmova, ukupna zarada, prosječno
  trajanje, min/max budžet, i dva primjera funkcija za tekst (`UPPER`,
  `SUBSTRING`).

**Python analiza (povezuje se na MySQL bazu)**
- **`py.py`** — povezuje se na `movies_db`, povlači budžet po žanru, i
  prikazuje **prosječan budžet po žanru** kao horizontalni bar grafikon.
- **`py_2.py`** — povezuje se na bazu i pravi tri analize sa odgovarajućim
  grafikonima: ukupna zarada po žanru (`zanrovi.png`), korelacija između
  budžeta i zarade sa Pearson koeficijentom i scatter plotom
  (`korelacija.png`), i top 5 država po prosječnoj zaradi, plus ispisana
  top 10 lista filmova po zaradi.

**Rezultati**
- **`zanrovi.png`** — bar grafikon ukupne zarade po žanru; Sci-Fi,
  Adventure i Action ubjedljivo prednjače.
- **`korelacija.png`** — scatter plot budžeta naspram zarade, koji pokazuje
  generalno pozitivnu vezu (filmovi sa većim budžetom obično zarađuju više,
  uz nekoliko primjetnih izuzetaka).
- **`txt.txt`** — kratak pisani sažetak cijele analize: kako je baza
  povezana i upitana, i šta su pokazali nalazi o žanrovima, korelaciji, i
  top državama/filmovima.

### Korištene tehnologije

MySQL (dizajn šeme, joinovi, agregacija, podupiti, `GROUP BY`/`HAVING`),
Python 3, `mysql-connector-python`, `pandas`, `matplotlib`.
