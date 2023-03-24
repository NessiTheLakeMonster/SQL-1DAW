-- para eliminar las tablas
drop table DETALLES_PEDIDO;
drop table PEDIDO;
drop table USUARIO;
drop table PRODUCTO;

--creamos la tabla usuarios
create table USUARIO (
  id_usu number(10) primary key,
  nombre varchar2(30) not null ,
  ap1 varchar2(30) not null ,
  ap2 varchar2(30),
  email varchar2(20) not null ,
  contrasenia varchar2(20) not null
);

--creamos la tabla productos
create table PRODUCTO(
  id_producto number(10) primary key,
  nombre varchar2(30) not null ,
  descripcion varchar2(300),
  precio number(10,2)not null ,
  stock number(10) not null
);

-- creamos la tabla pedido, que al ser una relacion 1:n la CP de
-- la tabla con 1,1 en este caso usuario se va a la tabla 1,n
create table PEDIDO(
  id_pedido number(10) generated always as identity primary key,
  fecha date not null ,
  id_usuario number(10),
  total number(10,2) not null ,
  foreign key (id_usuario) references USUARIO(id_usu)
);
-- creamos la tabla detalles_pedido que al igual que la anterior tiene
-- 2 claves foraneas por la relacion 1:N
create table DETALLES_PEDIDO(
  id_detalles number generated always as identity primary key,
  id_producto number(10),
  id_pedido number(10),
  cantidad number(10) not null ,
  subtotal number(10,2) not null ,
  foreign key (id_producto) references PRODUCTO(id_producto),
  foreign key (id_pedido) references PEDIDO(id_pedido)
);

-- insertamos campos en la tabla usuarios
INSERT INTO USUARIO
VALUES(1, 'Juan', 'Pérez', 'García', 'juan.perez@gmail.com', 'contrasena1');
INSERT INTO USUARIO
values (2, 'María', 'González', 'Sánchez', 'maria.gonz@gmail.com', 'contrasena2');
INSERT INTO USUARIO
values (3, 'Pedro', 'Ruiz', 'Gómez', 'pedro.ruiz@gmail.com', 'contrasena3');
insert into USUARIO
values (4, 'Laura', 'Sánchez', 'Rodríguez', 'laura.sanz@gmail.com', 'contrasena4');
insert into USUARIO
values (5, 'Antonio', 'Martínez', 'López', 'anto.marnz@gmail.com', 'contrasena5');

-- insertamos campos en la tabla productos
insert into PRODUCTO
values (1, 'portatil asus tuf gaming 420og', 'portatil de ultima generacion', 1240.69, 10);
insert into PRODUCTO
values (2, 'procesador intel i11 21872F', '', 10777.88, 100);
insert into PRODUCTO
values (3, 'tarjeta grafica nvudia mbx1991', 'Grafica de ultima version para la maxima potencia', 1111.22, 35);
insert into PRODUCTO (id_producto, nombre, precio, stock)
values (4, 'tarjeta grafica mda 5777rx',999.11, 27);
insert into PRODUCTO (id_producto, nombre, precio, stock)
values (5, 'teclado mecanico', 69.20, 16);

-- insertamos campos en la tabla pedidos
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('10/10/2021', 1, 154.50);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('12/10/2021', 3, 322.80);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('14/10/2021', 2, 987.00);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('15/10/2021', 5, 245.75);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('16/10/2021', 4, 75.30);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('17/10/2021', 1, 210.00);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('19/10/2021', 3, 512.40);
INSERT INTO PEDIDO (fecha, id_usuario, total) VALUES ('20/10/2021', 5, 175.60);

-- insertamos campos en la tabbla detalles de pedido
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (1, 1, 2, 2481.00);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (2, 1, 1, 10777.88);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (3, 2, 3, 3333.66);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (1, 2, 1, 620.25);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (4, 3, 2, 1998.22);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (5, 3, 3, 207.00);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (3, 4, 1, 1111.22);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (4, 4, 1, 999.11);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (1, 5, 1, 620.25);
INSERT INTO DETALLES_PEDIDO (id_producto, id_pedido, cantidad, subtotal) VALUES (5, 5, 2, 138.80);

-- ejercicios de selects planteados

-- ejercicio 1
-- Seleccionar el nombre del usuario y la fecha del pedido para todos los pedidos que tengan un total mayor o igual a 100 euros:
select USUARIO.nombre, PEDIDO.fecha
from USUARIO join  PEDIDO
on USUARIO.id_usu = PEDIDO.id_usuario
where PEDIDO.total >= 100;

-- ejercicio 2
-- Seleccionar el nombre, apellido y correo electrónico de todos los usuarios que no hayan realizado ningún pedido:
select USUARIO.nombre, USUARIO.ap1, USUARIO.ap2, USUARIO.email, PEDIDO.id_usuario
from USUARIO left join PEDIDO
on USUARIO.id_usu = PEDIDO.id_usuario
where PEDIDO.id_pedido is null;

select USUARIO.nombre, USUARIO.ap1, USUARIO.ap2, USUARIO.email
from USUARIO join PEDIDO
on USUARIO.id_usu = PEDIDO.id_usuario
minus
select USUARIO.nombre, USUARIO.ap1, USUARIO.ap2, USUARIO.email, PEDIDO.id_usuario
from PEDIDO join USUARIO
on PEDIDO.id_usuario = USUARIO.id_usu;

-- ejercicio 3 Seleccionar el nombre del producto y su precio para todos los productos que tengan un precio mayor a 500 euros y un stock mayor a 5 unidades:
-- ejercicio 4 Seleccionar el nombre del usuario y el total de cada pedido, ordenados por fecha de forma descendente:
-- ejercicio 5 Actualizar la contraseña del usuario con ID 5 a "dawVirgendeGracia":