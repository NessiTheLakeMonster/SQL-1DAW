drop table alquiler;
drop table inventario;
drop table socio;
drop table videojuego;

create table socio (
  id_socio number(4) primary key ,
  dni varchar2(12) unique,
  nombre varchar2(30),
  apellido1 varchar2(30),
  fecha_nac date
);

insert into socio values (1, '11111A', 'Ana', 'Sanchez', '12/12/2001');
insert into socio values (2, '22222B', 'Pepe', 'Fernandez', '02/03/2001');
insert into socio values (3, '33333C', 'Angela', 'Ramirez', '03/06/1999');
insert into socio values (4, '44444D', 'Juan', 'Camacho', '11/07/2003');
insert into socio values (5, '55555E', 'Luis', 'Gutierrez', '07/01/1994');

create table videojuego (
  id_videojuego number(4) primary key,
  titulo varchar2(30) not null,
  saga varchar2(30),
  distribuidora varchar2(30),
  fecha_lanzamiento date,
  genero varchar2(30)
);

insert into videojuego values (101, 'Hades', null, 'Supergiant Games', '12/07/2020', 'Roguelike');
insert into videojuego values (102, 'Octopath Traveler 1', 'Octopath Traveler', 'Square Enix', '23/08/2018', 'JRPG');
insert into videojuego values (103, 'Ori and the blind forest', 'Ori','Moon Studios', '04/01/2016', 'Metroidvania');
insert into videojuego values (104, 'Have a nice death', null,'Magic Design Studios','22/03/2023','Roguelike');
insert into videojuego values (105, 'Assasins Creed 2', 'Assasins Creed','Ubisoft','12/07/2020','RPG');
insert into videojuego values (106, 'Grand Theft Auto V','Grand Theft Auto','Rockstar Games','17/10/2013','RPG');
insert into videojuego values (107, 'Persona 5 Royal','Persona','Atlus','08/11/2016','JRPG');
insert into videojuego values (108, 'Minecraft', null, 'Mojang', '07/05/2009','Sandbox');
insert into videojuego values (109, 'Fifa 13','Fifa','EA', '01/01/2013','Simulador de Deportes');

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

insert into alquiler values (1, 103, 1, '12/03/2023', '24/03/2023', 4.90);
insert into alquiler values (2, 101, 3, '14/03/2023', '31/03/2023', 5.90);
insert into alquiler values (3, 105, 5, '13/03/2023', '26/03/2023', 6.90);
insert into alquiler values (4, 107, 1, '11/03/2023', '21/03/2023', 5.90);
insert into alquiler values (5, 104, 2, '02/03/2023', '16/03/2023', 3.90);
insert into alquiler values (6, 101, 4, '06/03/2023', '20/03/2023', 4.90);
insert into alquiler values (7, 106, 5, '18/03/2023', '25/03/2023', 6.90);
insert into alquiler values (8, 102, 3, '17/03/2023', '29/03/2023', 7.90);
insert into alquiler values (9, 101, 4, '20/03/2023', '30/03/2023', 4.90);
insert into alquiler values (10, 107, 5, '05/03/2023', '18/03/2023', 7.90);

create table inventario (
  id_inventario number(4) primary key,
  id_videojuego number(4),
  cant_disponible number(5),
  cant_reparacion number(5),
  cant_prestamo number(5),
  fecha_ultima_actualizacion date,
  foreign key (id_videojuego) references videojuego(id_videojuego)
);

insert into inventario values (1001, 101, 12, 0, 11, sysdate);
insert into inventario values (1002, 102, 13, 8, 5, sysdate);
insert into inventario values (1003, 103, 10, 2, 7, sysdate);
insert into inventario values (1004, 104, 23, 0, 10, sysdate);
insert into inventario values (1005, 105, 45, 4, 5, sysdate);
insert into inventario values (1006, 106, 34, 5, 2, sysdate);
insert into inventario values (1007, 107, 13, 1, 3, sysdate);
insert into inventario values (1008, 108, 20, 3, 9, sysdate);
insert into inventario values (1009, 109, 0, 0, 0, sysdate);

-- EJERCICIOS DE LAS SELECTS --------------------------------------------------------------------------

-- 1. Socios que han alquilado juegos que no pertenecen a ninguna saga

-- 2. Que videojuegos no se han alquilado nunca

-- 3. Queremos saber cuanto se ha gastado en total cada persona ordenados de menor a mayor

-- 4. Personas que han alquilado videojuegos que tienen unidades en reparacion

-- 5. Cuales son los videojuegos disponibles para alguilar a fecha de hoy, ordenados de mayor a menor

-- SELECTS opcionales (si nos las quieres hacer borralas :) y luego paso solucion)

-- 6. Nombre y apellido de los socios que han alquilado un juego en los ultimos 7 dias
--    (si no se puede usar sysdate porque no sale nada se usa '22/03/2023')

-- 7. Cuales son los generos mas alquilados, ordenados de mayor a menor