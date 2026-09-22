#==================================================================================
# Task6
# Autor Adi Zebic
# Datum 15.06.2026
# Za ovaj task koristit cu library_books_read.csv,member_age,membership_years,books_read
# Cilj ovog taska je da odgovorim na pitanje mogu li na osnovu godina clana i duzine clanstva predvidjeti koliko ce knjiga procitati
# Koristit cu linearnu regresiju za predikciju broja knjiga,te logisticku regresiju da klasifikujem teske citace
#==================================================================================
library(readr)
library(ggplot2)
library(dplyr)

podaci<-read_csv("library_books_read.csv",show_col_types=FALSE)
glimpse(podaci)
summary(podaci)
cat("Na vrijednosti:\n")
print(colSums(is.na(podaci)))

ggplot(podaci,aes(x=member_age,y=books_read))+
  geom_point(color="steelblue",size=2)+
  labs(
    title="Veza izmedju godina clana i broja procitanih knjiga",
    x="Godine clana",
    y="Broj procitanih knjiga"
  )+
  theme_minimal()

ggplot(podaci,aes(x=membership_years,y=books_read))+
  geom_point(color="steelblue",size=2)+
  labs(
    title="Veza izmedju duzine clanstva i broja procitanih knjiga",
    x="Godine clanstva",
    y="Broj procitanih knjiga"
  )+
  theme_minimal()
#==================================================================================
# Sada cu koristiti funkciju lm() da predvidim broj knjiga
# rezultati bi trebalo da pokazu koliko svkaci faktor utice na broj knjiga
model_regresije<-lm(books_read~member_age+membership_years,data=podaci)
summary(model_regresije)
# Sada cu prikazati regresionu liniju na vizuelno
ggplot(podaci,aes(x=member_age,y=books_read))+
  geom_point(color="steelblue",size=2)+
  geom_smooth(method="lm",color="red",se=TRUE)+
  labs(
    title="Linearna regresija:Godine clana vs Broj knjiga",
    x="Godine clana",
    y="Broj procitanih knjiga"
  )+
  theme_minimal()

ggplot(podaci,aes(x=membership_years,y=books_read))+
  geom_point(color="steelblue",size=2)+
  geom_smooth(method="lm",color="red",se=TRUE)+
  labs(
    title="Linearna regresija:Duzina clanstva vs Broj knjiga",
    x="Godine clanstva",
    y="Broj procitanih knjiga"
  )+
  theme_minimal()
#==================================================================================
# Sada cu provjeriti da li moj model grijesi u predikciji
predvidjene_vrijednosti<-predict(model_regresije,newdata = podaci)
MAE<-mean(abs(podaci$books_read-predvidjene_vrijednosti))
cat("Prosjecna greska modela(MAE)",round(MAE,2),"knjiga\n")
#==================================================================================
novi_clanovi<-data.frame(
  member_age =c(18,25,40,60),
  membership_years=c(1,3,5,7)
)
predikcije<-predict(model_regresije,newdata = novi_clanovi)
rezultati<-cbind(novi_clanovi,books_predicted=round(predikcije))
cat("\n===Predikcije za nove clanove===\n")
print(rezultati)
write_csv(rezultati,"Adi_Zebic_Task6.csv")
cat("Fajl predictions.csv je sacuvan\n")
#==================================================================================
# Sada cu preko logicke regresie odgovoriti na pitanje da li ce neko citati mnogo knjiga
# 1 ce biti za teske citace(vise od 25 knjiga),0 ce biti za manje
podaci$read_many_books<-ifelse(podaci$books_read>25,1,0)
cat("Raspodjela teskih citaca:\n")
print(table(podaci$read_many_books))
model_klasifikacije<-glm(
  read_many_books~member_age+membership_years,
  data=podaci,
  family=binomial
)
summary(model_klasifikacije)
vjerovatnoce<-predict(model_klasifikacije,type="response")
predikcija_klase<-ifelse(vjerovatnoce>0.5,1,0)
print(table(Realno=podaci$read_many_books,Predikcija=predikcija_klase))
tacnost<-mean(predikcija_klase==podaci$read_many_books)
cat("Tacnost modela:",round(tacnost*100,1),"%\n")
ggplot(podaci,aes(x=member_age,y=membership_years,color=factor(read_many_books)))+
  geom_point(size=3)+
  scale_color_manual(
    values = c("0"="steelblue","1"="red"),
    labels=c("0"="Nije teski citac","1"="Teski citac")
  )+
  labs(
    title="Ko su teski citaci-po godinama i duzini clanstva",
    x="Godine clana",
    y="Godine clanstva",
    color="Tip citaca"
  )+
  theme_minimal()
#==================================================================================
#Zakljucak
# Koristio sam linearnu regresiju da predividim broj procitanih knjiga na osnovu godina clana i duzine clanstva
# Na osnovu koeficijenta iz summary(model_regresije) vidi se koji od dva faktora vise utice na broj procitanih knjiga
#MAE pokazuje za koliko knjiga model u prosjeku pogrijesi
# Model predvidja za novog clana od 18 godina sa 1 godinom clanstva manji broj knjiga,nego za clana od 60 godina i 7 godina clanstva
# LOgisticka regresija-model klasifikacije prepoznaje teske citace sa odredjenom tacnoscu,teski citaci su uglavnom stariji clanovi biblioteke

