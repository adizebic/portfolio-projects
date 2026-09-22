from product import Product
from user import User
from employee import Employee
products =[
    Product("Laptop",1500,5,"Gaming Laptop"),
    Product("Telefon",800,15,"Iphone"),
    Product("Mis",20,50,"Gaming mis"),
    Product("Tastatura",60,8,"Asus"),
    Product("Monitor",300,12,"27 inca monitor")
]
employees =[
    Employee("Marko","marko@firma.com",1200,"Beograd"),
    Employee("Ana","ana@firma.com",1400,"Sarajevo")
]
users =[
    User("Ivan","ivan@mail.com","061111111","Tuzla"),
    User("Sara","sara@mail.com","062111111","Zenica"),
    User("Petar","petar@mail.com","063111111","Mostar")
]
users[0].add_product(products[0])
users[0].add_product(products[2])
users[1].add_product(products[1])
users[1].add_product(products[3])
users[2].add_product(products[4])
for user in users:
    print(f"{user.name} je potrosio/la ukupno: {user.total_spent()}")
for person in users + employees:
    print(person.display_info())