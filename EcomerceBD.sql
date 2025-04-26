CREATE DATABASE EcomerceBD;
use EcomerceBD;
CREATE TABLE userio(
userID INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR (30),
password VARCHAR (100),
creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE cproduct(
cproductID INT PRIMARY KEY AUTO_INCREMENT,
product VARCHAR (50),
price FLOAT,
kindp VARCHAR (50));

CREATE TABLE shoppingcar(
shoppingcarID INT PRIMARY KEY AUTO_INCREMENT,
userID INT NOT NULL,
cproductID INT NOT NULL,
quantity INT DEFAULT 1,
FOREIGN KEY (userID) REFERENCES userio(userID),
FOREIGN KEY (cproductID) REFERENCES cproduct(cproductID));

INSERT INTO userio (username,password) VALUES('Jorge Ramirez','KSKnid298');
INSERT INTO userio (username,password) VALUES('Juana Sofia Rozo','KSKnid298');
INSERT INTO userio (username,password) VALUES('Jaime Altozano','sDomreFa82');
INSERT INTO cproduct (product,price,kindp) VALUES('Casco SHAFT 606SP ',500000,'Seguridad');
INSERT INTO cproduct (product,price,kindp) VALUES('Guantes RB23',120000,'Seguridad');
INSERT INTO cproduct (product,price,kindp) VALUES('Inercomunidador 12',200000,'Seguridad');
INSERT INTO cproduct (product,price,kindp) VALUES('camiseta F1',30000,'Ropa');
INSERT INTO cproduct (product,price,kindp) VALUES('Porta Celular',10000,'confort');
INSERT INTO cproduct (product,price,kindp) VALUES('Pantalon reforzado',100000,'Ropa');
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(1,1,1);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(1,4,2);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(1,5,1);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(2,6,1);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(2,3,2);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(2,5,2);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(2,2,1);
INSERT INTO shoppingcar (userID,cproductID,quantity) VALUES(3,6,1);

SELECT password FROM userio
WHERE username = 'Jorge Ramirez';

SELECT password FROM userio
WHERE username = 'Juana Sofia Rozo';

SELECT password FROM userio
WHERE username = 'Jaime Altozano';

SELECT SUM(producto.price * cantidad.quantity) AS total
FROM shoppingcar cantidad
JOIN cproduct producto ON cantidad.cproductID = producto.cproductID
WHERE cantidad.userID = 1;

SELECT SUM(producto.price * cantidad.quantity) AS total
FROM shoppingcar cantidad
JOIN cproduct producto ON cantidad.cproductID = producto.cproductID
WHERE cantidad.userID = 2;

SELECT SUM(producto.price * cantidad.quantity) AS total
FROM shoppingcar cantidad
JOIN cproduct producto ON cantidad.cproductID = producto.cproductID
WHERE cantidad.userID = 3;