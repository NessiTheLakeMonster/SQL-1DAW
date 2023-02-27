-- * 27 FEBRERO

---------------------------------
-- ! Script de Alicia
    CREATE TABLE EMPLE (
        EMP_NO NUMBER(4) NOT NULL,
        APELLIDO VARCHAR2(10),
        OFICIO VARCHAR2(10),
        DIR NUMBER(4),
        FECHA_ALT DATE,
        SALARIO NUMBER(7),
        COMISION NUMBER(7),
        DEPT_NO NUMBER(2) NOT NULL
    );

    INSERT INTO EMPLE VALUES (7369,'SANCHEZ','EMPLEADO',7902,'17/12/1990',1040,NULL,20);
    INSERT INTO EMPLE VALUES (7499,'ARROYO','VENDEDOR',7698,'20/02/1990',1500,390,30);
    INSERT INTO EMPLE VALUES (7521,'SALA','VENDEDOR',7698,'22/02/1991',1625,650,30);
    INSERT INTO EMPLE VALUES (7566,'JIMENEZ','DIRECTOR',7839,'02/04/1991',2900,NULL,20);
    INSERT INTO EMPLE VALUES (7654,'MARTIN','VENDEDOR',7698,'29/09/1991',1600,1020,30);
    INSERT INTO EMPLE VALUES (7698,'NEGRO','DIRECTOR',7839,'01/05/1991',3005,NULL,30);
    INSERT INTO EMPLE VALUES (7782,'CEREZO','DIRECTOR',7839,'09/06/1991',2885,NULL,10);
    INSERT INTO EMPLE VALUES (7788,'GIL','ANALISTA',7566,'09/11/1991',3000,NULL,20);
    INSERT INTO EMPLE VALUES (7839,'REY','PRESIDENTE',NULL,'17/11/1991',4100,NULL,10);
    INSERT INTO EMPLE VALUES (7844,'TOVAR','VENDEDOR',7698,'08/09/1991',1350,0,30);
    INSERT INTO EMPLE VALUES (7876,'ALONSO','EMPLEADO',7788,'23/09/1991',1430,NULL,20);
    INSERT INTO EMPLE VALUES (7900,'JIMENO','EMPLEADO',7698,'03/12/1991',1335,NULL,30);
    INSERT INTO EMPLE VALUES (7902,'FERNANDEZ','ANALISTA',7566,'03/12/1991',3000,NULL,20);
    INSERT INTO EMPLE VALUES (7934,'MUÑOZ','EMPLEADO',7782,'23/01/1992',1690,NULL,10);
-- ! Fin del script

/* A partir de la tabla EMPLE, obten el apellido, salario y depto_no
de los empleados cuyo salario sea mayor de 2000 en los departamentos 10 o 20 */
SELECT APELLIDO, SALARIO, DEPT_NO
FROM EMPLE (
    WHERE SALARIO > 2000 
    AND (DEPT_NO = 10 OR DEPT_NO = 20)
);

----------------------------------------------------------------------------
-- * Uso de los COMODINES

SELECT *
FROM EMPLE (
    WHERE UPPER (APELLIDO) LIKE 'A%' -- los empleados que empiecen por A
);

SELECT *
FROM EMPLE (
    WHERE UPPER (APELLIDO) LIKE '_A%' -- los empleados que empiecen por una letra y luego A
); -- se ponen tantos '_' como caracteres que se quieran (puede ser de cualquier tipo aka numero o letra)

SELECT *
FROM EMPLE (
    WHERE UPPER (APELLIDO) NOT LIKE '_A%' -- para que saque los que sean distintos
); 

-- Saca todos los apellidos que comiencen por S
SELECT APELLIDO
FROM EMPLE (
    WHERE UPPER (APELLIDO) LIKE 'S%'
);
-- Saca todos los apellidos que tengan R en la segunda posición
SELECT APELLIDO
FROM EMPLE (
    WHERE UPPER (APELLIDO) LIKE '_R%'
);
-- Saca todos los apellidos que empiecen por A y tengan una O en si interior
SELECT APELLIDO
FROM EMPLE (
    WHERE UPPER (APELLIDO) LIKE 'A%O%'
);

-----------------------------------------------------------------------------
-- * Uso del NULL y el NOT NULL

SELECT APELLIDO, SALARIO, COMISION, SALARIO+COMISION
FROM EMPLE (
    WHERE COMISION IS NOT NULL
);

-- Encuentra aquellos empleados que no tienen director
SELECT *
FROM EMPLE (
    WHERE DIR IS NULL
);
-- Ontén el apellido del salario que no se encuentre entre 1500 y 2000
SELECT SALARIO, APELLIDO
FROM EMPLE (
    WHERE SALARIO NOT BETWEEN 1500 AND 2000
);
-- consulta los apellidos cuyo numero de departamento no sea 10 o 30
SELECT APELLIDO
FROM EMPLE (
    WHERE DEPT_NO NOT IN (10,30)
);
-- consulta los apellidos cuyo numero de departamento sea 20 o 30
SELECT APELLIDO
FROM EMPLE (
    WHERE DEPT_NO IN (20,30)
);
-- consulta los apellidos cuyo oficio sea 'VENDEDOR', 'ANALISTA' o 'EMPLEADO'
SELECT APELLIDO
FROM EMPLE (
    WHERE UPPER (OFICIO) IN ('VENDEDOR', 'ANALISTA', 'EMPLEADO') 
);

--------------------------------------------------------------
-- * TRABAJAR LAS TABLAS EN VERTICAL

-- * COUNT
-- cuenta el num de valores de una columna o fila
SELECT COUNT(*) FROM EMPLE;
SELECT COUNT(APELLIDO) FROM EMPLE; -- te dìce cuantos apellidos hay en total
SELECT COUNT(DISTINCT OFICIO) FROM EMPLE;

-- * AVG
-- Función que calcula las madias

SELECT AVG(SALARIO) FROM EMPLE; -- Hará la media de todos los salarios de la tabla

-- * SUM
-- Unicamente suma todos los valores 
SELECT SUM(SALARIOS) FROM EMPLE;

SELECT SUM(SALARIOS) 
FROM EMPLE (
    WHERE UPPER (ODICIO) LIKE 'VENDEDOR'
);

-- * MIN
-- para sacar el valor minimo
SELECT MIN(SALARIO) FROM EMPLE;

-- * MAX
-- para sacar el valor máximo
SELECT MAX(SALARIO) FROM EMPLE;

-- * GROUP BY
SELECT MIN(SALARIO)
FROM EMPLE (
    GROUP BY OFICIO
);