# R Data Analysis & Modeling

> Note: this is the README for the **fourth folder** in the portfolio
> (`04-r-data-analysis-and-modeling` or whatever you named it).
> Copy this file into that folder as `README.md`.

## 🇬🇧 English

### Overview

This folder contains a series of **R** projects centered around a library
rental system dataset, progressing from multi-source data integration,
through data tidying and exploratory analysis, to visualization and finally
predictive modeling on a separate Netflix dataset. Each script is written as
a self-contained report with an introduction comment block, analysis steps,
and a written conclusion at the end.

### What each script covers

- **`Adi_Zebic_Task03.R`** — **Multi-source data integration**: reads book
  data from a CSV file and user rental data from an Excel file, connects to
  a **MySQL** database (via `DBI`/`RMySQL`) to pull the same kind of data
  directly from SQL tables (books, users, rentals, cities), and compares
  record counts between the CSV/Excel files and the database to check for
  discrepancies. Exports top-books and top-users summaries to CSV.

- **`Adi_Zebic_task04.R`** — **User and genre analysis**: combines book,
  user, and rental CSV files, reshapes wide rental data into tidy long
  format (`pivot_longer`/`pivot_wider`) to properly link books, return
  dates, and users. Answers business questions such as: which genres are
  most popular and with whom, when books are rented most, who the most
  loyal readers are, which users only rented once ("ghost users"), and
  rental activity by country. Exports each result as its own CSV file.

- **`Adi_Zebic_Task05.R`** — **Visualization of the library analysis**:
  takes the aggregated results from the previous task and builds a set of
  `ggplot2` charts — a scatter plot of rentals per user by genre, a line
  chart of rentals by month (seasonality), a bar chart of users by country,
  a histogram of rental counts per user, and a bar chart of overall genre
  popularity — each with a short written interpretation.

- **`Adi_Zebic_Task6.R`** — **Predicting reading habits with regression**:
  explores the relationship between a library member's age, membership
  length, and the number of books they've read, then fits a **linear
  regression model** (`lm()`) to predict books read from age and membership
  length, visualizing the fitted regression lines over the data.

- **`Adi_Zebic_Task07.R`** *(Final project)* — **Predicting IMDb scores for
  Netflix titles**: joins five related datasets (titles, ratings, genres,
  countries, certifications), cleans and filters the data to movies with
  complete information, and builds a **multiple linear regression model**
  to predict IMDb score from runtime, release year, genre, and production
  country. Evaluates the model with MAE and RMSE, inspects residuals, and
  uses the model to predict scores for new hypothetical movies — closing
  with a business recommendation for content investment. Output saved to
  `Adi_Zebic_FInalniProjekt.csv`.

### Technologies used

R, `readr`, `readxl`, `dplyr`, `tidyr`, `ggplot2`, `lubridate`, `DBI` /
`RMySQL` (MySQL database connectivity), linear regression (`lm()`).

---

## 🇧🇦 Bosanski

### Pregled

Ovaj folder sadrži niz **R** projekata usmjerenih na skup podataka
bibliotečkog sistema iznajmljivanja, koji ide od integracije podataka iz
više izvora, preko uređivanja podataka (tidying) i istraživačke analize, do
vizualizacije i na kraju prediktivnog modelovanja na odvojenom Netflix
skupu podataka. Svaka skripta je napisana kao samostalan izvještaj sa
uvodnim komentarskim blokom, koracima analize, i pisanim zaključkom na
kraju.

### Šta pokriva svaka skripta

- **`Adi_Zebic_Task03.R`** — **Integracija podataka iz više izvora**: učitava
  podatke o knjigama iz CSV fajla i podatke o iznajmljivanjima korisnika iz
  Excel fajla, povezuje se na **MySQL** bazu podataka (preko `DBI`/`RMySQL`)
  da povuče isti tip podataka direktno iz SQL tabela (knjige, korisnici,
  iznajmljivanja, gradovi), i poredi broj zapisa između CSV/Excel fajlova i
  baze radi provjere neslaganja. Izvozi sažetke top knjiga i top korisnika u
  CSV.

- **`Adi_Zebic_task04.R`** — **Analiza korisnika i žanrova**: spaja CSV
  fajlove sa knjigama, korisnicima i iznajmljivanjima, pretvara "široke"
  podatke o iznajmljivanju u uredan "dugi" format (`pivot_longer`/
  `pivot_wider`) kako bi se ispravno povezale knjige, datumi vraćanja i
  korisnici. Odgovara na poslovna pitanja poput: koji su žanrovi
  najpopularniji i kod koga, kada se knjige najviše iznajmljuju, ko su
  najvjerniji čitaoci, koji korisnici su iznajmili samo jednom ("korisnici
  fantomi"), i aktivnost iznajmljivanja po državama. Izvozi svaki rezultat
  kao poseban CSV fajl.

- **`Adi_Zebic_Task05.R`** — **Vizualizacija analize biblioteke**: uzima
  agregirane rezultate iz prethodnog zadatka i pravi niz `ggplot2`
  grafikona — scatter plot iznajmljivanja po korisniku i žanru, linijski
  grafikon iznajmljivanja po mjesecima (sezonalnost), bar grafikon
  korisnika po državama, histogram broja iznajmljivanja po korisniku, i bar
  grafikon ukupne popularnosti žanrova — svaki uz kratko pisano tumačenje.

- **`Adi_Zebic_Task6.R`** — **Predviđanje navika čitanja regresijom**:
  istražuje vezu između godina člana biblioteke, dužine članstva, i broja
  pročitanih knjiga, zatim primjenjuje **linearni regresioni model**
  (`lm()`) da predvidi broj pročitanih knjiga na osnovu godina i dužine
  članstva, uz vizualizaciju regresionih linija preko podataka.

- **`Adi_Zebic_Task07.R`** *(Finalni projekat)* — **Predviđanje IMDb ocjena
  za Netflix naslove**: spaja pet povezanih skupova podataka (naslovi,
  ocjene, žanrovi, države, certifikati), čisti i filtrira podatke na
  filmove sa potpunim informacijama, i gradi **višestruki linearni
  regresioni model** za predviđanje IMDb ocjene na osnovu trajanja, godine
  izdavanja, žanra i zemlje produkcije. Ocjenjuje model pomoću MAE i RMSE,
  ispituje reziduale, i koristi model za predviđanje ocjena za nove,
  hipotetske filmove — završava poslovnom preporukom za ulaganje u
  sadržaj. Rezultat je sačuvan u `Adi_Zebic_FInalniProjekt.csv`.

### Korištene tehnologije

R, `readr`, `readxl`, `dplyr`, `tidyr`, `ggplot2`, `lubridate`, `DBI` /
`RMySQL` (povezivanje na MySQL bazu), linearna regresija (`lm()`).
