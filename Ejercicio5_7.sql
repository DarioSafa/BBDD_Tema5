CREATE TABLE fabricantes (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


--CONSULTAS

--Consultas multitabla (Composición externa)

-- A. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM FABRICANTES LEFT JOIN PRODUCTOS ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE;


--B. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM FABRICANTES LEFT JOIN PRODUCTOS ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.ID IS NULL;


--C. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

--No pueden porque la id del fabricante es una foreign key que no puede ser nula por lo que todos los productos dependen de un fabricante


--Consultas multitabla (Composición interna)

--1) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE;


--2) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE ORDER BY FABRICANTES.NOMBRE;


--3) Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT PRODUCTOS.ID,PRODUCTOS.NOMBRE,FABRICANTES.ID,FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE;


--4) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT PRODUCTOS.PRECIO,PRODUCTOS.NOMBRE,FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.PRECIO IN(SELECT MIN(PRODUCTOS.PRECIO) FROM PRODUCTOS);


-- 5) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT PRODUCTOS.PRECIO,PRODUCTOS.NOMBRE,FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.PRECIO IN(SELECT MAX(PRODUCTOS.PRECIO) FROM PRODUCTOS);

-- 6) Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT PRODUCTOS.* FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE FABRICANTES.NOMBRE = 'Lenovo';

--7) Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT PRODUCTOS.* FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE FABRICANTES.NOMBRE = 'Crucial' AND PRODUCTOS.PRECIO > 200;

--8) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

SELECT PRODUCTOS.* FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE (FABRICANTES.NOMBRE = 'Asus' OR FABRICANTES.NOMBRE = 'Hewlett-Packard' OR FABRICANTES.NOMBRE = 'Seagate');

--9) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett- Packardy Seagate. Utilizando el operador IN.

SELECT PRODUCTOS.* FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE FABRICANTES.NOMBRE IN ('Asus','Hewlett-Packard','Seagate');

--10) Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE FABRICANTES.NOMBRE LIKE '%e';

-- 11) Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE FABRICANTES.NOMBRE LIKE '%_w_%';
SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE FABRICANTES.NOMBRE LIKE '%w%';

--12) Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.PRECIO >= 180 ORDER BY PRODUCTOS.PRECIO DESC;
SELECT PRODUCTOS.NOMBRE, PRODUCTOS.PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.PRECIO >= 180 ORDER BY PRODUCTOS.NOMBRE ASC;