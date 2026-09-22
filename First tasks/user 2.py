from person import Person
class User(Person):
    def __init__(self, name,email,phone,address):
        super().__init__(name,email,address)
        self.phone = phone
        self.shopping_history = []
    def get_phone(self):
        return self.phone
    def set_phone(self,phone):
        self.phone = phone
    def add_product(self,product):
        self.shopping_history.append(product)
    def total_spent(self):
        total = 0
        for product in self.shopping_history:
            total += product.get_price()
            return total
    def display_info(self):
        return f"User: {self.name},Email: {self._email},Phone: {self.phone}"