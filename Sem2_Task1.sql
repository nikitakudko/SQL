/* 
Создайте таблицу (сущность) с заказами manufacturer. При создании необходимо использовать DDL-команды.
Перечень полей (атрибутов):
id – числовой тип, автоинкремент, первичный ключ;
name – строковый тип;
*/

USE  itresume9698590;
CREATE TABLE manufacturer
(
id SERIAL PRIMARY KEY,
name VARCHAR (45)
);

INSERT INTO manufacturer(name)
VALUES
('Apple'),
('Samsung'),
('Huawei');
