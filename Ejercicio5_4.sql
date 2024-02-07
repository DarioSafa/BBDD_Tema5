-- a. Mostrar el precio del libro más caro. DELETE
SELECT MAX(LIBRO.PRECIO) FROM LIBRO;


-- b. Mostrar el precio del libro más barato.
SELECT MIN(LIBRO.PRECIO) FROM LIBRO;


-- c. Mostrar la fecha del libro editado más antiguo por el técnico 443042293.
SELECT MIN (EDITA.FECHA_SAL) FROM EDITA WHERE EDITA.DNI = 443042293;
-- o tambien se puede hacer así ORDENANDO ASCENDENTEMENTE Y LUEGO LIMITANDO LAS FILAS QUE SALEN A 1
SELECT (EDITA.FECHA_SAL) FROM EDITA WHERE EDITA.DNI = 44302293; ORDER BY FECHA_SAL ASC AND ROWNUM = 1;


-- d. Mostrar la fecha del último libro editado por el técnico 29110302.
SELECT MAX (EDITA.FECHA_SAL) FROM EDITA WHERE EDITA.DNI = 29110302;
-- o tambien se puede hacer así ORDENANDO DESCENDENTEMENTE Y LUEGO LIMITANDO LAS FILAS QUE SALEN A 1
SELECT (EDITA.FECHA_SAL) FROM EDITA WHERE EDITA.DNI = 44302293; ORDER BY FECHA_SAL DESC AND ROWNUM = 1;

-- e. Mostrar cuantas páginas tiene el libro más extenso de la temática Novela.
SELECT MAX(LIBRO.NUMPAG) FROM LIBRO WHERE LIBRO.TEMATICA = UPPER('Novela');


-- f. Mostrar cuántas páginas tiene el libro menos extenso de temática Infantil, Científica, Novela o Cómico.
SELECT MIN(LIBRO.NUMPAG) FROM LIBRO WHERE LIBRO.TEMATICA IN ('Infantil','Científica','Novela','Cómico');


-- g. Mostrar cuántos libros hay de temática Científico con un precio entre 5 y 15 euros.
SELECT COUNT(*) FROM LIBRO WHERE LIBRO.TEMATICA LIKE 'Científic_' AND LIBRO.PRECIO BETWEEN 5 AND 15;
--El like porque arriba ponia cientifica y luego cientifico, así practico los caracteres comodin.