# Machine Learning Projects — Text Classification

> Note: this is the README for the **sixth folder** in the portfolio
> (`06-machine-learning-projects` or whatever you named it).
> Copy this file into that folder as `README.md` (it replaces the
> project-specific README.md that was written for the product classifier
> sub-project only — that content is folded into this one below).

## 🇬🇧 English

### Overview

This folder contains two supervised machine learning **text classification**
projects, both built with `scikit-learn`: one classifies e-commerce product
titles into product categories, the other classifies text messages as
spam/ham. It also includes a car pricing dataset with engineered features,
kept here as a dataset for a related exercise.

### 1. Product Category Classifier

Classifies a product into its category (e.g. Mobile Phones, TVs, Fridges,
CPUs...) purely from its product title text.

- **`product_category_classifier.ipynb`** — the full workflow: loading and
  exploring the data (35,000+ products), cleaning column names,
  standardizing inconsistent category labels, removing missing values,
  feature engineering, splitting into train/test sets, vectorizing text
  with `TfidfVectorizer`, training and comparing **4 models** (Logistic
  Regression, Naive Bayes, Decision Tree, Linear SVC), evaluating their
  performance, and a final conclusion on model choice.
- **`train_model.py`** — trains the final chosen model (**Linear SVC**, ~97%
  test accuracy) on `products.csv` and saves it to `model.pkl`, with the
  fitted `TfidfVectorizer` saved to `vektorizator.pkl`.
- **`predict_category.py`** — an interactive console script: loads the saved
  model and vectorizer, then repeatedly asks for a product title and prints
  the predicted category, until the user types `exit`.
- **`products.csv`** — the training dataset (35,000+ product titles with
  category labels).
- **`model.pkl`** / **`vektorizator.pkl`** — the saved, ready-to-use trained
  model and text vectorizer.

**Known limitation:** the model sometimes misclassifies products whose title
contains a product code that is more strongly associated with a different
category in the training data (e.g. "bosch serie" codes appear more often on
dishwashers in the training set, so Bosch fridges with that code pattern are
occasionally misclassified as dishwashers). Full details are in the
notebook.

### 2. Spam Message Classifier

Classifies short text messages as **spam** or **ham** (not spam).

- **`spam_classifier.py`** — a straightforward first version: loads
  `messages.csv`, cleans and standardizes the category labels (including
  merging an inconsistent `"not spam"` label into `"ham"`), vectorizes the
  message text with `TfidfVectorizer`, trains a single **Logistic
  Regression** model on the full dataset, then lets the user interactively
  type messages to classify. Ends with a written reflection on what was
  learned, since this was the first machine learning task in the series.
- **`spam_model_evaluation.ipynb`** — a more rigorous follow-up: properly
  splits the data into train/test sets (`train_test_split`, stratified),
  vectorizes text, then trains and **compares multiple models** (Logistic
  Regression, Naive Bayes, Decision Tree, and others) on held-out test data
  to evaluate which generalizes best, rather than just training and testing
  on the same data.
- **`messages.csv`** — the labeled message dataset (message text + spam/ham
  category).

### 3. Car Pricing Dataset (with engineered features)

- **`cars.csv`** — raw car listings (make, model, price, year, condition,
  mileage, fuel type, engine volume, color, transmission, drive unit,
  segment).
- **`cars_cleaned.csv`** — the same data after cleaning (consistent numeric
  types for engine volume).
- **`cars_features.csv`** — the cleaned data with additional engineered
  features: `car_age`, `mileage_per_year`, `engine_volume_liters`,
  `is_newer_car`, and `is_high_mileage` — prepared as input for a future
  price-prediction model.

### Technologies used

Python 3, `pandas`, `scikit-learn` (`TfidfVectorizer`, `LogisticRegression`,
`MultinomialNB`, `DecisionTreeClassifier`, `LinearSVC`, `train_test_split`,
evaluation metrics), `pickle` (model persistence), Jupyter Notebook.

### How to run

```bash
pip install pandas scikit-learn seaborn matplotlib

# Train the product classifier from scratch
python3 train_model.py

# Interactively test the product classifier
python3 predict_category.py
```

---

## 🇧🇦 Bosanski

### Pregled

Ovaj folder sadrži dva projekta nadgledanog mašinskog učenja za
**klasifikaciju teksta**, oba izrađena pomoću `scikit-learn`: jedan
klasifikuje nazive proizvoda iz online prodavnice po kategoriji, drugi
klasifikuje tekstualne poruke kao spam/ham. Sadrži i skup podataka o cijenama
automobila sa dodatno inženjerisanim karakteristikama, sačuvan ovdje kao
podaci za povezanu vježbu.

