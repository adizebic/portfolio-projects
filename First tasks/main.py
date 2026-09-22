from product import Product
from employee import Employee
from user import User
products = [
    Product("Laptop",1500.0,5,"Gaming laptop"),
    Product("Telefon",800.0,15,"Smartphone"),
    Product("Mis",20.0,50,"Bežični mis"),
    Product("Tastatura",45.0,8,"Mehanicka tastatura"),
    Product("Monitor",300.0,12,"27 inca monitor")
]
employees = [
    Employee("Marko Markovic","marko@mail.com",1200.0,"Sarajevo"),
    Employee("Ana Anicic","ana@mail.com",1300.0,"Mostar")
]
users = [ 
    User("Ivan","ivan123","ivan@mail.com","061111111","Tuzla"),
    User("Petar","petar99","petar@mail.com","06222222","Zenica"),
    User("Sara","Sara_s","sara@mail.com","063333333","Banja Luka")
]
for p in products:
    print(p.name,"na stanju dovoljno: ",p.check_quantity())

employees[0].increase_salary(10)
print("Nova plata: ",employees[0].salary)
print("Email validan: ",employees[0].check_email())

users[0].add_product(products[0])
users[0].add_product(products[2])

print("Ukupno potrošeno: ",users[0].total_spent())
print("Email validan: ",users[0].check_email())