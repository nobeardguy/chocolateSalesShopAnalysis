                                -- CREATING THE TABLE
CREATE TABLE cbc.chocoshop3 (
Sales_person VARCHAR (50),
Country VARCHAR (50),
Product VARCHAR(50),
`Date`  DATE,
Amount INT,
Boxes_shipped INT
);



                                      -- LOADING THE DATASET
LOAD DATA LOCAL INFILE  "C:/Users/ADMIN/Downloads/ChocolSales1.csv"
INTO TABLE cbc.chocoshop3
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

 -- CREATE VIEW chocoshop_analysis AS 
   
 SELECT * FROM chocoshop3;
                            -- TOTAL SALES BY PRODUCT
 SELECT product, sum(Amount) AS Total_sales
 FROM chocoshop3
 GROUP BY Product
 ORDER BY Total_sales DESC;
                   
                     -- ADDED A CATEGORY ROW
 ALTER TABLE chocoshop3 ADD Category VARCHAR(50);
 UPDATE chocoshop3 
 SET Category = CASE
 WHEN product LIKE '%dark%' THEN 'Dark' 
 WHEN product LIKE '%milk%' THEN 'Milk'
 WHEN product LIKE '%white%' THEN 'White' 
 WHEN product LIKE '%choco%' THEN 'Chocos'
 WHEN product LIKE '%clairs%' THEN 'Eclairs'
 ELSE 'Other' 
 END ;

                                    -- REGIONAL SALES
SELECT Country, SUM(Amount) AS regional_sales
FROM chocoshop3
GROUP BY Country
ORDER BY regional_sales;

                                    -- MONTHLY SALES
SELECT date_format(`Date`,'%Y-%m') AS Month, SUM(Amount) AS Monthly_sales
FROM chocoshop3
GROUP BY Month
ORDER BY Month;

                              -- SALES BY CATEGORY
SELECT category, sum(Amount) AS category_sales
FROM chocoshop3
GROUP BY Category
ORDER BY category_sales;

                         -- BOXES SHIPPED BY CATEGORY
SELECT Category, sum(Boxes_shipped) AS Total_Shipped
FROM chocoshop3
GROUP BY Category
ORDER BY Total_Shipped DESC;

                     -- SALES BY SALESPERSONS 
SELECT sales_person, sum(Amount) AS Total_sales
FROM chocoshop3
GROUP BY Sales_person
ORDER BY Total_sales DESC LIMIT 10;