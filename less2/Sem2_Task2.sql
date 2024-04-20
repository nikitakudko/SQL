/*
Статусы количества мобильных телефонов (в зависимости от количества): меньше 100 – «little»; от 100 до 300 – «many»; больше 300 – «lots».
Необходимо вывести название, производителя и статус количества для мобильных телефонов.
*/

SELECT manufacturer, 
CASE
	WHEN product_count < 100
		THEN 'little'
	WHEN product_count >= 100 and product_count < 300
 		THEN 'many'
	WHEN product_count >= 300
		THEN 'lots'
END AS status
FROM mobile_phones;
