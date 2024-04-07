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