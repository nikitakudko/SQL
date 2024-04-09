SELECT * FROM itresume9698590.mobile_phones;
SELECT * FROM mobile_phones
ORDER BY price;

SELECT product_name, price *  product_count AS TotalSum
FROM mobile_phones
ORDER BY TotalSum;
