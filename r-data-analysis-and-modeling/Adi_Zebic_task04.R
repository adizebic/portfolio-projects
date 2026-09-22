# __________________________________________________________________________________________________________________________________________
# Task 4-Analiza korisnika i zanrova
# Autor Adi Zebic
# Datum 16.06.2026
# Korisnik je clan biblioteke koji iznajmljuje knjige,svaki korisnik ima svoj user_id,drzavu,godine i podatak koliko knjiga procita godisnje.
# Fajlovi su books_20.csv,users.csv,rentals.csv
# CIlj je da na osnovu mog rad shbvatimo koji su zanrovi najpopularniji i kod kojih korisnika,kada se knjige najvise iznajmljuju,
# ko su vjerni citaci,iz kojih drzava dolazi najvise psojtilaca i napraviti tabelu navika korisnika po zanrovima
# __________________________________________________________________________________________________________________________________________
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)

books_df <- read_csv("books_20.csv",show_col_types = FALSE)
users_df <- read_csv("users.csv",show_col_types = FALSE)
rentals_df <-read_csv("rentals.csv",show_col_types = FALSE)

glimpse(books_df)
glimpse(users_df)
glimpse(rentals_df)

cat("Broj knjiga:",nrow(books_df),"\n")
cat("Broj korisnika:",nrow(users_df),"\n")
cat("Broj zapisa o iznjmljivanju:",nrow(rentals_df),"\n")

cat("NA vrijednosti u books_df-u:\n")
print(colSums(is.na(books_df)))
cat("NA vrijednosti u users_df-u:\n")
print(colSums(is.na(users_df)))
cat("NA vrijednosti u rentals_df-u:\n")
print(colSums(is.na(rentals_df)))

rentals_tidy <- rentals_df %>%
  pivot_longer(
    cols = starts_with("book_id"),
    names_to = "knjiga_broj",
    values_to = "book_id"
  ) %>%
  filter(!is.na(book_id))
cat("Redova u rentals_tidy-u:",nrow(rentals_tidy),"\n")

return_dates <- rentals_df%>%
  pivot_longer(
    cols = starts_with("return_date"),
    names_to ="datum_broj",
    values_to = "return_date"
  ) %>%
  mutate(knjiga_broj = gsub("return_date","book_id",datum_broj)) %>%
  select(user_id,knjiga_broj,return_date)
rentals_tidy <- rentals_tidy %>%
  left_join(return_dates,by = c("user_id","knjiga_broj"))
cat("Redova nakon spajanja datuma:",nrow(rentals_tidy),"\n")

rentals_users_df <- rentals_tidy %>%
  left_join(users_df,by ="user_id")
cat("Redova u rentals_users_df:",nrow(rentals_users_df),"\n")
cat("Redova u rentals_tidy-u:",nrow(rentals_tidy),"\n")

full_data_df <- rentals_users_df %>%
  left_join(
    books_df %>% select(id,title,genre),
    by = c("book_id"="id")
  )
cat("Redova u full_data_df:",nrow(full_data_df),"\n")
cat("Redova u rentals_users_df:",nrow(rentals_users_df),"\n")

korisnici_koji_nedostaju <- anti_join(rentals_tidy,users_df,by="user_id")
cat("Korisnici koji nedostaju u users:",nrow(korisnici_koji_nedostaju),"\n")

popularnost_zanrova <- full_data_df %>%
  filter(!is.na(genre))%>%
  group_by(genre)%>%
  summarise(broj_iznajmljivanja = n())%>%
  arrange(desc(broj_iznajmljivanja))
cat("\n----Najpopularniji zanrovi---\n")
print(popularnost_zanrova)

zanr_po_korisniku <- full_data_df %>%
  filter(!is.na(genre))%>%
  group_by(user_id,genre)%>%
  summarise(broj =n(), .groups = "drop")%>%
  arrange(desc(broj))
cat("\n---Top korisnici po zanru----\n")
print(head(zanr_po_korisniku,15))

sezonalnost <- full_data_df %>%
  filter(!is.na(return_date))%>%
  mutate(
    datum = as.Date(return_date,format ="%d.%m.%Y"),
    mjesec = month(datum,label =TRUE,abbr = FALSE)
  ) %>%
  group_by(mjesec)%>%
  summarise(broj_iznajmljivanja =n())%>%
  arrange(mjesec)
cat("\n---Iznajljivanja po mjesecima ---\n")
print(sezonalnost)

lojalni_citaci <- full_data_df %>%
  filter(!is.na(genre))%>%
  group_by(user_id,genre)%>%
  summarise(broj =n(), .groups = "drop")%>%
  filter(broj >1)%>%
  arrange(desc(broj))
cat("\n---Lojalni citaci---\n")
print(lojalni_citaci)
              
fantomi <- rentals_tidy %>%
  group_by(user_id)%>%
  summarise(ukupno_iznajmljivanja = n())%>%
  filter(ukupno_iznajmljivanja==1)
cat("\n---Korisici fantomi---\n")
print(fantomi)
cat("Ukupno fantoma:",nrow(fantomi),"\n")

posjete_po_drzavi <- full_data_df %>%
  filter(!is.na(country))%>%
  group_by(country)%>%
  summarise(broj_iznajmljivanja = n())%>%
  arrange(desc(broj_iznajmljivanja))
cat("\n---Iznajnljivanja po drazavama---\n")
print(posjete_po_drzavi)

nikad_nisu_iznajmlili <- anti_join(users_df,rentals_df,by="user_id")
cat("Korisnici koji nikad nisu iznajmili knjigu:",nrow(nikad_nisu_iznajmlili),"\n")

pivot_tabela <- full_data_df %>%
  filter(!is.na(genre))%>%
  group_by(user_id,genre)%>%
  summarise(broj= n(), .groups="drop")%>%
  pivot_wider(
    names_from = genre,
    values_from = broj,
    values_fill = 0
  )
cat("\n---Pivot tabela:korisnici i zanrovi---\n")
print(head(pivot_tabela,10))

write_csv(popularnost_zanrova,"Adi_Zebic_task04_zanrovi.csv")
write_csv(sezonalnost,"Adi_Zebic_taks04_sezonalnost.csv")
write_csv(lojalni_citaci,"Adi_Zebic_taks04_lojalni_citaci.csv")
write_csv(fantomi,"Adi_Zebic_taks04_fantomi.csv")
write_csv(posjete_po_drzavi,"Adi_Zebic_taks04_posjete_po_drzavi.csv")
write_csv(pivot_tabela,"Adi_Zebic_taks04_pivot.csv")
cat("Svi fajlovi su sacuvani\n")

#Zakljucak:
#Zanrovi mozemo da vidimo koji se zanr najvise cita i ko su najveci fanovi
#Sezonalnost mozemo da viidmo u kojim mjesecima se knjige najvise iznajmljuju
#Lojalni citaci koriscini koji se redovno vracaju po isti zanr
#Fantomi korisnici sa samo jednim iznajmljivanjem
#Drzave vidimo odakle dolaze najaktivniji korisnici
#pivot tabela prikaz navike svakog korisnika moze biit korisno za personalizovane preporuke
#Sljedeci korak
#pogledati da li stariji korisnici citaju drugacije zanrove
# provjeriti vezu izmedju drzave i zanra
# analizirati koji zanrovi imaju najvise kasnih vracanja
