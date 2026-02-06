                                       -- TESTING DATA INTEGRITY
SELECT * FROM chocoshop3
WHERE Amount AND Boxes_shipped = 0;

SELECT * FROM chocoshop3
WHERE `Date`= 0;

DESCRIBE chocoshop3;    -- seeing date column as date type was satisfying

                           -- total imported rows were 3282 (correct data)
SELECT count(product) AS Total_rows
FROM chocoshop3;
 
