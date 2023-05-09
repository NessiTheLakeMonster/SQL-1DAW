--* ACT 15

--! Script de Alicia
CREATE TABLE Actores (
	Código number(4),
	Nombre VARCHAR(50) NOT NULL,
	F_nacimiento DATE default sysdate NOT NULL,
	Nacionalidad VARCHAR(25)DEFAULT 'España' NOT NULL ,
	CONSTRAINT pk_actores PRIMARY KEY (Código),
  constraint uk_actores unique(nombre)
 );
 CREATE TABLE Películas (
	Código number(4),
	Título VARCHAR(50) NOT NULL,
	Fecha DATE NOT NULL,
	Presupuesto number(8,2) NOT NULL,
	CONSTRAINT pk_peliculas PRIMARY KEY (Código)
   );

 CREATE TABLE Reparto (
	C_actor number(4),
	C_pelicula number(4),
	CONSTRAINT pk_reparto PRIMARY KEY (C_actor, C_pelicula),
	CONSTRAINT fk_act FOREIGN KEY (C_actor) REFERENCES Actores(Código)
	ON DELETE CASCADE,
	CONSTRAINT fk_pel FOREIGN KEY (C_pelicula) REFERENCES Películas(Código)
	ON DELETE CASCADE 
 );

INSERT INTO Actores VALUES (1, 'Paco Le�n', '10/04/1974', DEFAULT);
INSERT INTO Actores VALUES(2, 'Antonio Banderas', '10/08/1968', DEFAULT);
INSERT INTO Actores VALUES (3, 'Fernando Tejero', '24/02/1967', DEFAULT);
INSERT INTO Actores VALUES(4, 'Alfredo Landa', '04/03/1933', DEFAULT);
INSERT INTO Actores VALUES(5, 'Antonio Resines', '07/08/1954', DEFAULT); 
INSERT INTO Actores VALUES(6, 'Luis Merlo', '13/06/1966', DEFAULT);
INSERT INTO Actores VALUES (7, 'Imanol Arias', '26/04/1956', DEFAULT);
INSERT INTO Pel�culas VALUES (1, 'Embarazada', '01/01/2015', 50);
INSERT INTO Pel�culas VALUES (2, '3 bodas de m�s', '01/01/2013', 20);
INSERT INTO Pel�culas VALUES (3, 'Los m�nagers', '01/01/2006', 21);
INSERT INTO Pel�culas VALUES (4, 'Cr�nica de un enga�o', '01/01/2010', 15);
INSERT INTO Pel�culas VALUES (5, 'Gato con botas', '01/01/2011', 25);
INSERT INTO Pel�culas VALUES(6, 'Santos inocentes', '01/01/1984', 12);
INSERT INTO Pel�culas VALUES(7, 'La flor de mi secreto', '01/01/1995', 4);
INSERT INTO Pel�culas VALUES (8, 'La Corea', '01/01/1976', 5);
INSERT INTO Reparto VALUES (1, 1);
INSERT INTO Reparto VALUES(1,2);
INSERT INTO Reparto VALUES (1,3);
INSERT INTO Reparto VALUES (2,4);
INSERT INTO Reparto VALUES (2,5);
INSERT INTO Reparto VALUES (3, 1);
INSERT INTO Reparto VALUES (3, 5);
INSERT INTO Reparto VALUES (4, 6);
INSERT INTO Reparto VALUES (7, 7);
INSERT INTO Reparto VALUES (7,8);
--! Fin del script

------------------------------------------------------------------------------------
--? 2.- Actores cuyo nombre empieza por A.
SELECT NOMBRE FROM ACTORES
    WHERE UPPER(NOMBRE) LIKE 'A%';

--? 3.- Actores con fecha de nacimiento entre 1954 y 1968.
SELECT NOMBRE, F_NACIMIENTO
FROM ACTORES
    WHERE SUBSTR(TO_CHAR(ACTORES.F_NACIMIENTO, 'YY'),1,2) BETWEEN '54' AND '68';

