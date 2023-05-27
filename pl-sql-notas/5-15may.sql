-- sesion 15 de mayo 

-- DISPARADORES

-- TXT FRAN
--Esto se hace en EDITORIAL
CREATE TABLE CONTROL2(
    USUARIO VARCHAR2(30),
    FECHA TIMESTAMP,
    DESCRIP VARCHAR2(100)
);

--Disparador de insert
CREATE OR REPLACE TRIGGER tr_nuevosLibros
AFTER 
INSERT 
ON LIBROS
BEGIN
    INSERT INTO control2 values(user,sysdate,'NUEVO LIBRO');
END tr_nuevosLibros;
--Despues de realizar el insert de abajo metete en la tabla control 2 y en datos te saldrá toda la información
INSERT INTO libros VALUES(111,'MI LIBRO','ALICIA',2,500);

--Disparador de update
CREATE OR REPLACE TRIGGER tr_modificaLibros
AFTER 
UPDATE 
OF PRECIO
ON LIBROS
FOR EACH ROW
BEGIN
    INSERT INTO control2 values(user,sysdate,'NUEVO LIBRO');
END tr_modificaLibros;

UPDATE LIBROS SET PRECIO=PRECIO+10 WHERE PRECIO>50;

--Disparador de borrado error
--Salta error solo puede hacer disparadores de vistas de tablas enteras no
CREATE OR REPLACE TRIGGER tr_borrarLibros
INSTEAD OF
DELETE 
ON LIBROS
BEGIN
    INSERT INTO control2 values(user,sysdate,'NUEVO LIBRO');
END tr_borrarLibros;

DELETE FROM LIBROS;

--Disparador de borrado
CREATE OR REPLACE VIEW VISTA1 AS SELECT CODIGO,NOMBRE,AUTOR,COD_EDIT,PRECIO 
FROM LIBROS WHERE PRECIO>50;

CREATE OR REPLACE TRIGGER tr_borrarLibros
INSTEAD OF
DELETE 
ON VISTA1
BEGIN
    INSERT INTO control2 values(user,sysdate,'NUEVO LIBRO');
END tr_borrarLibros;

DELETE FROM LIBROS;

--Disparador after
CREATE OR REPLACE TRIGGER tr_LIBRO
AFTER
DELETE OR INSERT OR UPDATE 
ON LIBROS
BEGIN
    IF inserting THEN
        INSERT INTO CONTROL2 values(user,sysdate,'INSERTANDO');
    ELSE IF deleting THEN
        INSERT INTO CONTROL2 values(user,sysdate,'BORRANDO');
    ELSE 
        INSERT INTO CONTROL2 values(user,sysdate,'MODIFICA');
    END IF;
    END IF;
END tr_LIBRO;

INSERT INTO LIBROS VALUES(50,'PRUEBA INSERT','FRANCISCO',5,100);
UPDATE LIBROS SET NOMBRE='DONDE LOS ARBOLES CANTAN' WHERE NOMBRE='PRUEBA INSERT';

CREATE TABLE PIEZAS(
    TIPO NUMBER(3),
    MODELO VARCHAR2(30),
    PRECIO NUMBER(5,2),
    PRIMARY KEY(TIPO,MODELO)
);

INSERT INTO PIEZAS VALUES(1,'TUERCA',2);
INSERT INTO PIEZAS VALUES(2,'TUERCA',3);
INSERT INTO PIEZAS VALUES(3,'TUERCA',2);
INSERT INTO PIEZAS VALUES(4,'TORNILLO',2);
INSERT INTO PIEZAS VALUES(5,'TORNILLO',1);

CREATE TABLE ControlPrePieza(
    PRECIO_VIEJO NUMBER(5,2),
    PRECIO_NUEVO NUMBER(5,2),
    TIPO NUMBER(3),
    MODELO VARCHAR2(30),
    FECHA TIMESTAMP
);

--Disparador para poder realizar un control del cambio de precio de las piezas con el OLD Y EL NEW
CREATE OR REPLACE VIEW VISTA2 AS SELECT PRECIO_VIEJO,PRECIO_NUEVO,TIPO,MODELO,FECHA
FROM ControlPrePieza;

CREATE OR REPLACE TRIGGER tr_precioPieza
AFTER
UPDATE 
OF PRECIO
ON PIEZAS
FOR EACH ROW
BEGIN
    INSERT INTO ControlPrePieza values(:OLD.PRECIO,:NEW.PRECIO,:OLD.TIPO,:OLD.MODELO,SYSDATE);
END tr_precioPieza;

UPDATE PIEZAS SET PRECIO=PRECIO+1;
-- FIN TXT

-- EJERCICIO 16 MAYO

-- todos los libros que cuesten mas de 30 € le vamos a subir 60 €
-- programamos un disparador que controle si el precio del libro superan 70 € 
-- y lo registre
-- realiza una tabla de control de 5 campos codigo del libro, precio viejo, 
-- precio nuevo, usuario y fecha de subida del precio
drop table control_libros; 

create table control_libros (
    cod_libro number(3),
    precio_viejo number(4),
    precio_nuevo number(4),
    usuario varchar2(30),
    fecha_subida timestamp
);

create or replace trigger tr_subida_libros
before
update
of precio
on libros
for each row
when ((old.precio + 60) > 70)
begin
    insert into control_libros values(:old.codigo,:old.precio,:new.precio,user,sysdate);
end tr_subida_libros;

update libros set precio = precio + 60 where precio > 30;


