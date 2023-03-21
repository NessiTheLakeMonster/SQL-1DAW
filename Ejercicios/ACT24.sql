-- SELECTS LIBRES

create table socio (
  id_socio number(4) primary key ,
  dni varchar2(12) unique,
  nombre varchar2(30),
  apellido1 varchar2(30),
  fecha_nac date
);

insert into socio values (1, '11111A', 'Ana', 'Sanchez', 12/12/2001);
insert into socio values (2, '22222B', 'Pepe', 'Fernandez', 02/03/2001);
insert into socio values (3, '33333C', 'Angela', 'Ramirez', 03/06/1999);
insert into socio values (4, '44444D', 'Juan', 'Camacho', 11/07/2003);
insert into socio values (5, '44444D', 'Luis', 'Gutierrez', 07/01/1994);

create table videojuego (
  id_videojuego number(4) primary key,
  titulo varchar2(30) not null,
  saga varchar2(30),
  distribuidora varchar2(30),
  fecha_lanzamiento date,
  genero varchar2(30)
);

insert into videojuego values (101, 'Hades', null, 'Supergiant Games', 12/07/2020, 'Roguelike');
insert into videojuego values (102, 'Octopath Traveler 1', 'Octopath Traveler', 'Square Enix', 23/08/2018, 'JRPG');
insert into videojuego values (103, 'Ori and the blind forest', 'Ori','Moon Studios', 04/01/2016, 'Metroidvania');
insert into videojuego values (104, 'Have a nice death', null,'Magic Design Studios',22/03/2023,'Roguelike');
insert into videojuego values (105, 'Assasins Creed 2', 'Assasins Creed','Ubisoft',12/07/2020,'RPG');
insert into videojuego values (106, 'Grand Theft Auto V','Grand Theft Auto','Rockstar Games',17/10/2013,'RPG');
insert into videojuego values (107, 'Persona 5 Royal','Persona','Atlus',08/11/2016,'JRPG');
insert into videojuego values (108, 'Minecraft', null, 'Mojang', 07/05/2009,'Sandbox');
insert into videojuego values (109, 'Fifa 13','Fifa','EA', 01/01/2013,'Simulador de Deportes');

create table alquiler (
  id_alquiler number(4) primary key,
  id_videojuego number(4),
  id_socio number(4),
  fecha_inicio date,
  fecha_fin date,
  precio number(3,2),
  foreign key (id_socio) references socio(id_socio),
  foreign key  (id_videojuego) references videojuego(id_videojuego)
);

insert into alquiler values (1, 103, 1, 12/03/2023, 24/03/2023, 4.90);
insert into alquiler values (2, 101, 3, 14/03/2023, 31/03/2023, 5.90);
insert into alquiler values (3, 105, 5, 13/03/2023, 26/03/2023, 6.90);
insert into alquiler values (4, 107, 1, 11/03/2023, 21/03/2023, 5.90);
insert into alquiler values (5, 104, 2, 02/03/2023, 16/03/2023, 3.90);
insert into alquiler values (6, 101, 4, 06/03/2023, 20/03/2023, 4.90);
insert into alquiler values (7, 106, 5, 18/03/2023, 25/03/2023, 6.90);
insert into alquiler values (8, 102, 3, 17/03/2023, 29/03/2023, 7.90);
insert into alquiler values (9, 101, 4, 20/03/2023, 30/03/2023, 4.90);
insert into alquiler values (10, 107, 5, 05/03/2023, 18/03/2023, 7.90);

create table inventario (
  id_inventario number(4) primary key,
  id_videojuego number(4),
  cant_disponible number(5),
  cant_reparacion number(5),
  cant_prestamo number(5),
  fecha_ultima_actualizacion date,
  foreign key (id_videojuego) references videojuego(id_videojuego)
);

insert into inventario values (1001, 1, 12, 0, 2, sysdate);
insert into inventario values (1002, 1, 12, 0, 2, sysdate);
insert into inventario values (1003, 1, 12, 0, 2, sysdate);
insert into inventario values (1004, 1, 12, 0, 2, sysdate);


-- EJERCICIOS DE LAS SELECTS

-- 1. Socios que han alquilado juegos que no pertenecen a ninguna saga

-- 2. Que videojuegos no se han alquilado nunca