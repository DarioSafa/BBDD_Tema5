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

SELECT PRODUCTOS.PRECIO,PRODUCTOS.NOMBRE,FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.PRECIO =(SELECT MIN(PRODUCTOS.PRECIO) FROM PRODUCTOS);


-- 5) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT PRODUCTOS.PRECIO,PRODUCTOS.NOMBRE,FABRICANTES.NOMBRE FROM PRODUCTOS INNER JOIN FABRICANTES ON FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE WHERE PRODUCTOS.PRECIO =(SELECT MAX(PRODUCTOS.PRECIO) FROM PRODUCTOS);

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

--Subconsultas (En la cláusula WHERE)


--1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo');

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.PRECIO = (SELECT MAX(PRODUCTOS.PRECIO) FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo'));

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.

SELECT PRODUCTOS.NOMBRE FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo') AND PRODUCTOS.PRECIO = (SELECT MAX(PRODUCTOS.PRECIO) FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo'));

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT PRODUCTOS.NOMBRE FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Hewlett-Packard') AND PRODUCTOS.PRECIO = (SELECT MIN(PRODUCTOS.PRECIO) FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Hewlett-Packard'));

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.PRECIO >= (SELECT MAX(PRODUCTOS.PRECIO) FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo'));

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.

SELECT PRODUCTOS.NOMBRE FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus') AND PRODUCTOS.PRECIO > (SELECT AVG(PRODUCTOS.PRECIO) FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus'));

-- Subconsultas con IN y NOT IN

-- 11. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE FABRICANTES.ID IN (SELECT PRODUCTOS.ID_FABRICANTE FROM PRODUCTOS);

--12. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE FABRICANTES.ID NOT IN (SELECT PRODUCTOS.ID_FABRICANTE FROM PRODUCTOS);


-- Subconsultas con ALL y ANY

--7. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.PRECIO >= ALL (SELECT PRODUCTOS.PRECIO FROM PRODUCTOS);

--8. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.PRECIO <= ALL (SELECT PRODUCTOS.PRECIO FROM PRODUCTOS);

--9. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE FABRICANTES.ID = ANY (SELECT PRODUCTOS.ID_FABRICANTE FROM PRODUCTOS);

--10. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).

SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE FABRICANTES.ID <> ALL (SELECT PRODUCTOS.ID_FABRICANTE FROM PRODUCTOS);


-- Subconsultas con EXISTS y NOT EXISTS

-- 13. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE EXISTS (SELECT * FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = FABRICANTES.ID);

--14 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE NOT EXISTS (SELECT * FROM PRODUCTOS WHERE PRODUCTOS.ID_FABRICANTE = FABRICANTES.ID);

--Subconsultas correlacionadas

--15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT F.NOMBRE,P.NOMBRE,P.PRECIO FROM FABRICANTES F,PRODUCTOS P  WHERE F.ID = P.ID_FABRICANTE AND P.PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTOS P2 WHERE P2.ID_FABRICANTE = F.ID);

--16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT P.* FROM PRODUCTOS P,FABRICANTES F WHERE F.ID = P.ID_FABRICANTE AND P.PRECIO >= (SELECT AVG(PRECIO) FROM PRODUCTOS P2 WHERE P2.ID_FABRICANTE = F.ID); 

--17. Lista el nombre del producto más caro del fabricante Lenovo.

SELECT P.NOMBRE FROM PRODUCTOS P,FABRICANTES F WHERE P.PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTOS P2 WHERE F.NOMBRE = 'Lenovo' AND P2.ID_FABRICANTE = F.ID);


--Consultas sobre una tabla

--a. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT PRODUCTOS.NOMBRE FROM PRODUCTOS;
--b. Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT PRODUCTOS.NOMBRE AS "PRODUCTOS:",PRODUCTOS.PRECIO AS "EUROS" FROM PRODUCTOS;
--c. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(PRODUCTOS.NOMBRE),PRECIO FROM PRODUCTOS;
--d. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo losnombres a minúscula.
SELECT LOWER(PRODUCTOS.NOMBRE),PRODUCTOS.PRECIO FROM PRODUCTOS;
-- e. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT PRODUCTOS.NOMBRE,ROUND(PRODUCTOS.PRECIO,1) FROM PRODUCTOS;
-- f. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT PRODUCTOS.NOMBRE,TRUNC(PRODUCTOS.PRECIO) FROM PRODUCTOS;
-- g. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
SELECT FABRICANTES.ID FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE;
-- h. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT FABRICANTES.ID FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE;
-- i. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES ORDER BY FABRICANTES.NOMBRE ASC;
-- j. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT * FROM (SELECT PRODUCTOS.PRECIO,PRODUCTOS.NOMBRE FROM PRODUCTOS ORDER BY PRODUCTOS.PRECIO DESC) WHERE ROWNUM=1;           ----------------------
-- k. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT PRODUCTOS.NOMBRE FROM PRODUCTOS WHERE PRODUCTOS.PRECIO >= 400;
--l. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT PRODUCTOS.NOMBRE FROM PRODUCTOS WHERE PRODUCTOS.PRECIO != 400;
--m. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.PRECIO >= 80 AND PRODUCTOS.PRECIO <= 300;
--n. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT PRODUCTOS.* FROM PRODUCTOS WHERE PRODUCTOS.PRECIO BETWEEN 60 AND 200;
--o. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT PRODUCTOS.* FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE AND PRODUCTOS.PRECIO > 200 AND FABRICANTES.ID = 6;
--p. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT PRODUCTOS.* FROM PRODUCTOS INNER JOIN FABRICANTES ON (FABRICANTES.ID=ID_FABRICANTE) WHERE FABRICANTES.ID IN (1,3,5);
--q. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE FABRICANTES.NOMBRE LIKE 'S%';
--r. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE LOWER(FABRICANTES.NOMBRE) LIKE '%e';
--s. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES WHERE LOWER(FABRICANTES.NOMBRE) LIKE '%_w_%';

