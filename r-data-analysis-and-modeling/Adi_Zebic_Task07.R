#==========================================================================================================================
#Uvod
#Finalni Projekt Netflix analiza
# Autor Adi Zebic
# Datum 26.06.2026
# Pitanje koje sam izabrao za rjesavanje je pitanje broj 2-Koji faktori najbolje predvidjaju IMDb ocjenu sadrzaja
# Podaci koje cu koristiti su titles.csv,ratings.csv,genres.csv,countries.csv,certifications.csv
# Cilj je da izgradim model koji ce pomoci menadzmentu da procijeni koji tip ima najvece sanse za visoku oscjenu
#==========================================================================================================================
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

titles_df<-read_csv("titles.csv",show_col_types = FALSE)
ratings_df<-read_csv("ratings.csv",show_col_types = FALSE)
genres_df<-read_csv("genres.csv",show_col_types = FALSE)
countries_df<-read_csv("countries.csv",show_col_types = FALSE)
cert_df<-read_csv("certifications.csv",show_col_types = FALSE)
glimpse(titles_df)
glimpse(ratings_df)
glimpse(genres_df)
glimpse(countries_df)
cat("NA vrijednosti u titles_df:\n")
print(colSums(is.na(titles_df)))
cat("NA vrijednosti u ratings_df:\n")
print(colSums(is.na(ratings_df)))

df<-titles_df%>%
  left_join(ratings_df,by="id")
prvi_zanr<-genres_df%>%
  group_by(id)%>%
  slice(1)%>%
  ungroup()
df<-df%>%
  left_join(prvi_zanr,by="id")
prva_zemlja<-countries_df%>%
  group_by(id)%>%
  slice(1)%>%
  ungroup()
df<-df%>%
  left_join(prva_zemlja,by="id")
cat("Ukupno redova nakon spajanja:",nrow(df),"\n")
glimpse(df)

df_clean<-df%>%
  filter(type=="MOVIE")%>%
  filter(!is.na(imdb_score))%>%
  filter(!is.na(genre))%>%
  filter(!is.na(production_country))%>%
  filter(runtime>0)%>%
  select(id,title,release_year,runtime,genre,production_country,imdb_score)
cat("Redova nakon filtriranja:",nrow(df_clean),"\n")
df_clean<-df_clean%>%
  mutate(kratak_film=ifelse(runtime<90,"Kratak","Dugi"))
top_zemlje<-df_clean%>%
  count(production_country)%>%
  arrange(desc(n))%>%
  head(10)%>%
  pull(production_country)
df_clean<-df_clean%>%
  filter(production_country %in% top_zemlje)
cat("Redova nakon filtriranja zemalja:",nrow(df_clean),"\n")

ggplot(df_clean,aes(x=imdb_score))+
  geom_histogram(binwidth = 0.5,fill="steelblue",color="white")+
  labs(
    title="Distribucija IMDb ocjena filmova na netflixu",
    x="IMDb ocjena",
    y="Broj filmova"
  )+
  theme_minimal()
prosjek_po_zanru <-df_clean%>%
  group_by(genre)%>%
  summarise(prosjecna_ocjena=mean(imdb_score))%>%
  arrange(desc(prosjecna_ocjena))
ggplot(prosjek_po_zanru,aes(x=reorder(genre,prosjecna_ocjena),
                            y=prosjecna_ocjena,fill=genre))+
  geom_bar(stat="identity")+
  coord_flip()+
  labs(
    title="Prosjecna IMDb ocjena po zanru",
    x="Zanr",
    y="Prosjecna ocjena"
  )+
  theme_minimal() +
  theme(legend.position = "none")
ggplot(df_clean,aes(x=runtime,y=imdb_score))+
  geom_point(color="steelblue",alpha=0.4,size=2)+
  geom_smooth(method="lm",color="red")+
  labs(
    title="Veza izmedju duzine filma i IMDb ocjene",
    x="Trajanje filma(min)",
    y="IMDb ocjena"
  )+
  theme_minimal()
trend_po_godini<-df_clean%>%
  group_by(release_year)%>%
  summarise(prosjecna_ocjena=mean(imdb_score))
ggplot(trend_po_godini,aes(x=release_year,y=prosjecna_ocjena))+
  geom_line(color="steelblue",linewidth=1)+
  geom_point(color="steelblue",size=2)+
  labs(
    title="Trend prosjecne IMDb ocjene po godini izdavanja",
    x="Godina izdavanja",
    y="Prosjecna IMDb ocjena"
  )+
  theme_minimal()

model<-lm(imdb_score~runtime+release_year+genre+production_country,data=df_clean)
summary(model)

predvidjeno<-predict(model,newdata = df_clean)
MAE<-mean(abs(df_clean$imdb_score-predvidjeno))
cat("Prosjecna greska modela(MAE):",round(MAE,2),"\n")
RMSE<-sqrt(mean((df_clean$imdb_score-predvidjeno)^2))
cat("RMSE:",round(RMSE,2),"\n")
reziduali<-df_clean$imdb_score-predvidjeno
ggplot(data.frame(predvidjeno,reziduali),aes(x=predvidjeno,y=reziduali))+
  geom_point(color="steelblue",alpha=0.4)+
  geom_hline(yintercept = 0,color='red',linewidth=1)+
  labs(
    title = "Rezidualne greske modela",
    x="Predvidjena ocjena",
    y="greska(stvarno-predvidjeno)"
  )+
  theme_minimal()
novi_filmovi<-data.frame(
  runtime=c(90,75,120,100),
  release_year=c(2021,2022,2020,2019),
  genre=c("drama","comedy","action","thriller"),
  production_country=c("US","GB","US","FR")
)
predikcije<-predict(model,newdata = novi_filmovi)
rezultati<-cbind(novi_filmovi,predvidjena_ocjena=round(predikcije,2))
cat("\n===Predikcije za nove filmove===\n")
print(rezultati)
write_csv(rezultati,"Adi_Zebic_FInalniProjekt.csv")
cat("Fajl Adi_Zebic_FInalniProjekt.csv je sacuvan\n")
ggplot(rezultati,aes(x=genre,y=predvidjena_ocjena,fill=genre))+
  geom_bar(stat="identity")+
  coord_flip()+
  labs(
    title="Predvidjena IMDb ocjena po zanru za nove filmove",
    x="Zanr",
    y="Predvidjena IMDb ocjena"
  )+
  theme_minimal() +
  theme(legend.position = "none")
#==========================================================================================================================
#Zakljucak
#Model pokazuje na osnovu linearne regresije na uzorku Netflix filmova da su zanr i zemlja produkcije najznacajniji prediktori IMDb ocjene
#Duzina filma ima manji,ali primjetan uticaj,duzi filmovi dobijaju nesto vise ocjene
#Godina izdavanja pokazuje negativan trend,noviji filmovi u prosjeku dobijaju nize ocjene od starijih
#Faktori koji najvise uticu su zanr,zemlja produkcije i runtime
#Zanr-drama i dokumentarni filmovi imaju najvise ocjene
#Zemlja produkcije-filmovi iz pojedinih zemaja se ocjenjuju vise
#Runtime-duzi filmovi su malo bolje ocjejeni
#MAE pokazuje za koliko ocjena u prosjeku grijesi
#R-squared pokazuje koliki postotak varijanse model objasnjava
#Moja preporuka za CEO je da se investira u produkciju drama i dokumentarnih filmova,posebno iz zemalja koje historijski dobijaju visoke ocjene
#Kratki filmovi ispod 90 min nose veci rizik niske ocjene

