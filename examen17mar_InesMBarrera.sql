-- Examen Ines Maria Barrera

DROP TABLE ALUMNOS;
DROP TABLE PROFESORES;
DROP TABLE ASIGNATURAS;
DROP TABLE NOTAS;
CREATE TABLE ALUMNOS
(
  COD_ALUMNO NUMBER(3) PRIMARY KEY,
  NOMBRE VARCHAR2(30),
  APE1 VARCHAR2(30),
  APE2 VARCHAR2(30),
  TELEFONO NUMBER(10),
  CIUDAD VARCHAR2(30)
);

INSERT INTO ALUMNOS VALUES(1,'ANTONIO', 'RODRIGUEZ', 'OLMO',111111, 'PUERTOLLANO');
INSERT INTO ALUMNOS VALUES(2,'ANA', 'SANTOS', 'SANTOS',222222, 'PUERTOLLANO');
INSERT INTO ALUMNOS VALUES(3,'SANTIAGO', 'REDONDO', 'MORENO',333333, 'PUERTOLLANO');
INSERT INTO ALUMNOS VALUES(4,'ANGELA', 'VELASCO', 'VELASCO',444444, 'CIUDAD REAL');
INSERT INTO ALUMNOS VALUES(5,'PEPE', 'SANTOS', 'ROMERO',555555, 'CIIUDAD REAL');

CREATE TABLE PROFESORES
(
    CODIGO VARCHAR2(4) PRIMARY KEY,
    DNI VARCHAR2(11) UNIQUE,
    NOMBRE VARCHAR2(30)
);

INSERT INTO PROFESORES VALUES('P001', '59595959', 'ANTONIO');
INSERT INTO PROFESORES VALUES('P002', '56565656', 'CARMEN');
INSERT INTO PROFESORES VALUES('P003', '72727272', 'TERESA');

CREATE TABLE  ASIGNATURAS
(
  COD_ASIG NUMBER(3) PRIMARY KEY,
  NOMBRE  VARCHAR2(20),
  HORAS NUMBER(2),
  COD_PROFE VARCHAR2(4),
  FOREIGN KEY (COD_PROFE) REFERENCES PROFESORES(CODIGO)
);

INSERT INTO ASIGNATURAS VALUES(1,'PROGRAMACION',6, 'P001');
INSERT INTO ASIGNATURAS VALUES(2,'BASE DE DATOS',4, 'P001');
INSERT INTO ASIGNATURAS VALUES(3,'LENGUAJE DE MARCAS',6, 'P002');
INSERT INTO ASIGNATURAS VALUES(4,'INGLES',5, 'P003');

CREATE TABLE NOTAS
(
  COD_ALUMNO NUMBER(3),
  COD_ASIG NUMBER(3),
  NOTA NUMBER(4,2),
  PRIMARY KEY (COD_ALUMNO, COD_ASIG),
  FOREIGN KEY (COD_ALUMNO) REFERENCES ALUMNOS(COD_ALUMNO) ON DELETE CASCADE,
  FOREIGN KEY (COD_ASIG) REFERENCES ASIGNATURAS(COD_ASIG) ON DELETE CASCADE	
);



INSERT INTO NOTAS VALUES(1,1,6);
INSERT INTO NOTAS VALUES(1,2,4);
INSERT INTO NOTAS VALUES(1,3,2);
INSERT INTO NOTAS VALUES(1,4,9);

INSERT INTO NOTAS VALUES(2,1,5);
INSERT INTO NOTAS VALUES(2,2,7);
INSERT INTO NOTAS VALUES(2,3,8);
INSERT INTO NOTAS VALUES(2,4,8);

INSERT INTO NOTAS VALUES(3,1,8);
INSERT INTO NOTAS VALUES(3,2,1);
INSERT INTO NOTAS VALUES(3,3,5);
INSERT INTO NOTAS VALUES(3,4,10);

INSERT INTO NOTAS VALUES(4,3,2);
INSERT INTO NOTAS VALUES(4,4,3);

INSERT INTO NOTAS VALUES(5,1,2);
INSERT INTO NOTAS VALUES(5,2,1);
INSERT INTO NOTAS VALUES(5,3,1);
INSERT INTO NOTAS VALUES(5,4,1);

