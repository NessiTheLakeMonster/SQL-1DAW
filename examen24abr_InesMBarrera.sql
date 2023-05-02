-- Inés María Barrera Llerena 1º DAW

DROP TABLE PED_PROD;
DROP TABLE PEDIDO;
DROP TABLE PRODUCTO;
DROP TABLE CATEGORIA;
DROP TABLE REPARTIDOR;
DROP TABLE CLIENTE;
DROP TABLE ZONA;

--Las zonas de reparto son
CREATE TABLE ZONA(
    COD NUMBER(3) PRIMARY KEY,
    NOMBRE VARCHAR2(30)
);
INSERT INTO ZONA VALUES(1,'NORTE');
INSERT INTO ZONA VALUES(2,'SUR');
INSERT INTO ZONA VALUES(3, 'CENTRO');
--CLIENTES DE MI SUPERMERCADO ONLINE
CREATE TABLE CLIENTE(
    DNI VARCHAR2(12) PRIMARY KEY,
    NOMBRE VARCHAR2(30),
    PROFESION VARCHAR2(30),
    TFNO NUMBER(11),
    DIRECCION VARCHAR2(60),
    COD_ZONA NUMBER(3),
    FOREIGN KEY (COD_ZONA) REFERENCES ZONA(COD)
);
INSERT INTO CLIENTE VALUES('05912345N', 'ANTONIO', 'CONDUCTOR', 67565723, 'C/SOLEDAD 27 PUERTOLLANO', 1);
INSERT INTO CLIENTE VALUES('05942445S', 'Ana', 'ENFERMERA', 65565723, 'C/OLIVO 2 3?A PUERTOLLANO', 2);
INSERT INTO CLIENTE VALUES('05913425T', 'ANA', 'ENFERMERA', 68888723, 'C/APRISCO 44 2?B PUERTOLLANO', 1);
INSERT INTO CLIENTE VALUES('70913425W', 'FEDERICO', 'PROFESOR', 65555723, 'C/OLIVO 12 5?A PUERTOLLANO', 1);
INSERT INTO CLIENTE VALUES('03333333S', 'PEPE', 'ENFERMERA', 68888723, 'C/APRISCO 78 2?B PUERTOLLANO', 2);
INSERT INTO CLIENTE VALUES('05753254T', 'ana', 'PROFESORA', 67322723, 'C/GOYA 56 5?B PUERTOLLANO', 1);
INSERT INTO CLIENTE VALUES('02333235J', 'LUISA', 'ENFERMERA', 68888756, 'C/GOYA 56 2?B PUERTOLLANO', 2);
INSERT INTO CLIENTE VALUES('05334259T', 'PEDRO', 'ENFERMERO', 66544723, 'C/APRISCO 56 6?B ARGAMASILLA CVA', 3);
INSERT INTO CLIENTE VALUES('05900025K', 'JOSEFA', 'CONDUCTORA', 69999977, 'C/OURENSE 3 6?C PUERTOLLANO', 3);
INSERT INTO CLIENTE VALUES('05313525D', 'ANA', 'CONDUCTORA', 68845723, 'C/LARGA 45 1?B ARGAMASILLA CVA', 3);
--TABLA DE REPARTIDORES
CREATE TABLE REPARTIDOR(
    MATRICULA VARCHAR2(10) PRIMARY KEY,
    NOMBRE VARCHAR2(30),
    COD_ZONA NUMBER(3),
    FOREIGN KEY (COD_ZONA) REFERENCES ZONA(COD) 
);
INSERT INTO REPARTIDOR VALUES('1212BBR', '?NGELA', 1);
INSERT INTO REPARTIDOR VALUES('4532SSI', 'Sandra', 1);
INSERT INTO REPARTIDOR VALUES('5655TDD', 'ANA', 2);
INSERT INTO REPARTIDOR VALUES('8766VBV', 'ANTONIO', 3);
INSERT INTO REPARTIDOR VALUES('4444GGG', 'SOF?A', 3);
INSERT INTO REPARTIDOR VALUES('6555FFF', 'RUB?N', 3);

