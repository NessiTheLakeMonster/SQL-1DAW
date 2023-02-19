-- 14 Febrero

-- EMPEZAMOS COM DML (DATA MANIPULATION LANGUAGE)

-- * SEQUENCE

CREATE TABLE prod_seq_nuevos (
    cod_prod NUMBER(5) PRIMARY KEY,
    nombre VARCHAR2(30)
);

CREATE TABLE prod_seq_viejos(
    cod_prod NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(30)
);

--  las secuencias se usan para nombrar campos que van en un rango determinado de valores
CREATE SEQUENCE seq_prod
START WITH 1
INCREMENT BY 1; -- se va incrementando de 1 en 1

INSERT INTO prod_seq_nuevos VALUES(seq_prod.NEXTVAL,'Bicicleta'); -- a este le asignara el 1
INSERT INTO prod_seq_nuevos VALUES(seq_prod.NEXTVAL,'Balón'); -- a este le asignara el 2
INSERT INTO prod_seq_nuevos VALUES(seq_prod.NEXTVAL,'Cocinita'); -- a este le asignara el 3
INSERT INTO prod_seq_nuevos VALUES(seq_prod.NEXTVAL,'Muñeca'); -- a este le asignara el 4

INSERT INTO prod_seq_viejos VALUES(seq_prod.NEXTVAL,'Bicicleta'); -- a este le asignara el 5
INSERT INTO prod_seq_viejos VALUES(seq_prod.NEXTVAL,'Balón'); -- a este le asignara el 6
INSERT INTO prod_seq_viejos VALUES(seq_prod.NEXTVAL,'Cocinita'); -- a este le asignara el 7
INSERT INTO prod_seq_viejos VALUES(seq_prod.NEXTVAL,'Muñeca'); -- a este le asignara el 8

-- si los insert de ambas tablas estuvieran intercalados seguirian el orden por lo que la primera podria ser
-- con los numeros 1, 4, 6 por ejemplo

DROP TABLE prod_sep_nuevos;
DROP TABLE prod_sep_viejos; -- drops para hacer pruebas [no hacer caso]

DROP SEQUENCE seq_prod; -- así se borran las sequencias

-- Creamos una sequencia que se use para decrementar en vez de incrementar
CREATE SEQUENCE seq_prod2
START WITH 50
INCREMENT BY -10
MAXVALUE 200; -- indica el valor máximo (se puede usar también con positivos)

-- una sequence una vez creada de puede alterar
ALTER SEQUENCE seq_prod -- miralo

--------------------------------------------------------------------------------------------------------
-- UPDATE

CREATE TABLE prod_nuevos (
    cod NUMBER(5) PRIMARY KEY, 
    nombre VARCHAR2(30),
    descripcion VARCHAR2(200)
);

INSERT INTO prod_nuevos VALUES (1,'falda','Descripción de falda');
INSERT INTO prod_nuevos VALUES (2,'pantalón','Descripción de pantalón');
INSERT INTO prod_nuevos VALUES (3,'camisa','Descripción de camisa');
INSERT INTO prod_nuevos VALUES (4,'zapatos','Descripción de zapatos');
INSERT INTO prod_nuevos VALUES (5,'bolso','Descripción de bolso');
INSERT INTO prod_nuevos VALUES (6,'blusa','Descripción de blusa');

-- Así se hace un update de más de un campo
UPDATE prod_nuevos SET (nombre = 'camiseta', descripcion = 'Descripción de camiseta')
WHERE LOWER (nombre LIKE 'camisa'); -- cambiamos camisa por camiseta

------------------------------------------------------------------------------------------------------
-- * DELETE
-- borra filas enteras

DELETE FROM prod_nuevos; -- elimina todas las filas insertadas anteriormente

DELETE FROM prod_nuevos WHERE LOWER (nombre LIKE 'camisa' OR nombre LIKE 'pantalón'); -- delete condicionado

------------------------------------------------------------------------------------------------------
-- se crea un usuario llamado EDITORIALES

-- ! esta parte la ha dado ella (es un script que esta en el campus virtual)
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
-- ! hasta aquí

------------------------------------------------------------------------------------
-- * SELECT

SELECT * FROM LIBROS; -- el asterisco es que coge todas las columnas de la tabla

SELECT NOMBRE, PRECIO FROM LIBROS; -- se seleccionan solo las columnas de nombre y precio de la tabla

SELECT NOMBRE AS NOM, PRECIO FROM LIBROS; -- el AS es que le pone pseudonimo a la columna nombre