### 1. Klasifikator kategorija proizvoda

Klasifikuje proizvod u njegovu kategoriju (npr. Mobile Phones, TVs,
Fridges, CPUs...) isključivo na osnovu teksta naziva proizvoda.

- **`product_category_classifier.ipynb`** — kompletan tok rada: učitavanje i
  istraživanje podataka (35.000+ proizvoda), čišćenje naziva kolona,
  standardizacija nedosljednih kategorija, uklanjanje nedostajućih
  vrijednosti, inženjering karakteristika, podjela na trening/test skup,
  vektorizacija teksta pomoću `TfidfVectorizer`-a, treniranje i poređenje
  **4 modela** (Logistic Regression, Naive Bayes, Decision Tree, Linear
  SVC), evaluacija performansi, i finalni zaključak o izboru modela.
- **`train_model.py`** — trenira finalno izabrani model (**Linear SVC**,
  ~97% tačnosti na test skupu) na `products.csv` i čuva ga u `model.pkl`,
  a istrenirani `TfidfVectorizer` u `vektorizator.pkl`.
- **`predict_category.py`** — interaktivna konzolna skripta: učitava sačuvan
  model i vektorizator, zatim ponavljano traži naziv proizvoda i ispisuje
  predviđenu kategoriju, sve dok korisnik ne ukuca `exit`.
- **`products.csv`** — skup podataka za treniranje (35.000+ naziva
  proizvoda sa oznakama kategorije).
- **`model.pkl`** / **`vektorizator.pkl`** — sačuvan, spreman za korištenje
  istreniran model i vektorizator teksta.

**Poznato ograničenje:** model ponekad pogrešno klasifikuje proizvode čiji
naziv sadrži kod proizvoda koji je u trening podacima jače povezan sa drugom
kategorijom (npr. "bosch serie" kodovi se u trening skupu češće javljaju kod
mašina za pranje sudova, pa se Bosch frižideri sa tim obrascem u nazivu
ponekad pogrešno klasifikuju kao mašine za pranje sudova). Detalji su
opisani u svesci.

### 2. Klasifikator spam poruka

Klasifikuje kratke tekstualne poruke kao **spam** ili **ham** (nije spam).

- **`spam_classifier.py`** — jednostavnija prva verzija: učitava
  `messages.csv`, čisti i standardizuje oznake kategorija (uključujući
  spajanje nedosljedne oznake `"not spam"` u `"ham"`), vektorizuje tekst
  poruka pomoću `TfidfVectorizer`-a, trenira jedan **Logistic Regression**
  model na cijelom skupu podataka, zatim omogućava korisniku da
  interaktivno unosi poruke za klasifikaciju. Završava pisanom refleksijom
  o naučenom, pošto je ovo bio prvi zadatak iz mašinskog učenja u nizu.
- **`spam_model_evaluation.ipynb`** — rigorozniji nastavak: pravilno dijeli
  podatke na trening/test skup (`train_test_split`, stratifikovano),
  vektorizuje tekst, zatim trenira i **poredi više modela** (Logistic
  Regression, Naive Bayes, Decision Tree, i druge) na izdvojenim test
  podacima da se procijeni koji se najbolje generalizuje, umjesto da se
  samo trenira i testira na istim podacima.
- **`messages.csv`** — označen skup podataka poruka (tekst poruke + spam/ham
  kategorija).

### 3. Skup podataka o cijenama automobila (sa inženjerisanim karakteristikama)

- **`cars.csv`** — sirovi oglasi automobila (marka, model, cijena, godina,
  stanje, kilometraža, tip goriva, zapremina motora, boja, mjenjač, pogon,
  segment).
- **`cars_cleaned.csv`** — isti podaci nakon čišćenja (dosljedni numerički
  tipovi za zapreminu motora).
- **`cars_features.csv`** — očišćeni podaci sa dodatnim inženjerisanim
  karakteristikama: `car_age`, `mileage_per_year`, `engine_volume_liters`,
  `is_newer_car`, i `is_high_mileage` — pripremljeno kao ulaz za budući
  model predviđanja cijene.

### Korištene tehnologije

Python 3, `pandas`, `scikit-learn` (`TfidfVectorizer`, `LogisticRegression`,
`MultinomialNB`, `DecisionTreeClassifier`, `LinearSVC`, `train_test_split`,
metrike evaluacije), `pickle` (čuvanje modela), Jupyter Notebook.

### Kako pokrenuti

```bash
pip install pandas scikit-learn seaborn matplotlib

# Treniraj klasifikator proizvoda od nule
python3 train_model.py

# Interaktivno testiraj klasifikator proizvoda
python3 predict_category.py
```
