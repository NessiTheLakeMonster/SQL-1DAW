-- * 6 MARZO

-----------------------------------------------------
--Creamos una tabla con 3 campos
-- ! esta en el usuario alumno [SCRIPT DEL AULA VIRTUAL]
    CREATE TABLE AL_ACTUALES (
        COD_ALUMNO NUMBER(5) PRIMARY KEY,
        NOMBRE VARCHAR2(20),
        APELLIDO VARCHAR2(20)
    );

    CREATE TABLE AL_ANT (
        COD_ALUMNO NUMBER(5) PRIMARY KEY,
        NOMBRE VARCHAR2(20),
        APELLIDO VARCHAR2(20)
    );

    CREATE TABLE AL_FUTUROS (
        COD_ALUMNO NUMBER(5) PRIMARY KEY,
        NOMBRE VARCHAR2(20),
        APELLIDO VARCHAR2(20)
    );

    INSERT INTO AL_ACTUALES VALUES('1','ALUMNO1', 'APELLIDO1');
    INSERT INTO AL_ACTUALES VALUES('2','ALUMNO2', 'APELLIDO2');
    INSERT INTO AL_ACTUALES VALUES('3','ALUMNO3', 'APELLIDO3');
    INSERT INTO AL_ACTUALES VALUES('4','ALUMNO4', 'APELLIDO4');
    INSERT INTO AL_ACTUALES VALUES('5','ALUMNO5', 'APELLIDO5');
    INSERT INTO AL_ACTUALES VALUES('6','ALUMNO6', 'APELLIDO6');

    INSERT INTO AL_ANT VALUES('1','ALUMNO5', 'APELLIDO5');
    INSERT INTO AL_ANT VALUES('2','ALUMNO6', 'APELLIDO6');

    INSERT INTO AL_FUTUROS VALUES('1','ALUMNO7', 'APELLIDO7');
    INSERT INTO AL_FUTUROS VALUES('2','ALUMNO8', 'APELLIDO8');
    INSERT INTO AL_FUTUROS VALUES('3','ALUMNO1', 'APELLIDO1');
    INSERT INTO AL_FUTUROS VALUES('4','ALUMNO2', 'APELLIDO2');
-- ! Fin del script

---------------------------------------------------------------------------------
-- * TEORÍA DE CONJUNTOS (OPERADORES DE CONJUNTOS)
-- Las SELECTS deben tener el mismo número de columnas

---------------------------------------------------------------------------------
-- * UNION
-- Unión de dos conjuntos.
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
UNION 
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 

-- Si hay alumnos que estan en ambas tablas, solo lo coge de una de ellas
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
UNION ALL -- ! NO discrimina los duplicados
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 

-------------------------------------------------------------------------------
-- * INTERSECT
-- salen los comunes a ambas tablas
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
INTERSECT
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 

-------------------------------------------------------------------------------
-- * MINUS
-- saca solo los que se encuentran en una sola de las tablas
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
MINUS
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 
-- me saca los alumnos de los actuales que no se encuentran en la de futuros
-- ? en este caso es muy importante el orden de los SELECT

------------------------------------------------------------------------------
-- ! EJERCICIO CON OPERADORES DE CONJUNTOS
-- * Visualizar el nombre y el apellido de la tabla futuros que aparezcan en la tabla antiguos
-- con operadores de conjunto
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS
INTERSECT
SELECT NOMBRE, APELLIDO
FROM AL_ANT;

-- sin operadores de conjunto
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS
    WHERE (NOMBRE,APELLIDO) IN (SELECT NOMBRE, APELLIDO FROM AL_ANT); -- ? subquery



------------------------------------------------------------------------------
-- * SUBQUERIES
-- se utiliza cuando en la select se necesita sacar antes otra cosa
-- un ejemplo es que primero se debe sacar el libro mas caro y luego ponerlos por editoriales
-- se pueden anidar indefinidamente

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

------------------------------------------------------------------------------
-- listado de todos los libros de la editorial que tiene el libro más caro
SELECT COD_EDIT 
FROM LIBROS
    WHERE PRECIO IN (
        SELECT MAX(PRECIO) 
        FROM LIBROS);

-- listado del precio, titulo de los libros y al lado la diferencia que hay  
-- entre su precio y el del libro más barato
SELECT NOMBRE, PRECIO, PRECIO - (SELECT MIN(PRECIO) FROM LIBROS)
AS DIFERENCIA
FROM LIBROS;



