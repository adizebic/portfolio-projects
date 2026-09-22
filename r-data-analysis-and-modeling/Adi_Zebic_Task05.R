#=======================================================================
#Uvod
#Task05 Vizualizacija analize biblioteke
#Autor Adi Zebic
#Datum 22.06.2026
#Koristit cu podatke o broju iznajmljivanja po korisniku i zanru,broju iznamljivanja po mjesecima,broj korisnika po drzavi i ukupan broj iznajmljivanja po korisniku
#Cilj mi je prikazati uvide iz analize kao jasni grafikoni koji ce se moci razumiti bez dodatnog objasnjenja
#=======================================================================

library(readr)
library(ggplot2)
library(dplyr)
genre_by_user <- read_csv("genre_by_user.csv",show_col_types=FALSE)
monthly_rentals <- read_csv("monthly_rentals.csv",show_col_types = FALSE)
country_dist <- read_csv("country_distribution.csv",show_col_types = FALSE)
ghost_users <- read_csv("ghost_users.csv",show_col_types = FALSE)
glimpse(genre_by_user)
glimpse(monthly_rentals)
glimpse(country_dist)
glimpse(ghost_users)
summary(genre_by_user)
summary(monthly_rentals)
summary(country_dist)
summary(ghost_users)
#===================================================
#Sada cu preko scatter plota prikazati vezu izmedju user_id i broja iznajmljivanja uz dodatnu kategoriju gdje cu iskoristiti zanr kao boju
genre_by_user_clean <- genre_by_user%>%filter(!is.na(genre))
ggplot(genre_by_user_clean,aes(x=user_id,y=count,color=genre))+
  geom_point(size=3)+
  scale_color_brewer(palette = "Set2" )+
  labs(
    title="Koliko knjiga svaki korisnika cita po zanru",
    x="ID korisnika",
    y="Broj iznajmljivanja",
    color="Zanr"
  )+
  theme_minimal()
#=======================================================
#Sada cu preko linijskog dijagrama prikazati kako se broj iznajmljivanja mijenja tokom godine
#Koristi linijski dijagram jer je najbolji za prikaz promjena kroz vrijeme da bi se oscijalcije prikazale  jasno
ggplot(monthly_rentals,aes(x=month,y=rental_count))+
  geom_line(color="steelblue",linewidth=1)+
  geom_point(color="steelblue",size=2)+
  scale_x_continuous(breaks=1:12)+
  labs(
    title="Kako se broj iznajmljivanja mijenja kroz godinu?",
    x="Mjesec",
    y="Broj iznajmljivanja",
  )+
  theme_minimal()
#=====================================================
#Sada cu preko bar plota prikazati koliko korisnika dolazi iz koje drzave
#Koristim bar plot jer je odlican za poredjenje kategorija
country_clean<-country_dist%>%
  filter(!is.na(country))
ggplot(country_clean,aes(x=reorder(country,-user_count),y=user_count,fill=country))+
  geom_bar(stat="identity")+
  scale_fill_brewer(palette = "Set2")+
  labs(
    title = "Iz koje drzave dolazi najvise korisnika biblioteke",
    x="Drzava",
    y="Broj korisnika"
  )+
  theme_minimal()+
  theme(legend.position = "none")
#=================================================
#Sada cu prikazati koliko korisnika iznajmljuje malo,a koliko mnogo knjiga
#Koristit cu histogram jer najbolje prikazuje raspodjele numericke varijable,visina stubica ce pokazati koliko korisnika ima odredjeni broj iznajmljivanja
ggplot(ghost_users,aes(x=rental_count))+
  geom_histogram(binwidth = 2,fill="steelblue",color="white")+
  labs(
    title="Koliko knjiga iznajmljuje tipican korisnik",
    x= "Broj iznajmljivanja",
    y="Broj korisnika"
  )+
  theme_minimal()
#==================================================
#Sada cu prikazati ukupan broj iznajmljivanja po zanru
#Koristit cu bar plot da bih prikazao koji zanr korisnici najvise vole i jer ce na taj nacin prikaz biti citljiviji
popularnost_zanrova <- genre_by_user%>%
  filter(!is.na(genre))%>%
  group_by(genre)%>%
  summarise(ukupno=sum(count))%>%
  arrange(desc(ukupno))
ggplot(popularnost_zanrova,aes(x=reorder(genre,ukupno),y=ukupno,fill=genre))+
  geom_bar(stat="identity")+
  coord_flip()+
  scale_fill_brewer(palette="Set2")+
  labs(
    title = "Koji zanrovi su najpopularniji u biblioteci",
    x="Zanr",
    y="Ukupan broj iznajmljivanja"
  )+
  theme_minimal()+
  theme(legend.position = "none")
#===============================================
#Zakljucak
#Grafikon 1 prikazuje da neki korisnici citaju samo jedan zanr dok drugi citaju raznovrsno,sto moze pomoci pir preporuci knjiga
#Grafikon 2 prikazuje jasne sezonske oscilacije,aktivnost je najveca u sredini godine
#Grafikon 3 prikazuje da SAD ima najvise korisnika biblioteke,zaatim Srbija i Njemacka
#Grafikon 4 prikazuje da vecina korisnika iznajmljuje malo knjiga,mali broj su vjerni citaci sa velikim brojem iznajmljivanja
#Grafikon 5 prikazuje koji zanr dominira,sto je kljucna informacija pri odluci koje knjige nabaviti