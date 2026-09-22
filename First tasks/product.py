class Product:
    def __init__(self,name,price,quantity,description):
        self.name = name
        self.price = price
        self.quantity = quantity
        self.description = description
    def check_quantity(self):
        if self.quantity < 10:
            return False
        return True
    