library(readr)
library(readxl)
library(dplyr)
library(DBI)
library(RMySQL)

books_df <- read_csv(
  "books_3.csv",
  skip = 1,
  na =c("","N/A"),
  show_col_types = FALSE
)
glimpse(books_df)
print(head(books_df,5))
books_df <- books_df %>%
  rename(publication_year = published)
books_df$publication_year <- as.integer(books_df$publication_year)
cat("Broj knjiga u CSV-u:",nrow(books_df),"\n")

rentals_df <- read_excel(
  "user_rentals_3.xlsx",
  col_types =c(
    "numeric",
    "text",
    "text",
    "text",
    "text",
    "numeric",
    "date"
  ),
  na=c("","N/A")
)
rentals_df$id <- as.integer(rentals_df$id)
rentals_df$rental_book_id<-as.integer(rentals_df$rental_book_id)
glimpse(rentals_df)
print(head(rentals_df,5))
cat("Ukupno korisnika:",nrow(rentals_df),"\n")

con<-dbConnect(
  RMySQL::MySQL(),
  dbname = "library",
  host = "localhost",
  port = 3306,
  user = "root",
  password = ""
)
cat("Tabele u bazi:\n")
print(dbListTables(con))

books_db <- dbReadTable(con,"book")
users_db <- dbReadTable(con,"user")
rentals_db <- dbReadTable(con,"rental")
cities_db <- dbReadTable(con,"city")
dbDisconnect(con)
cat("Knjige u SQL bazi:",nrow(books_db),"\n")
cat("Korisnici u SQL bazi:",nrow(users_db),"\n")
cat("Iznajmljivanja u SQL bazi:",nrow(rentals_db),"\n")

cat("Knjige u CSV-u:",nrow(books_df),"\n")
cat("Knjige u SQL bazi:",nrow(books_db),"\n")
cat("Razlika:",nrow(books_db)- nrow(books_df),"\n")
cat("Najranija godina izdavanja:",min(books_df$publication_year,na.rm=TRUE),"\n")
cat("Najkasnija godina izdavanja:",max(books_df$publication_year,na.rm=TRUE),"\n")
cat("Ukupno zapisa u Excelu:",nrow(rentals_df),"\n")
cat("Razlicite knjige(Excel):",length(unique(na.omit(rentals_df$rental_book_id))),"\n")
cat("Razlicite knjige(SQL):",length(unique(rentals_db$book_id)),"\n")
bez_knjige <- rentals_df %>%filter(is.na(rental_book_id))
cat("Korisnici bez aktivnog iznajmljivanja:",nrow(bez_knjige),"\n")
korisnici_ea <- users_db%>%filter(city_id == 50)
aktivni_korisnici <- unique(rentals_db$user_id)
ea_bez_knjige <- korisnici_ea %>% filter(!user_id %in% aktivni_korisnici)
cat("Korisnici iz East Albert bez knjige:",nrow(ea_bez_knjige),"\n")

top_knjige <- rentals_db %>%
  group_by(book_id)%>%
  summarise(broj_iznajmljivanja = n())%>%
  arrange(desc(broj_iznajmljivanja))%>%
  left_join(books_db %>% select(book_id,title),by="book_id")%>%
  select(book_id,title,broj_iznajmljivanja)%>%
  head(10)
print(top_knjige)
top_korisnici<-rentals_db%>%
  group_by(user_id)%>%
  summarise(broj_iznajmljivanja = n())%>%
  arrange(desc(broj_iznajmljivanja))%>%
  left_join(users_db%>%select(user_id,firstname,lastname),by="user_id")%>%
  select(user_id,firstname,lastname,broj_iznajmljivanja)%>%
  head(10)
print(top_korisnici)

write_csv(top_knjige,"Adi_Zebic_Task3_top_knjige.csv")
write_csv(top_korisnici,"Adi_Zebic_Task3_top_korisnici.csv")
cat("Fileovi su sacuvani.\n")

#Zakljucak
#CSV ima vise knjiga od SQL baze,sto znaci da CSV ima vise zapisa nego baza.Excel file ima 300 korisnika,od kojih veliki broj nema trenutno iznajmljenu knjigu.
#SQL baza trenutno ima 145 iznajmljivanja.
#Sljedeci korak
#pronaci knjige koje su u CSVU a nisu u bazi
#Vidjeti koji se zanr najvise iznajmljuje
#provjeriti ima li korisnika koji se pojavljuju u Excelu ali ne i u SQL bazi

