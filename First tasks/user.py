class User:
    def __init__(self,name,username,email,phone,address):
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.address = address
        self.shopping_history = []
    def check_email(self):
        return "@"in self.email
    def add_product(self,product):
        self.shopping_history.append(product)
    def total_spent(self):
        total = 0
        for product in self.shopping_history:
            total += product.price
        return total