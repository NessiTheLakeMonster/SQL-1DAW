-- * 28 FEBRERO

----------------------------------------------------------------------------
-- * JOIN
-- sirve para cruzar tablas entre ellas en una misma select

-- ! esta en el usuario clase3
CREATE TABLE ALUMNO (
    COD NUMBER(3) PRIMARY KEY,
    NOMBRE VARCHAR2(15)
);

CREATE TABLE ASIGNATURA (
    COD VARCHAR2(3) PRIMARY KEY,
    NOMBRE VARCHAR2(15)
);

CREATE TABLE NOTA (
    COD_ALUM NUMBER(3),
    COD_ASIG VARCHAR2(3),
    CALIF NUMBER(4,2),
    PRIMARY KEY (COD_ALUM, COD_ASIG),
    FOREIGN KEY (COD_ALUM) REFERENCES ALUMNO(COD), 
    FOREIGN KEY (COD_ASIG) REFERENCES ASIGNATURA(COD)
);

INSERT INTO ALUMNO VALUES (1, 'PEPE');
INSERT INTO ALUMNO VALUES (2, 'JUAN');
INSERT INTO ALUMNO VALUES (3, 'ANA');

INSERT INTO ASIGNATURA VALUES ('BD', 'BASES DE DATOS');
INSERT INTO ASIGNATURA VALUES ('PR', 'PROGRAMACIÓN');
INSERT INTO ASIGNATURA VALUES ('SI', 'SISTEMAS');

INSERT INTO NOTA VALUES (1, 'BD', 8);
INSERT INTO NOTA VALUES (1, 'PR', 5);
INSERT INTO NOTA VALUES (1, 'SI', 4);
INSERT INTO NOTA VALUES (2, 'BD', 3);
INSERT INTO NOTA VALUES (3, 'BD', 9);
INSERT INTO NOTA VALUES (3, 'PR', 5);

SELECT ALUMNO.NOMBRE, ASIGNATURA.NOMBRE, NOTA.CALIF -- ! Usar esta forma
FROM ALUMNO JOIN NOTA
ON ALUMNO.COD = NOTA.COD_ALUM
JOIN ASIGNATURA
ON NOTA.COD_ASIG = ASIGNATURA.COD 
    WHERE UPPER(ASIGNATURA.NOMBRE) LIKE 'PROGRAMACIÓN';

-- ahora se va a hacer la misma select pero en modo clasico (usar la de arriba)
SELECT ALUMNO.NOMBRE, ASIGNATURA.NOMBRE, NOTA.CALIF
FROM ALUMNO, ASIGNATURA, NOTA (
    WHERE ALUMNO.COD = NOTA.COD_ALUM AND
    NOTA.COD_ASIG = ASIGNATURA.COD AND
    UPPER(ASIGNATURA.NOMBRE) LIKE 'PROGRAMACIÓN'
);

-- nombre de los alumnos en todas las asignaturas que hayan suspendido
SELECT ALUMNO.NOMBRE, ASIGNATURA.NOMBRE, NOTA.CALIF
FROM ALUMNO JOIN NOTA
ON ALUMNO.COD = NOTA.COD_ALUM
JOIN ASIGNATURA
ON NOTA.COD_ASIG = ASIGNATURA.COD 
WHERE NOTA.CALIF < 5;

-------------------------------------------------------------------------
-- ! SCRIPT DEL AULA VIRTUAL
    CREATE TABLE EDITORIAL (
        CODIGO NUMBER(3) PRIMARY KEY,
        NOMBRE VARCHAR2(30)
    );

    CREATE TABLE LIBROS (
        CODIGO NUMBER(3) PRIMARY KEY, 
        NOMBRE VARCHAR2(30), 
        AUTOR VARCHAR2(30), 
        COD_EDIT NUMBER(3), 
        PRECIO NUMBER(4),
        FOREIGN KEY (COD_EDIT) REFERENCES EDITORIAL(CODIGO)
    );

    insert into editorial values(1, 'ANAYA');
    insert into editorial values(2, 'MC GRAW HILL');
    insert into editorial values(3, 'SANTILLANA');
    insert into editorial values(4, 'SANTILLANA');
    insert into editorial values(5, 'EDITORIAL5');

    insert into libros values(100,'Uno','Richard Bach',1,15);
    insert into libros values(101,'Dos','Richard Bach',1,20);
    insert into libros values(102,'Ilusiones','Richard Bach',4,18);
    insert into libros values(103,'Puente al infinito','Richard Bach',2,20);
    insert into libros values(104,'Aprenda PHP','Mario Molina',4,40);
    insert into libros values(105,'El aleph','Borges',2,10);
    insert into libros values(106,'Antología','Borges',1,20);
    insert into libros values(107,'Cervantes y el quijote','Borges',3,25);
    insert into libros values(108,'Tres','Richard Bach',1,40);
-- ! FIN DEL SCRIPT

-- nombre del libro, nombre de la editorial y el precio
SELECT LIBROS.NOMBRE, EDITORIAL.NOMBRE, LIBROS.PRECIO
FROM LIBROS JOIN EDITORIAL
ON LIBROS.COD_EDIT = EDITORIAL.CODIGO
ORDER BY LIBROS.NOMBRE;

-----------------------------------------------------------
-- ! Script de Alicia; 
    CREATE TABLE DEPART (
        DEPT_NO NUMBER(2) NOT NULL,
        DNOMBRE VARCHAR2(14), 
        LOC VARCHAR2(14) 
    );

    INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
    INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
    INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
    INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');

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

-- empleado y nombre de deparmamento
SELECT EMPLE.APELLIDO, DEPART.DNOMBRE
FROM EMPLE JOIN DEPART
ON -- c quedo a medias xd

------------------------------------------------------------
-- * HAVING
-- permite seleccionar (o rechazar) un grupo de registros

-- ! volvemos a las tablas de ALUMNO y ASIGNATURA
-- nombre de la asignatura y cuanto alumnos tienen nota en bbdd
SELECT ASIGNATURA.NOMBRE, COUNT(*)
FROM ASIGNATURA JOIN NOTA
ON ASIGNATURA.COD = NOTA.COD_ASIG 
    GROUP BY ASIGNATURA.NOMBRE
    HAVING ASIGNATURA.NOMBRE = 'BASES DE DATOS';

SELECT ASIGNATURA.NOMBRE, COUNT(*)
FROM ASIGNATURA JOIN NOTA
ON ASIGNATURA.COD = NOTA.COD_ASIG 
    GROUP BY ASIGNATURA.NOMBRE
    HAVING COUNT(*) > 2;

-- ? Si hay un having debe haber un group by
-- ? Si hay un where también puede haber un having
-- ? Si se necesita un order by SIEMPRE debe ir después del having (suele ir lo último)

-- ! en las funciones de grupo NO puede haber alias
        SELECT ASIGNATURA.NOMBRE, COUNT(*) AS CONTADOR 
        FROM ASIGNATURA JOIN NOTA
        ON ASIGNATURA.COD = NOTA.COD_ASIG 
            GROUP BY ASIGNATURA.NOMBRE
            HAVING CONTADOR > 2;

-- ! tabla EMPLE
-- desde la tabla emple visualiza el nombre del departamente que tiene mas gente con el oficio de empleado
SELECT