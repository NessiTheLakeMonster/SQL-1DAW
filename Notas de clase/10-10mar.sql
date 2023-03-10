-- * 10 MARZO

-----------------------------------------------------------------------
-- * SUBQUERIES (ANY - SOME - ALL)

-- ANY Y SOME son sinonimos. Miran si alguna fila de la lista resultado de una
-- subconsulta se encuentra el valor especificado en la condición

-- ! SCRIPT DEL AULA VIRTUAL (esta en el usuario biblioteca)
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

-----------------------------------------------------------------------
-- Queremos saber los titulos de los libros de "Borges" que pertenecen a editoriales
-- que han publicado también libros de "Richard Bach"
SELECT NOMBRE 
FROM LIBROS
    WHERE UPPER(AUTOR) LIKE 'BORGES'
    AND COD_EDIT = ANY (SELECT DISTINCT COD_EDIT FROM LIBROS 
        WHERE UPPER(AUTOR) LIKE 'RICHARD BACH');

-- Prueba de la SELECT anterior pero con un ALL
SELECT NOMBRE 
FROM LIBROS
    WHERE UPPER(AUTOR) LIKE 'BORGES'
    AND COD_EDIT = ALL (SELECT DISTINCT COD_EDIT FROM LIBROS 
        WHERE UPPER(AUTOR) LIKE 'RICHARD BACH');

-- Queremos saber si algún precio de los libros de "Borges" es mayor que 
-- aguno de los precios de "Richard Bach"
SELECT NOMBRE
FROM LIBROS
    WHERE UPPER(AUTOR) LIKE 'BORGES'
    AND PRECIO > SOME (SELECT PRECIO FROM LIBROS
        WHERE UPPER(AUTOR) LIKE 'RICHARD BACH');

-- Queremos saber el titulo, autor y precio del libro mas costoso
SELECT NOMBRE, AUTOR
FROM LIBROS
    WHERE PRECIO = (SELECT MAX(PRECIO) FROM LIBROS); -- Se puede poner o = o IN

-----------------------------------------------------------------------
-- ! Script de Alicia (esta en el usuario oficina)
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

-- Obtener los datos de los empleados cuyo salario sea igual a algún
-- salario de los empleados del departamento 30
SELECT APELLIDO
FROM EMPLE
    WHERE SALARIO = ANY(SELECT SALARIO FROM EMPLE
        WHERE DEPT_NO = 30);

-----------------------------------------------------------------------
-- * LEFT JOIN
-- ! LEFT JOIN = LEFT OUTER JOIN

-- volvemos al usuario oficina con ls tablas de depart y emple 
INSERT INTO EMPLE VALUES (55,'BECARIO1','PRACTICAS',NULl,SYSDATE,300,NULL,10);
INSERT INTO EMPLE VALUES (56,'BECARIO2','PRACTICAS',NULl,SYSDATE,300,NULL,10);

CREATE TABLE DEPART2 (
    COD NUMBER(2) PRIMARY KEY,
    NOMBRE VARCHAR2(30)
);

CREATE TABLE EMPLE2 (
    COD NUMBER(2) PRIMARY KEY,
    NUM_DIR NUMBER(2),
    COD_DEP NUMBER(2),
    NOMBRE VARCHAR2(30),
    FOREIGN KEY (NUM_DIR) REFERENCES EMPLE2(COD), -- REFLEXIVA
    FOREIGN KEY (COD_DEP) REFERENCES DEPART2(COD)
);

INSERT INTO DEPART2 VALUES (1,'VENTAS');
INSERT INTO DEPART2 VALUES (2,'COMPRAS');

INSERT INTO EMPLE2 VALUES (1,NULL,1,'DIRECTOR1');
INSERT INTO EMPLE2 VALUES (2,1,1,'EMPLE1');
INSERT INTO EMPLE2 VALUES (3,1,1,'EMPLE2');
INSERT INTO EMPLE2 VALUES (4,1,1,'EMPLE3');
INSERT INTO EMPLE2 VALUES (5,NULL,1,'DIRECTOR2');
INSERT INTO EMPLE2 VALUES (6,5,2,'EMPLE4');
INSERT INTO EMPLE2 VALUES (7,5,2,'EMPLE5');
INSERT INTO EMPLE2 VALUES (6,5,2,'EMPLE6');

INSERT INTO EMPLE2 VALUES (9,NULL,NULL,'BECARIO1');
INSERT INTO EMPLE2 VALUES (10,NULL,NULL,'BECARIO2');
INSERT INTO EMPLE2 VALUES (11,NULL,NULL,'BECARIO3');

-- sacar el nombre del empleado y al lado el numbre de su departamento
SELECT EMPLE2.NOMBRE, DEPART2.NOMBRE
FROM EMPLE2 JOIN DEPART2
ON EMPLE2.COD_DEP = DEPART2.COD; --! este caso no saca a los becarios

SELECT EMPLE2.NOMBRE, DEPART2.NOMBRE
FROM EMPLE2 LEFT JOIN DEPART2
ON EMPLE2.COD_DEP = DEPART2.COD; --! este caso saca a los becarios