------------------------------------------------------------------------------
-- EJERCICIO 1
-- SACAR LAS NOTAS MEDIAS DE TODAS LAS ASIGNATURAS AGRUPADAS POR ASIGNATURAS DE 
-- AQUELLOS ALUMNOS CUYO NOMBRE CONTENGA LA LETRA "A" Y ORDENADO POR EL NOMBRE 
-- DE LA ASIGNATURA, SIEMPRE Y CUANDO SEA MAYOR O IGUAL QUE 5.
SELECT ASIGNATURAS.NOMBRE, AVG(NOTAS.NOTA)
FROM ASIGNATURAS JOIN NOTAS
ON ASIGNATURAS.COD_ASIG = NOTAS.COD_ASIG
JOIN ALUMNOS
ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
    WHERE UPPER(ALUMNOS.NOMBRE) LIKE '%A%' 
    GROUP BY NOTAS.NOTA, ASIGNATURAS.NOMBRE
        HAVING NOTAS.NOTA = (SELECT AVG(NOTA) FROM NOTAS
            WHERE NOTA >= 5
            GROUP BY NOTAS.COD_ASIG) 
    ORDER BY ASIGNATURAS.NOMBRE;
    
        -- Correcion
        SELECT ASIGNATURAS.NOMBRE, AVG(NOTAS.NOTA)
        FROM NOTAS JOIN ASIGNATURAS
        ON ASIGNATURAS.COD_ASIG = NOTAS.COD_ASIG
        JOIN ALUMNOS
        ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
            WHERE UPPER(ALUMNOS.NOMBRE) LIKE '%A%' 
            GROUP BY NOTAS.COD_ASIG, ASIGNATURAS.NOMBRE
                HAVING AVG(NOTAS.NOTA) >= 5 
            ORDER BY ASIGNATURAS.NOMBRE;

-- EJERCICIO 2
-- LISTAR EL NUMERO DE HORAS QUE CADA ALUMNO PERMANECERA EN EL INSTITUTO A LA 
-- SEMANA SABIENDO QUE EL CAMPO HORAS DE LA TABLA ASIGNATURAS SON LAS HORAS 
-- SEMANALES DE CADA ASIGNATURA, ADEMAS PONDREMOS LA "FECHA DE HOY" FORMATEADA 
-- DE ESTA MANERA "23 DE ENERO DE 2021"
SELECT ALUMNOS.NOMBRE, TO_CHAR(SYSDATE, 'DD-MON-YYYY') AS FECHA, SUM(ASIGNATURAS.HORAS) AS HORAS_SEMANALES
FROM ALUMNOS JOIN NOTAS
ON ALUMNOS.COD_ALUMNO = NOTAS.COD_ALUMNO
JOIN ASIGNATURAS
ON NOTAS.COD_ASIG = ASIGNATURAS.COD_ASIG
GROUP BY ALUMNOS.NOMBRE;

-- EJERCICIO 3
-- QUEREMOS SABER LA NOTA MEDIA DEL ALUMNO 'ANA' Y LA DIFERENCIA QUE EXISTE 
-- CON LA NOTA MEDIA DEL ALUMNO QUE HA CONSEGUIDO LA MAS ALTA DE LA CLASE
SELECT (SELECT MAX(AVG(NOTA)) FROM NOTAS GROUP BY NOTA) - AVG(NOTAS.NOTA) AS
NOTA_DIFERENCIA, ALUMNOS.NOMBRE
FROM NOTAS JOIN ALUMNOS
ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
    WHERE UPPER(ALUMNOS.NOMBRE) LIKE 'ANA' 
    GROUP BY ALUMNOS.NOMBRE;

        -- Correcion
        SELECT AVG(NOTAS.NOTA) - (SELECT MAX(AVG(NOTA)) FROM NOTAS GROUP BY NOTAS.COD_ALUMNO) AS
        NOTA_DIFERENCIA, ALUMNOS.NOMBRE, AVG(NOTAS.NOTA) AS MEDIA_ANA
        FROM NOTAS JOIN ALUMNOS
        ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
            WHERE ALUMNOS.NOMBRE LIKE 'ANA' 
            GROUP BY NOTAS.COD_ALUMNO, ALUMNOS.NOMBRE;
 
 -- EJERCICIO 4
 -- NOMBRE DEL PROFESOR QUE IMPARTE LA ASIGNATURA QUE HA OBTENIDO LA MEJOR NOTA 
 -- MEDIA ENTRE TODOS SUS ALUMNOS. ES DECIR EL NOMBRE DEL PROFESOR CUYOS ALUMNOS 
 -- HAN OBTENIDO LOS MEJORES RESULTADOS
 SELECT PROFESORES.NOMBRE, ASIGNATURAS.NOMBRE, MAX(AVG(NOTAS.NOTA))
 FROM PROFESORES JOIN ASIGNATURAS
 ON PROFESORES.CODIGO = ASIGNATURAS.COD_PROFE 
 JOIN NOTAS
 ON ASIGNATURAS.COD_ASIG = NOTAS.COD_ASIG
 group by PROFESORES.NOMBRE, ASIGNATURAS.NOMBRE
    HAVING NOTAS.NOTA;
    
        -- Correcion
        SELECT NOTAS.COD_ASIG, ASIGNATURAS.NOMBRE, PROFESORES.NOMBRE
        FROM NOTAS JOIN ASIGNATURAS
        ON NOTAS.COD_ASIG = ASIGNATURAS.COD_ASIG
        JOIN PROFESORES
        ON ASIGNATURAS.COD_PROFE = PROFESORES.CODIGO
        GROUP BY NOTAS.COD_ASIG, ASIGNATURAS.NOMBRE, PROFESORES.NOMBRE
            HAVING AVG(NOTAS.NOTA) = (SELECT MAX(AVG(NOTA)) FROM NOTAS
                GROUP BY COD_ASIG);
 
 -- EJERCICIO 5 
 -- NOMBRES DE LOS ALUMNOS QUE ESTEN MATRICULADOS EN LAS MISMAS ASIGNATURAS QUE "ANA"
