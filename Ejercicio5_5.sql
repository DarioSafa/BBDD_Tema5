-- a. Mostrar el DNI de los empleados que son de Barcelona, Madrid, Sevilla o Málaga, que no se llaman ni Antonio ni Luis y que su primer apellido es García.
SELECT EMPLEADOS.DNI FROM EMPLEADOS WHERE EMPLEADOS.CIUDAD IN ('Barcelona','Sevilla','Málaga') AND EMPLEADOS.NOMBRE NOT IN ('Antonio','Luis') AND EMPLEADOS.PRAPELLIDO = 'García';


-- b. Mostrar el DNI de los empleados que no son de Sevilla, pero sí son de Barcelona o de Madrid y que la primera letra del nombre es una M.
SELECT EMPLEADOS.DNI FROM EMPLEADOS WHERE EMPLEADOS.CIUDAD <> 'Sevilla' AND EMPLEADOS.CIUDAD IN ('Barcelona','Madrid') AND UPPDER(EMPLEADOS.NOMBRE) LIKE ('M%');


-- c. Mostar el DNI de los empleados que son de Sevilla, pero no son de Barcelona o de Madrid y que la primera letra de su nombre no es una M.
SELECT EMPLEADOS.DNI FROM EMPLEADOS WHERE EMPLEADOS.CIUDAD = 'Sevilla' AND EMPLEADOS.CIUDAD NOT IN ('Barcelona','Madrid') AND UPPDER(EMPLEADOS.NOMBRE) NOT LIKE ('M%');


-- d. Mostrar el nombre y el primer apellido de aquellos empleados que viven en Valencia o Vizcaya o en una ciudad cuya última letra sea “a” ordenados descendentemente por el primer apellido.
SELECT EMPLEADOS.NOMBRE, EMPLEADOS.PRAPELLIDO FROM EMPLEADOS WHERE (EMPLEADOS.CIUDAD IN ('Valencia','Vizcaya') OR EMPLEADOS.CIUDAD LIKE ('%a')) ORDER BY PRAPELLIDO DESC;


-- e. Mostrar el DNI de aquellos empleados que son de Barcelona y que se llaman Antonio, Luis, Iván o Pedro y que se apellidan García o Cantos.
SELECT EMPLEADOS.DNI WHERE EMPLEADOS.CIUDAD = 'Barcelona' AND EMPLEADOS.NOMBRE IN ('Antonio','Luis','Iván','Pedro') AND (EMPLEADOS.PRAPELLIDO IN ('García','Cantos') OR EMPLEADOS.SGAPELLIDO IN ('García','Cantos'));


-- f. Mostrar el nombre y los apellidos de los empleados cuyo DNI contenga un 4 y el nombre sea Rosa, Luis, Ramón o Antonio, ordenados descendentemente por el primer apellido.
SELECT EMPLEADOS.NOMBRE, EMPLEADOS.PRAPELLIDO, EMPLEADOS.SGAPELLIDO FROM EMPLEADOS WHERE EMPLEADOS.DNI LIKE ('%_4_%') AND EMPLEADOS.NOMBRE IN ('Rosa','Luis','Ramón','Antonio') ORDER BY PRAPELLIDO DESC;


-- g. Mostar el DNI de los empleados que se llaman Antonio y que su primer apellido no contenga la letra c y su segundo apellido sea García, Gómez o Sánchez, ordenador por el segundo apellido.
SELECT EMPLEADOS.DNI FROM EMPLEADOS WHERE EMPLEADOS.NOMBRE = 'Antonio' AND LOWER (EMPLEADOS.PRAPELLIDO) NOT LIKE ('%_c_%') AND EMPLEADOS.SGAPELLIDO IN ('García','Gómez','Sánchez') ORDER BY SGAPELLIDO;


-- h. Mostrar el DNI de aquellos empleados que no tengan segundo apellido.-
SELECT EMPLEADOS.DNI FROM EMPLEADOS WHERE EMPLEADOS.SGAPELLIDO IS NULL;