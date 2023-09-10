
CREATE DATABASE SHOP;
USE SHOP;
CREATE TABLE PRODUCT(ProdID INT AUTO_INCREMENT PRIMARY KEY, Prodesc TEXT, Price FLOAT, Stock INT);
CREATE TABLE PURCHASE(PurID INT AUTO_INCREMENT PRIMARY KEY, ProID INT, qty INT, FOREIGN KEY (ProID) REFERENCES PRODUCT (ProdID));
ALTER TABLE PURCHASE ADD(CUSTOMER_NAME VARCHAR(20));
INSERT INTO PRODUCT (Prodesc, Price, Stock) VALUES
    ('Laptop', 1200.50, 50),
    ('Smartphone', 800.00, 100),
    ('Tablet', 500.25, 75),
    ('Headphones', 100.75, 200),
    ('Monitor', 350.00, 30);
INSERT INTO PURCHASE (ProID, qty, customer_name) VALUES
    (1, 2, 'Percy'),
    (1, 5, 'Annabeth'),
    (2, 3, 'Aelin'),
    (4, 1, 'Hermoine'),
    (5, 4, 'Ron'),
    (5, 2, 'Ferb'),
    (1, 3, 'Phineas'),
    (2, 1, 'Perry'),
    (4, 2, 'Rowan'),
    (5, 5, 'Riley');
SELECT P.ProdID FROM PRODUCT P LEFT JOIN PURCHASE PU ON P.ProdID = PU.ProID WHERE PU.ProID IS NULL AND P.ProdID IS NOT NULL;
SELECT * FROM PURCHASE WHERE CUSTOMER_NAME="Riley";
SELECT ProID, SUM(qty) FROM PURCHASE GROUP BY ProID;
SELECT ProID, SUM(qty) FROM PURCHASE GROUP BY ProID HAVING SUM(qty)>5;
