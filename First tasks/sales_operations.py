def validate_sales_data(sales):
    for quantitiy in sales.values():
        if quantitiy < 0 :
            raise ValueError("Postoje proizvodi sa negativnom kolicinom. ")
        if quantitiy > 100000 :
            raise ValueError("Sumnjivo velika kolicina prodatih jedinica. ")
def total_sold(sales):
    try:
        validate_sales_data(sales)
        return sum(sales.values())
    except Exception as e:
        print(e)
        return None
def most_sold_product(sales):
    try:
        validate_sales_data(sales)
        return max(sales,key =sales.get)
    except Exception as e:
        print(e)
        return None
def least_sold_product(sales):
    try:
        validate_sales_data(sales)
        return min(sales,key =sales.get)
    except Exception as e:
        print(e)
        return None
def get_product_sales(sales,product):
    try:
        return sales[product]
    except KeyError:
        print("Proizvod ne postoji")
        return None
def critical_products(sales,limit=50):
    return list(filter(lambda x:x[1]< limit,sales.items()))