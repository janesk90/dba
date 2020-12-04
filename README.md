#Python SQL Scripts

addCustomers.py

##Discription
insert random generated Customers into mysql DB Customers table

##### Usage

REQUIRES Python 3.8.5

```bash
python addCustomers.py > addCustomers.sql
mysql -u shapirod1 -p 
#pwd 

```
```SQL
## How to get a list of all databases present?
Show databases;
## set database
use shapirod1
## run sql script 
source addCustomers.sql
```

ProductDocument.py
```Python
from ProductsDocument import Product
from ProductsDocument import ProductTable

table = ProductTable()
table.printProductTable()
table.createProductTable()


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Product() Constructor optional parameters : 
# products_name=None
# products_price=None, products_stock=None
# products_description=None,products_restock_level=None, 
# products_category=None, products_sale_flag=None
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

product = Product(products_name="1080ti")

product.QueryPrintFromDatabase()

product.insertDocumentIntoDB()



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# updateProductDocument() function optional parameters :
# products_name=None
# products_price=None, products_stock=None
# products_description=None,products_restock_level=None, 
# products_category=None, products_sale_flag=None
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
product.updateProductDocument(products_name="5080ti")


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# updateProductObj() function optional parameters : 
# _id=None, products_name=None
# products_price=None, products_stock=None
# products_description=None,products_restock_level=None, 
# products_category=None, products_sale_flag=None
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
product.updateProductObj(products_price=99.99)

product.getDocumentProductFromDB()

```
