import random

def populatetolist(products_names, filename):
    file1 = open(filename, 'r')
    Lines = file1.readlines() 
    for productname in Lines: 
        products_names.append(productname)
    file1.close()

firstnames = []
populatetolist(firstnames, "firstNames.txt")
lastnames = []
populatetolist(lastnames,"lastNames.txt")
emailproviders = []
populatetolist(emailproviders, "emailProviders.txt")

for i in range(0,50):
	firstname = random.choice(firstnames)
	lastname = random.choice(lastnames)
	print("INSERT INTO customers (customers_firstname, customers_lastname, customers_email) VALUES ('{0}', '{1}', '{2}');"
	.format(firstname, lastname, lastname+firstname[0]+str(random.randint(100,999))+"@"+random.choice(emailproviders)))
