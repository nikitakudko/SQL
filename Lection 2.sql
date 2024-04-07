USE myfirstdb;

CREATE TABLE IF NOT EXISTS  Customer
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Age INT,
    Firstname VARCHAR(20),
    Lastname VARCHAR(20)
);

SELECT *FROM Customer