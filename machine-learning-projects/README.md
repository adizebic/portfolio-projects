# Product Category Classifier

Projekat za automatsku klasifikaciju proizvoda po kategoriji, na osnovu naziva proizvoda. Model uči da prepozna kategoriju (npr. Mobile Phones, TVs, Fridges...) na osnovu teksta u nazivu proizvoda.

## Sadrzaj repozitorijuma

- `products.csv` - skup podataka koriscen za treniranje (35 000+ proizvoda)
- `product_classification.ipynb` - Jupyter radna sveska sa kompletnom analizom: ciscenje podataka, feature engineering, poredjenje 4 modela (Logistic Regression, Naive Bayes, Decision Tree, Linear SVC) i evaluacija rezultata
- `train_model.py` - skript za treniranje finalnog modela i cuvanje u .pkl fajlove
- `predict_category.py` - skript za interaktivno testiranje modela
- `model.pkl` - sacuvan istreniran model (Linear SVC)
- `vektorizator.pkl` - sacuvan TfidfVectorizer koriscen za pretvaranje teksta u brojeve

## Kako pokrenuti projekat

### 1. Instalacija potrebnih biblioteka

```bash
pip install pandas scikit-learn seaborn matplotlib
```

### 2. Treniranje modela

Ako zelis da istreniras model ispocetka (npr. nakon izmjene podataka):

```bash
python3 train_model.py
```

Ovo ce ucitati `products.csv`, istrenirati model i sacuvati ga u `model.pkl` i `vektorizator.pkl`.

### 3. Testiranje modela

Za interaktivno testiranje modela (unosis naziv proizvoda, dobijas predvidjenu kategoriju):

```bash
python3 predict_category.py
```

Primjer koriscenja:
Naziv proizvoda: iphone 7 32gb gold
Predvidjena kategorija proizvoda: Mobile Phones

Za izlaz iz programa, ukucaj `exit`.

## Model

Nakon poredjenja cetiri modela (Logistic Regression, Naive Bayes, Decision Tree, Linear SVC), **Linear SVC** je pokazao najbolje rezultate sa tacnoscu od oko 97% na test skupu. Detaljno poredjenje modela, ukljucujuci matrice zabune i klasifikacione izvjestaje, nalazi se u `product_classification.ipynb`.

## Poznata ogranicenja

Model ponekad grijesi kod proizvoda ciji naziv sadrzi kod modela koji je vise povezan sa jednom kategorijom u trening podacima, iako stvarno pripada drugoj (npr. "bosch serie" kodovi su cesce dishwashers u podacima, pa model ponekad pogresno klasifikuje bosch frizidere kao dishwashers). Detalji su opisani u notebook-u.