SELECT NOTAS.COD_ALUMNO, ALUMNOS.NOMBRE
FROM NOTAS JOIN ALUMNOS
ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
WHERE NOTAS.COD_ASIG = (SELECT COD_ALUMNO FROM ALUMNOS
WHERE UPPER(NOMBRE) LIKE'ANA')
INTERSECT
SELECT NOTAS.COD_ALUMNO, ALUMNOS.NOMBRE
FROM NOTAS JOIN ALUMNOS
ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO;
 
 -- EJERCICIO 6
 -- LISTADO DE LOS NOMBRES DE LOS PROFESORES JUNTO CON LAS ASIGNATURAS QUE NO 
 -- HAN OBTENIDO NINGUN ALUMNO SUSPENSO
 SELECT PROFESORES.NOMBRE, ASIGNATURAS.NOMBRE
 FROM PROFESORES JOIN ASIGNATURAS
 ON PROFESORES.CODIGO = ASIGNATURAS.COD_PROFE 
 JOIN NOTAS
 ON ASIGNATURAS.COD_ASIG = NOTAS.COD_ASIG
    WHERE NOTAS.NOTA > 5;
    
        -- Correcion
        SELECT PROFESORES.NOMBRE, ASIGNATURAS.NOMBRE
        FROM PROFESORES JOIN ASIGNATURAS
        ON PROFESORES.CODIGO = ASIGNATURAS.COD_PROFE 
        WHERE ASIGNATURAS.COD_ASIG NOT IN (SELECT DISTINCT NOTAS.COD_ASIG FROM NOTAS
            WHERE NOTA < 5);
 
 -- EJERCICIO 7
 -- QUIERO SABER SI ALGUNA NOTA DE "ANA" ES MAYOR QUE TODAS LAS NOTAS DE 
 -- "ANTONIO". EN CASO AFIRMATIVO MOSTRARA EL NOMBRE DE LA ASIGNATURA. 
 -- EN CASO NEGATIVO NO MUESTRA NADA
 SELECT ASIGNATURAS.NOMBRE
 FROM ASIGNATURAS JOIN
 
 -- EJERCICIO 8
 -- MODIFICA LA NOTA A TODOS LOS ALUMNOS DE BASES DE DATOS PONIENDOLE LA 
 -- MISMA NOTA QUE EL ALUMNO QUE TIENE LA NOTA MAS ALTA 
 UPDATE NOTAS
 SET NOTA = (SELECT MAX(NOTA) FROM NOTAS);
 
 -- EJERCICIO 9
 -- BORRA LOS DATOS DE TODOS LOS ALUMNOS QUE TENGAN ALGUNA ASIGNATURA SUSPENSA
 DELETE * FROM ALUMNOS JOIN NOTAS
 ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
 WHERE NOTAS.NOTA < 5;
 
 -- EJERCICIO 10
 -- LISTA LOS NOMBRES DE TODOS AQUELLOS ALUMNOS QUE HAN SUSPENDIDO TODAS LAS 
 -- ASIGNATURAS EN LAS QUE SE HAN MATRICULADO
 SELECT ALUMNOS.NOMBRE, NOTAS.NOTA
 FROM ALUMNOS JOIN NOTAS
 ON NOTAS.COD_ALUMNO = ALUMNOS.COD_ALUMNO
 WHERE NOTAS.NOTA < 5 AND COD_ASIG IN (1,2,3,4);