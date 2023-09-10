mysql> ALTER TABLE PURCHASE ADD (supname varchar(20));
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Sales(SaleID INT AUTO_INCREMENT PRIMARY KEY, proID int, qty int(5), custname varchar(10), FOREIGN KEY(proID) REFERENCES Purchase(proID) );
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> INSERT INTO Sales (ProID, qty, custname)
    -> SELECT ProID, qty, supname AS custname
    -> FROM Purchase;
mysql> ALTER TABLE PURCHASE DROP COLUMN customer_name;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE PRODUCT ADD (stock INT);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE Product SET stock=10;
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> SELECT * FROM PRODUCT;
+--------+------------+--------+-------+
| ProdID | Prodesc    | Price  | Stock |
+--------+------------+--------+-------+
|      1 | Laptop     | 1200.5 |    10 |
|      2 | Smartphone |    800 |    10 |
|      3 | Tablet     | 500.25 |    10 |
|      4 | Headphones | 100.75 |    10 |
|      5 | Monitor    |    350 |    10 |
+--------+------------+--------+-------+
5 rows in set (0.00 sec)

mysql> UPDATE Product SET stock=2 WHERE prodID=3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Product SET stock=8 WHERE prodID=4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Product SET stock=25 WHERE prodID=2 OR prodID=5 ;
Query OK, 1 row affected (0.01 sec)
Rows matched: 2  Changed: 1  Warnings: 0


mysql> SELECT * FROM PRODUCT WHERE STOCK<15 order by STOCK;
+--------+------------+--------+-------+
| ProdID | Prodesc    | Price  | Stock |
+--------+------------+--------+-------+
|      3 | Tablet     | 500.25 |     2 |
|      1 | Laptop     | 1200.5 |     5 |
|      4 | Headphones | 100.75 |     8 |
+--------+------------+--------+-------+
3 rows in set (0.00 sec)

mysql> UPDATE PURCHASE SET supname="TATA" WHERE PurID=1 or PurID=5 or PurID=10;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> UPDATE PURCHASE SET supname="PEPSICO" WHERE PurID=2 or PurID=6 or PurID=9;
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> UPDATE PURCHASE SET supname="BOAT" WHERE PurID=3 or PurID=7 or PurID=8;=9;
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0
0

mysql> UPDATE PURCHASE SET supname="DELL" WHERE PurID=4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM PURCHASE;
+-------+-------+------+---------------+---------+
| PurID | ProID | qty  | CUSTOMER_NAME | supname |
+-------+-------+------+---------------+---------+
|     1 |     1 |    2 | Percy         | TATA    |
|     2 |     1 |    5 | Annabeth      | PEPSICO |
|     3 |     2 |    3 | Aelin         | BOAT    |
|     4 |     4 |    1 | Hermoine      | DELL    |
|     5 |     5 |    4 | Ron           | TATA    |
|     6 |     5 |    2 | Ferb          | PEPSICO |
|     7 |     1 |    3 | Phineas       | BOAT    |
|     8 |     2 |    1 | Perry         | BOAT    |
|     9 |     4 |    2 | Rowan         | BOAT    |
|    10 |     5 |    5 | Riley         | TATA    |
+-------+-------+------+---------------+---------+
10 rows in set (0.00 sec)

mysql> SELECT P.PRODID, P.PRODESC, P.PRICE
    -> FROM PRODUCT P
    -> INNER JOIN PURCHASE PU ON P.PRODID = PU.PROID
    -> WHERE PU.SUPNAME="TATA";

+--------+---------+--------+
| PRODID | PRODESC | PRICE  |
+--------+---------+--------+
|      1 | Laptop  | 1200.5 |
|      5 | Monitor |    350 |
|      5 | Monitor |    350 |
+--------+---------+--------+
3 rows in set (0.00 sec)

mysql> SELECT ProID, SUM(qty)
    -> FROM PURCHASE
    -> GROUP BY ProID;
+-------+----------+
| ProID | SUM(qty) |
+-------+----------+
|     1 |       10 |
|     2 |        4 |
|     4 |        3 |
|     5 |       11 |
+-------+----------+


mysql> SELECT P.ProDESC, SUM(PU.qty) AS TotalPurchaseQty
    -> FROM Product P
    -> INNER JOIN Purchase PU ON P.ProdID = PU.ProID
    -> GROUP BY P.ProDESC
    -> ORDER BY P.ProDESC;
+------------+------------------+
| ProDESC    | TotalPurchaseQty |
+------------+------------------+
| Headphones |                3 |
| Laptop     |               10 |
| Monitor    |               11 |
| Smartphone |                4 |
+------------+------------------+

mysql> SELECT DISTINCT P.ProdID, P.ProDESC, P.Price
    -> FROM Product P
    -> INNER JOIN Purchase PU ON P.ProdID = PU.ProID
    -> INNER JOIN Sales S ON P.ProdID = S.ProID
    -> ORDER BY P.ProdID;
+--------+------------+--------+
| ProdID | ProDESC    | Price  |
+--------+------------+--------+
|      1 | Laptop     | 1200.5 |
|      2 | Smartphone |    800 |
|      4 | Headphones | 100.75 |
|      5 | Monitor    |    350 |
+--------+------------+--------+
4 rows in set (0.00 sec)