--? 4.- T�tulos de pel�culas con Paco Le�n.
SELECT PEL�CULAS.T�TULO
FROM ACTORES JOIN REPARTO
ON ACTORES.C�DIGO = REPARTO.C_ACTOR
JOIN PEL�CULAS
ON REPARTO.C_PELICULA = PEL�CULAS.C�DIGO
    WHERE UPPER(ACTORES.NOMBRE) LIKE 'PACO LE�N';

--? 5.- Nombre de actor y n� de pel�culas en que participa.
SELECT ACTORES.NOMBRE, COUNT(*) AS TOTAL_PELICULAS
FROM ACTORES JOIN REPARTO
ON ACTORES.CÓDIGO = REPARTO.C_ACTOR
JOIN PELÍCULAS
ON REPARTO.C_PELICULA = PELÍCULAS.CÓDIGO
GROUP BY ACTORES.NOMBRE;

--? 6.- N� de pel�culas de Alfredo Landa e Imanol Arias.
SELECT ACTORES.NOMBRE, COUNT(*)
FROM ACTORES JOIN REPARTO
ON ACTORES.CÓDIGO = REPARTO.C_ACTOR
JOIN PELÍCULAS
ON REPARTO.C_PELICULA = PELÍCULAS.CÓDIGO
GROUP BY ACTORES.NOMBRE
    HAVING UPPER(ACTORES.NOMBRE) IN('ALFREDO LANDA','IMANOL ARIAS');

--? 7.- Nombre de actores sin pel�cula.
SELECT NOMBRE
FROM ACTORES WHERE NOMBRE NOT IN (SELECT ACTORES.NOMBRE
    FROM ACTORES JOIN REPARTO
    ON ACTORES.C�DIGO = REPARTO.C_ACTOR
    JOIN PEL�CULAS
    ON REPARTO.C_PELICULA = PEL�CULAS.C�DIGO); 

--? 8.- Actor + presupuesto de todas sus pel�culas.
SELECT ACTORES.NOMBRE, SUM(PEL�CULAS.PRESUPUESTO) AS TOTAL_PRESUPUESTO
FROM ACTORES JOIN REPARTO
ON ACTORES.C�DIGO = REPARTO.C_ACTOR
JOIN PEL�CULAS
ON REPARTO.C_PELICULA = PEL�CULAS.C�DIGO
GROUP BY ACTORES.NOMBRE;

--? 9.- Nombre actores, c�digo, t�tulo y a�o de pel�cula entre 1976 y 1995.
SELECT ACTORES.NOMBRE, PEL�CULAS.C�DIGO, PEL�CULAS.T�TULO, PEL�CULAS.FECHA
FROM ACTORES JOIN REPARTO
ON ACTORES.C�DIGO = REPARTO.C_ACTOR
JOIN PEL�CULAS
ON REPARTO.C_PELICULA = PEL�CULAS.C�DIGO
    WHERE SUBSTR(TO_CHAR(PEL�CULAS.FECHA, 'YY'),1,2) BETWEEN '76' AND '95';

--? 10.- Nombre actores y n� de pel�culas de los que tengan m�s de dos.
SELECT ACTORES.NOMBRE, 

--? 11.- Actualiza fecha de nacimiento de Paco Le�n a 6/11/1974.
UPDATE ACTORES
SET F_NACIMIENTO = '6/11/1974'
WHERE UPPER(NOMBRE) LIKE 'PACO LE�N';

--? 12.- Actualiza a�o de �Los M�nagers� al 1/1/2005.
UPDATE PEL�CULAS
SET FECHA = '1/1/2005'
WHERE UPPER(T�TULO) LIKE 'LOS M�NAGERS';

--? 13.- Incrementar presupuestos en 10%.
UPDATE PEL�CULAS
SET PRESUPUESTO = (PRESUPUESTO - (PRESUPUESTO * 0.1));