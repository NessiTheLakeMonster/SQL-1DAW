-- 17 Febrero

----------------------
CREATE TABLE Primer_plato (
    cod NUMBER(3) PRIMARY KEY,
    nombre VARCHAR2(30),
    precio NUMBER(5, 2)
);

CREATE TABLE Segundo_plato (
    cod NUMBER(3) PRIMARY KEY,
    nombre VARCHAR2(30),
    precio NUMBER(5, 2)
);

CREATE TABLE Postre(
    cod NUMBER(3) PRIMARY KEY,
    nombre VARCHAR2(30),
    precio NUMBER(5, 2)
);

INSERT INTO Primer_plato VALUES (1, 'cocido', 5);
INSERT INTO Primer_plato VALUES (2, 'paella', 2);
INSERT INTO Primer_plato VALUES (3, 'sopa', 6);


INSERT INTO Segundo_plato VALUES (1, 'filete', 2);
INSERT INTO Segundo_plato VALUES (2, 'sardinas', 3);

INSERT INTO Postre VALUES (1, 'flan', 6);
INSERT INTO Postre VALUES (2, 'natillas',3);
INSERT INTO Postre VALUES (3, 'helado', 6);
INSERT INTO Postre VALUES (4, 'helado', 12);
INSERT INTO Postre VALUES (4, 'helado', 12);
----------------------

-- SELECTS

-- Seleccionar todos los campos de una tabla

SELECT * FROM Primer_plato;

-- Seleccionar todos los campos de varias tablas

SELECT nombre, precio FROM Primer_plato;
SELECT * FROM Primer_plato, Segundo_plato;

--  Seleccionar campos con el mismo nombre en distintas tablas

SELECT Primer_plato.nombre, Segundo_plato.nombre FROM Primer_plato, Segundo_plato;

-- Uso de alias

SELECT Primer_plato.nombre AS nom_PrimerPlato, Segundo_plato.nombre AS nom_SegundoPlato FROM Primer_plato, Segundo_plato;

SELECT Primer_plato.nombre AS nom_PrimerPlato, 
Segundo_plato.nombre, AS nom_SegundoPlato, 
Postre.nombre AS nom_Postre 
FROM Primer_plato, Segundo_plato, Postre;

-- Usar operaciones aritmeticas dentro de un SELECT.
SELECT Primer_plato.nombre AS nom_PrimerPlato, 
Segundo_plato.nombre, AS nom_SegundoPlato, 
Postre.nombre AS nom_Postre,
Primer_plato.precio + Segundo_plato.precio + Postre.precio AS total
FROM Primer_plato, Segundo_plato, Postre;

-- DISTINCT: No mostrar valores duplicados

SELECT DISTINCT nombre FROM Postre; -- Sacaria tres filas, ya que nombre se repite.
SELECT DISTINCT nombre, precio FROM Postre; -- Sacaria cuatro filas, ya que la combinacion de las dos no se repite

-- ROWNUM: Saca el numero de la fila como un campo mas. Se usa para utilizar WHERE despues, sacando un numero especifico de filas.

SELECT ROWNUM, nombre, precio FROM Postre WHERE ROWNUM <= 2;
SELECT nombre FROM Postre WHERE ROWNUM <= 2;

--------------------------------------------------------------------------------------

ALTER TABLE DEPART ADD PRIMARY KEY (DEPT_NO);
ALTER TABLE EMPLE ADD FOREIGN KEY (DEPT_NO) REFERENCES DEPART(DEPT_NO);

SELECT APELLIDO, FECHA_ALT, SALARIO FROM EMPLE;

SELECT DEPT_NO, LOC FROM DEPART;

-- ORDENAR CAMPOS EN SELECT

SELECT apellido, oficio, salario FROM Emple; -- Desordenado
SELECT apellido, oficio, salario FROM Emple ORDER BY oficio; -- Se ordenan todos los oficios.
SELECT apellido, oficio, salario FROM Emple ORDER BY oficio DESC; -- Se ordenan todos los oficios desde la Z.

SELECT apellido, oficio, salario FROM Emple ORDER BY oficio DESC, salario DESC; -- Se puede ordenar por varios campos, de forma descendente o ascendente en ambas.

SELECT apellido, fecha_alt, salario FROM EMPLE ORDER BY apellido DESC;
SELECT oficio, apellido, fecha_alt, salario FROM EMPLE ORDER BY oficio, apellido DESC;

-- Uso del WHERE

SELECT apellido, fecha_alt, salario FROM EMPLE WHERE LOWER(oficio) LIKE 'vendedor' ORDER BY apellido;

SELECT emp_no, apellido, oficio, dept_no FROM Emple WHERE dept_no LIKE 20 ORDER BY apellido;

SELECT * FROM EMPLE WHERE UPPER(oficio) LIKE 'ANALISTA' ORDER BY dept_no;

SELECT * FROM EMPLE WHERE dept_no LIKE 10 AND lower(oficio) LIKE 'analista' ORDER BY apellido DESC, emp_no DESC;