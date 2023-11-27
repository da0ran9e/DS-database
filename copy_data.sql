COPY Public."categories" FROM 'C:/Program Files/PostgreSQL/data/categories.csv' DELIMITER ',' CSV HEADER;

COPY Public."products" FROM 'C:/Program Files/PostgreSQL/data/products.csv' DELIMITER ',' CSV HEADER;

COPY Public."inventory" FROM 'C:/Program Files/PostgreSQL/data/inventory.csv' DELIMITER ',' CSV HEADER;

COPY Public."customers" FROM 'C:/Program Files/PostgreSQL/data/customers.csv' DELIMITER ',' CSV HEADER;

COPY Public."cust_hist" FROM 'C:/Program Files/PostgreSQL/data/cust_hist.csv' DELIMITER ',' CSV HEADER;

COPY Public."orders" FROM 'C:/Program Files/PostgreSQL/data/orders.csv' DELIMITER ',' CSV HEADER;

COPY Public."orderlines" FROM 'C:/Program Files/PostgreSQL/data/orderlines.csv' DELIMITER ',' CSV HEADER;