--PEDIDO QUE HACE UN CLIENTE Y REPARTE UN REPARTIDOR
CREATE TABLE PEDIDO(
    COD NUMBER(8) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FECHA DATE NOT NULL,
    COD_CLIENTE VARCHAR2(12),
    COD_REPARTIDOR VARCHAR2(10),
    FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE(DNI),
    FOREIGN KEY (COD_REPARTIDOR) REFERENCES REPARTIDOR(MATRICULA)
);
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('23/12/2022', 'DD/MM/YYYY'), '05912345N', '1212BBR');
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('23/12/2022', 'DD/MM/YYYY'), '05942445S', '4532SSI');
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('23/12/2022', 'DD/MM/YYYY'), '05912345N', '4532SSI');
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('23/12/2022', 'DD/MM/YYYY'), '05913425T', '4532SSI'); 
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('10/02/2022', 'DD/MM/YYYY'), '02333235J', '8766VBV'); 
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('12/08/2022', 'DD/MM/YYYY'), '02333235J', '8766VBV'); 
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('23/10/2022', 'DD/MM/YYYY'), '02333235J', '8766VBV'); 
INSERT INTO PEDIDO(FECHA, COD_CLIENTE, COD_REPARTIDOR)
VALUES (TO_DATE('25/09/2022', 'DD/MM/YYYY'), '02333235J', '6555FFF'); 

--Las categorias de los productos
CREATE TABLE CATEGORIA(
    COD_CATEGORIA VARCHAR2(10) PRIMARY KEY,
    NOMBRE VARCHAR2(30));
INSERT INTO CATEGORIA VALUES('PER', 'PERFUME');
INSERT INTO CATEGORIA VALUES('DUL', 'DULCE');
INSERT INTO CATEGORIA VALUES('REF', 'REFRESCO');

--PRODUCTOS QUE HAY EN EL SUPERMERCADO
CREATE TABLE PRODUCTO(
    COD NUMBER(8) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NOMBRE VARCHAR2(30),
    MARCA VARCHAR2(30),
    ORIGEN VARCHAR2(30),
    VOLUMEN NUMBER(7,2),
    PESO NUMBER(7,2),
    PRECIO NUMBER(7,2),
    CATEGORIA VARCHAR2(10),
    FOREIGN KEY (CATEGORIA) REFERENCES CATEGORIA(COD_CATEGORIA));
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('CHAMP?', 'MARCA1', 'ESPA?A', '50', '1', '20,4','PER');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('PERFUME', 'MARCA1', 'ESPA?A', '50', '3', '12,1', 'PER');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('GEL', 'MARCA2', 'FRANCIA', '40', '2', '18,34', 'PER');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('GALLETAS', 'MARCA1', 'ESPA?A', '30', '2', '12', 'DUL');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('CHOCOLATE', 'MARCA2', 'FRANCIA', '5', '0,5', '14,4', 'DUL');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('COCA COLA', 'MARCA1', 'ESPA?A', '2', '4', '5,2', 'REF');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('FANTA', 'MARCA1', 'ESPA?A', '5', '1', '7','REF');
INSERT INTO PRODUCTO(NOMBRE, MARCA, ORIGEN, VOLUMEN, PESO, PRECIO, CATEGORIA)
VALUES ('LECHE', 'MARCA1', 'ESPA?A', '3', '3', '6', 'REF');
--TABLA PEDIDO-PRODUCTO
CREATE TABLE PED_PROD(
    COD_PEDIDO NUMBER(8),
    COD_PRODUCTO NUMBER(8),
    CANTIDAD NUMBER(8),
    PRIMARY KEY (COD_PEDIDO, COD_PRODUCTO),
    FOREIGN KEY (COD_PEDIDO) REFERENCES PEDIDO(COD),
    FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(COD));
INSERT INTO PED_PROD VALUES(1,1,2);
INSERT INTO PED_PROD VALUES(1,2,1);
INSERT INTO PED_PROD VALUES(1,3,3);
INSERT INTO PED_PROD VALUES(1,4,1);
INSERT INTO PED_PROD VALUES(2,1,1);
INSERT INTO PED_PROD VALUES(2,3,1);
INSERT INTO PED_PROD VALUES(2,7,5);
INSERT INTO PED_PROD VALUES(2,8,4);
INSERT INTO PED_PROD VALUES(3,1,2);
INSERT INTO PED_PROD VALUES(4,8,1);
INSERT INTO PED_PROD VALUES(4,2,6);

-------------------------------------------------------------------------------
-- ejercicio 1
select producto.nombre, sum(ped_prod.cantidad)
from producto 
    join ped_prod
        on producto.cod = ped_prod.cod_producto
