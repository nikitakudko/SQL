SELECT * FROM itresume9698590.mobile_phones;
SELECT * FROM mobile_phones
ORDER BY price;

SELECT product_name, price * product_count AS TotalSum
FROM mobile_phones
ORDER BY TotalSum;

SELECT * FROM mobile_phones
LIMIT 3;

SELECT * FROM mobile_phones
LIMIT 2, 3;

SELECT DISTINCT manufacturer FROM mobile_phones;

SELECT manufacturer, COUNT(*) AS ModelsCount 
FROM mobile_phones
GROUP BY manufacturer;

INSERT INTO mobile_phones(product_name, manufacturer, product_count, price)
VALUES
('Iphone 7', 'Apple', 130, 32000),
('Nokia 8', 'HDM Global', 146, 38000),
('Honor 10', 'Huawei', 125, 28000);

SELECT * FROM mobile_phones;

ALTER TABLE mobile_phones DROP manufacturer_id;

SELECT AVG(price) Average_Price FROM mobile_phones;

SELECT MIN(price) FROM mobile_phones;

SELECT AVG(price) Average_Price FROM mobile_phones
WHERE manufacturer = 'Apple';  

SELECT manufacturer, COUNT(*) AS ModelsCount
FROM mobile_phones
GROUP BY manufacturer
HAVING COUNT(*) > 1;

SELECT manufacturer, COUNT(*) AS ModelsCount
FROM mobile_phones
WHERE price * product_count > 80000
GROUP BY manufacturer
HAVING COUNT(*) > 1;

SELECT manufacturer, COUNT(*) AS Models, SUM(product_count) AS Units
FROM mobile_phones
WHERE price * product_count > 80000
GROUP BY manufacturer
HAVING SUM(product_count) > 2
ORDER BY Units DESC;

SELECT * FROM mobile_phones
ORDER BY price;
