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
INSERT INTO Actores VALUES (1, 'Paco León', '10/04/1974', DEFAULT);
INSERT INTO Actores VALUES(2, 'Antonio Banderas', '10/08/1968', DEFAULT);
INSERT INTO Actores VALUES (3, 'Fernando Tejero', '24/02/1967', DEFAULT);
INSERT INTO Actores VALUES(4, 'Alfredo Landa', '04/03/1933', DEFAULT);
INSERT INTO Actores VALUES(5, 'Antonio Resines', '07/08/1954', DEFAULT); 
INSERT INTO Actores VALUES(6, 'Luis Merlo', '13/06/1966', DEFAULT);
INSERT INTO Actores VALUES (7, 'Imanol Arias', '26/04/1956', DEFAULT);
INSERT INTO Películas VALUES (1, 'Embarazada', '01/01/2015', 50);
INSERT INTO Películas VALUES (2, '3 bodas de más', '01/01/2013', 20);
INSERT INTO Películas VALUES (3, 'Los mánagers', '01/01/2006', 21);
INSERT INTO Películas VALUES (4, 'Crónica de un engaño', '01/01/2010', 15);
INSERT INTO Películas VALUES (5, 'Gato con botas', '01/01/2011', 25);
INSERT INTO Películas VALUES(6, 'Santos inocentes', '01/01/1984', 12);
INSERT INTO Películas VALUES(7, 'La flor de mi secreto', '01/01/1995', 4);
INSERT INTO Películas VALUES (8, 'La Corea', '01/01/1976', 5);
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

--? 3.- Actores con fecha de nacimiento entre 1954 y 1968.

--? 4.- Títulos de películas con Paco León.

--? 5.- Nombre de actor y nº de películas en que participa.

--? 6.- Nº de películas de Alfredo Landa e Imanol Arias.

--? 7.- Nombre de actores sin película.

--? 8.- Actor + presupuesto de todas sus películas.

--? 9.- Nombre actores, código, título y año de película entre 1976 y 1995.

--? 10.- Nombre actores y nº de películas de los que tengan más de dos.

--? 11.- Actualiza fecha de nacimiento de Paco León a 6/11/1974.

--? 12.- Actualiza año de ‘Los Mánagers’ al 1/1/2005.

--? 13.- Incrementar presupuestos en 10%.