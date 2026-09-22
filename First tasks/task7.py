import sales_operations as so
sales = {
    "Laptop": 15,
    "Mouse" : 150,
    "Keyboard": 85,
    "Monitor" : 30,
    "USB cables" : 200,
}
print("Ukupno prodato: ",so.total_sold(sales))
print("Najvise se prodavao: ",so.most_sold_product(sales))
print("Najmanje se prodavao: ",so.least_sold_product(sales))
print("Kriticni proizvodi: ",so.critical_products(sales))
kamera= so.get_product_sales(sales,"Web camera")
if kamera is not None:
    print("Prodaja web kamere: ",kamera)
if "Web camera" not in sales:
    sales["Web camera"] = 0
sales["Monitor"] += 5
print("Azurirani rjecnik prodaje: ")
print(sales)