group by producto.nombre;

-- ejercicio 2
select repartidor.nombre, count(*) as no_repartos
from repartidor 
    join zona
        on repartidor.cod_zona = zona.cod
    join pedido
        on pedido.cod_repartidor = repartidor.matricula
where upper(zona.nombre) like 'NORTE'
having count(*) > 2
group by repartidor.nombre;

-- ejercicio 3
update nombre 
set nombre = concat(nombre,' *')
from producto
where nombre in (
    select producto.nombre
    from producto 
        join ped_prod
            on producto.cod = ped_prod.cod_producto
    having count(*) > 2
    group by producto.nombre
);

-- ejercicio 4
update precio 
set precio = round((precio - (precio * 0.10)),0.2)
from producto 
where nombre in (
    select producto.nombre
    from producto 
        join ped_prod
            on producto.cod = ped_prod.cod_producto
    having count(*) > 2
    group by producto.nombre
);

--ejercicio 5
select to_char(max(pedido.fecha), 'W') as semana, 
to_char(max(pedido.fecha), 'MONTH') as mes
from pedido join repartidor
on pedido.cod_repartidor = repartidor.matricula
join zona
on repartidor.cod_zona = zona.cod
where upper(zona.nombre) like 'NORTE';

-- ejercicio 6
select nombre, direccion
from cliente
where dni not in (select cod_cliente from pedido);

-- ejercicio 7
select pedido.cod, rpad(cliente.dni,12,' ') || '-' || cliente.nombre, 
to_char(pedido.fecha, 'DD MONTH YYYY'), to_char(pedido.fecha, 'WW'),
ped_prod.cantidad, producto.precio
from pedido 
            join cliente
        on pedido.cod_cliente = cliente.dni
            join ped_prod
        on ped_prod.cod_pedido = pedido.cod
            join producto
        on ped_prod.cod_producto = producto.cod
        
where to_char(pedido.fecha, 'YYYY') like '2022'
and to_char(pedido.fecha, 'MM') like '12'
;

-- ejercicio 8

-- ejercicio 9
-- se deberia hacer todo en el admin
-- a)
    create user administrator identified by admin_examen;
    grant dba to admin_examen;
-- b)
  
-- c)
    create table tabla1 (
        atr1 varchar2(30),
        atr2 varchar2(30)
    );
    
    create table tabla2 (
        atr1 varchar2(30),
        atr2 varchar2(30)
    );
-- d)
    create user usuario1 identified by usu1;
    default tablespace;
    quota unlimited;
    
    create user usuario2 identified by usu2;
    default tablespace;
    quota unlimited;
    
    create user usuario3 identified by usu3;
    default tablespace;
    quota unlimited;
    
    create user usuario4 identified by usu4;
    default tablespace;
    quota unlimited;
-- e)
    
-- f)
    grant connect to usu1;
-- g)
    create role examen24;
    grant select to examen24;
-- h)
    
-- i)
    
-- j)
    grant update all users;
-- k)
    grant revoke user usu3;
    grant revoke user usu4;

-- ejercicio 10
(select categoria.nombre, sum(producto.precio)
from categoria 
    join producto
        on categoria.cod_categoria = producto.categoria
    join ped_prod
        on ped_prod.cod_producto = producto.cod
    join pedido
        on ped_prod.cod_pedido = pedido.cod
where to_char(pedido.fecha, 'MM YYYY') like '12 2022'
group by categoria.nombre)

minus

select categoria.nombre, sum(producto.precio)
from categoria 
    join producto
        on categoria.cod_categoria = producto.categoria
    join ped_prod
        on ped_prod.cod_producto = producto.cod
    join pedido
        on ped_prod.cod_pedido = pedido.cod
where to_char(pedido.fecha, 'MM YYYY') like '08 2022'
and categoria.cod_categoria 
group by categoria.nombre;

-- ejercicio 11
create view v_exam
as (
    select producto.nombre as nombre, count(*) as totales
    from producto 
        join ped_prod
            on producto.cod = ped_prod.cod_producto
        join pedido
            on pedido.cod = ped_prod.cod_pedido
    having count(*) > 2
    group by producto.nombre
);

insert into v_exam(nombre) values('examen');
-- no se puede debido a que no se puede insertar en una view que 
-- referencie a mas de una tabla




