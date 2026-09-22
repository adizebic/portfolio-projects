class Employee:
    def __init__(self,name,email,salary,address):
        self.name = name
        self.email = email
        self.salary = salary
        self.address = address
    def check_email(self):
        return "@" in self.email
    def increase_salary(self,percentage):
        self.salary += self.salary * (percentage / 100)