--Consultas resumen

--1) Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) FROM PRODUCTOS;
--2) Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT FABRICANTES.ID) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE;
--3) Calcula la media del precio de todos los productos.
SELECT AVG(PRODUCTOS.PRECIO) FROM PRODUCTOS;
--4) Calcula el precio más barato de todos los productos.
SELECT MIN(PRODUCTOS.PRECIO) FROM PRODUCTOS;
--5) Lista el nombre y el precio del producto más caro.
SELECT PRODUCTOS.NOMBRE,PRODUCTOS.PRECIO FROM PRODUCTOS WHERE PRODUCTOS.PRECIO = (SELECT MIN(PRODUCTOS.PRECIO) FROM PRODUCTOS);
--6) Calcula la suma de los precios de todos los productos.
SELECT SUM(PRODUCTOS.PRECIO) FROM PRODUCTOS;
--7) Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(PRODUCTOS.NOMBRE) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Asus';
--8) Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(PRODUCTOS.PRECIO) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Asus';
--9) Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(PRODUCTOS.PRECIO) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Asus';
--10) Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(PRODUCTOS.PRECIO) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Asus';
--11) Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(PRODUCTOS.PRECIO) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Asus';
--12) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MIN(PRODUCTOS.PRECIO),MAX(PRODUCTOS.PRECIO),AVG(PRODUCTOS.PRECIO),COUNT(PRODUCTOS.ID) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Crucial';
--13) Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también
--debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
--Ordene el resultado descendentemente por el número de productos.
SELECT FABRICANTES.NOMBRE,COUNT(PRODUCTOS.ID) FROM FABRICANTES FULL OUTER JOIN PRODUCTOS ON (FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE) GROUP BY FABRICANTES.NOMBRE ORDER BY COUNT(PRODUCTOS.ID) DESC;
--14) Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT FABRICANTES.NOMBRE,MAX(PRODUCTOS.PRECIO),MIN(PRODUCTOS.PRECIO),AVG(PRODUCTOS.PRECIO) FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE;
--15) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT FABRICANTES.ID,MAX(PRODUCTOS.PRECIO),MIN(PRODUCTOS.PRECIO),AVG(PRODUCTOS.PRECIO),COUNT(PRODUCTOS.ID) FROM FABRICANTES INNER JOIN PRODUCTOS ON (FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE) GROUP BY FABRICANTES.ID HAVING AVG(PRODUCTOS.PRECIO)>200;
--16) Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT FABRICANTES.NOMBRE,MAX(PRODUCTOS.PRECIO),MIN(PRODUCTOS.PRECIO),AVG(PRODUCTOS.PRECIO) FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING AVG(PRODUCTOS.PRECIO)>200;
--17) Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(PRODUCTOS.ID) FROM PRODUCTOS WHERE PRODUCTOS.PRECIO >= 180;
--18) Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT FABRICANTES.NOMBRE,COUNT(PRODUCTOS.ID) FROM PRODUCTOS,FABRICANTES WHERE PRODUCTOS.ID_FABRICANTE = FABRICANTES.ID AND PRODUCTOS.PRECIO >=180 GROUP BY FABRICANTES.NOMBRE;
--19) Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT FABRICANTES.ID,AVG(PRODUCTOS.PRECIO) FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE GROUP BY FABRICANTES.ID;
--20) Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT FABRICANTES.NOMBRE,AVG(PRODUCTOS.PRECIO) FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE;
-- 21) Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING AVG(PRODUCTOS.PRECIO) >=150;
-- 22) Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES,PRODUCTOS WHERE FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING COUNT(PRODUCTOS.ID) >=2;

-- Subconsultas (En la cláusula HAVING)

--18. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT FABRICANTES.NOMBRE FROM FABRICANTES,PRODUCTOS GROUP BY (FABRICANTES.NOMBRE) HAVING COUNT(PRODUCTOS.ID) = (SELECT COUNT(PRODUCTOS.ID) FROM PRODUCTOS,FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo');
