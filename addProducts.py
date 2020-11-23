'''SQL
CREATE TABLE products (
	products_id INT AUTO_INCREMENT PRIMARY KEY,
    products_name VARCHAR(100) NOT NULL,
    products_price DECIMAL(15,2) NOT NULL DEFAULT 0,
    products_stock INT NOT NULL,
    products_description VARCHAR(1000) NOT NULL DEFAULT "",
    products_restock_level INT NOT NULL,
    products_lastsold TIMESTAMP, -- nullable, where null means the product has never sold ever
    products_sale_flag INT(1) NOT NULL,
    products_category VARCHAR(255) -- todo: go back and add categories table and make this fk?
);
'''

import random
class Product:
    def __init__(self, products_name= "",products_price=0.0, products_stock=0,products_description="",products_restock_level=0, products_category="", products_sale_flag=0):
        self.products_name = products_name
        self.products_price = products_price
        self.products_stock = products_stock
        self.products_description = products_description
        self.products_restock_level = products_restock_level
        self.products_category =products_category
        self.products_sale_flag = products_sale_flag

    def insertIntoDB(self):
       print("INSERT INTO products (products_name,products_price, products_stock, products_description, products_restock_level,products_sale_flag,products_category) VALUES ('{0}', '{1}', '{2}','{3}', '{4}', '{5}', '{6}');".format(self.products_name,self.products_price, self.products_stock, self.products_description,self.products_restock_level, self.products_sale_flag, self.products_category))


def createProductList(productList,products_names,products_descriptions,products_categorys):
    for product in products_names:
        productList.append(Product(product,format(random.uniform(0.1,1000.0),'.2f'),random.randint(0,1000),random.choice(products_descriptions), random.randint(0,10),random.choice(products_categorys), random.randint(0,1)))

def populatetolist(products_names, filename):
    file1 = open(filename, 'r')
    Lines = file1.readlines() 
    # Strips the newline character 
    for productname in Lines: 
        products_names.append(productname)
    file1.close()


products_names = []
populatetolist(products_names,'productNames.txt')

products_descriptions = ['generic description 1', 'generic description 2']

products_categorys = []
populatetolist(products_categorys,'productCategorys.txt')
productList = []
createProductList(productList,products_names,products_descriptions,products_categorys)


for product in productList:
    product.insertIntoDB()