-- A. Mostrar el DNI de los profesores que pertenecen al departamento de informática y comunicaciones.

SELECT DNI FROM PROFESOR P JOIN DEPARTAMENTO D USING (CODDEP) WHERE D.NOMBRE='Informática y Comunicaciones';

-- B. Mostrar el nombre y el primer apellido de los alumnos bilingües que han obtenido el certificado en Barcelona o Madrid.

SELECT NOMBRE, PRAPELLIDO FROM ALUMNO A JOIN ALUMBIL USING (DNI) WHERE UPPER(LUGAR) IN ('MADRID','BARCELONA');


-- C. Mostar el nombre y los apellidos de los alumnos que se encuentran matriculados en la asignatura de Base de datos y de Acceso a datos.
SELECT AL.NOMBRE, AL.PRAPELLIDO, AL.SGAPELLIDO FROM ALUMNO AL JOIN MATRICULA M USING (DNI) JOIN ASIGNATURA AG USING (CODASIG) WHERE UPPER(AG.NOMBRE) IN ('BASES DE DATOS','ACCESO A DATOS');


-- D. Mostrar el nombre y apellidos de los alumnos que han aprobado asignaturas del ciclo con siglas DAM.
SELECT ALUMNO.NOMBRE, PRAPELLIDO, SGAPELLIDO FROM ALUMNO AL JOIN MATRICULA M USING(DNI) JOIN ASIGNATURA AG USING(CODASIG) JOIN CICLO C USING(CODDF) WHERE SIGLAS='DAM' AND NOTA>=5;


-- E. Mostar las asignaturas de más de 100 horas que pertenecen al ciclo con siglas DAM que ha sido impartido por algún profesor del departamento de informática y comunicaciones y que ha sido cursado por alumnos en el curso 2023.
SELECT AG.NOMBRE FROM ALUMNO AL JOIN MATRICULA M USING(DNI) JOIN ASIGNATURA AG USING(CODASING) JOIN IMPARTE I USING(CODASIG) JOIN PROFESOR P USING(DNI) JOIN DEPARTAMENTO D USING(CODDEP) WHERE NH>100 AND SIGLAS = 'DAM' AND CICLO.NOMBRE = 'Informática y Comunicaciones' AND M.CURSO=2023 UNION SELECT AG.NOMBRE FROM ASIGNATURA AG2 JOIN CICLO C USING(CODCF) WHERE NH>100 AND SIGLAS = 'DAM' AND CICLO.NOMBRE = 'Informática y Comunicaciones' AND M.CURSO=2023;

--se podrian hacer como el on, sería igual solo que en vez de using poner ON y la condicion de union

--EL Union se puede usar porque sacas las mismos datos.