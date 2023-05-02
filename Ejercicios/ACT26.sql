DROP TABLE PEDIDO;
DROP TABLE CLIENTE;
DROP TABLE COMERCIAL;

CREATE TABLE cliente (
id_cliente NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
categoria NUMBER
);

CREATE TABLE comercial (
id_comercial NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
comision FLOAT
);

CREATE TABLE pedido (
id_pedido NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
total NUMBER(7,2) NOT NULL,
fecha DATE,
id_cliente NUMBER NOT NULL,
id_comercial NUMBER NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_comercial) REFERENCES comercial(id_comercial)
);

INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('AarÃ³n', 'Rivero', 'GÃ³mez', 'AlmerÃ­a', 100);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Adela', 'Salas', 'DÃ­az', 'Granada', 200);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('AdriÃ¡n', 'SuÃ¡rez', NULL, 'JaÃ©n', 300);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Marcos', 'Loyola', 'MÃ©ndez', 'AlmerÃ­a', 200);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('MarÃ­a', 'Santana', 'Moreno', 'CÃ¡diz', 100);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Guillermo', 'LÃ³pez', 'GÃ³mez', 'Granada', 225);
INSERT INTO cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES('Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Daniel', 'SÃ¡ez', 'Vega', 0.15);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Juan', 'GÃ³mez', 'LÃ³pez', 0.13);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Manuel','DomÃ­nguez', 'HernÃ¡ndez', 0.13);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Antonio','Vega', 'HernÃ¡ndez', 0.11);
INSERT INTO comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES('Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(150.5, TO_DATE('2017-10-05', 'YYYY-MM-DD'), 5, 2);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(270.65, to_date('2016-09-10', 'YYYY-MM-DD'), 1, 5);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(65.26, to_date('2017-10-05','YYYY-MM-DD'), 2, 1);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(110.5, to_date('2016-08-17','YYYY-MM-DD'), 8, 3);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(948.5, to_date('2017-09-10','YYYY-MM-DD'), 5, 2);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(2400.6, to_date('2016-07-27','YYYY-MM-DD'), 7, 1);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(5760, to_date('2015-09-10','YYYY-MM-DD'), 2, 1);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(1983.43, to_date('2017-10-10','YYYY-MM-DD'), 4, 6);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(2480.4, to_date('2016-10-10','YYYY-MM-DD'), 8, 3);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(250.45, to_date('2015-06-27','YYYY-MM-DD'), 8, 2);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(75.29, to_date('2016-08-17','YYYY-MM-DD'), 3, 7);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(3045.6, to_date('2017-04-25','YYYY-MM-DD'), 2, 1);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(545.75, to_date('2019-01-25','YYYY-MM-DD'), 6, 1);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(145.82, to_date('2017-02-02','YYYY-MM-DD'), 6, 1);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(370.85, to_date('2019-03-11','YYYY-MM-DD'), 1, 5);
INSERT INTO pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES(2389.23, to_date('2019-03-11','YYYY-MM-DD'), 1, 5);

-----------------------------------------------------------------------------------------------------------------------
-- CONSULTAS SOBRE UNA TABLA

-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha
-- de realizaciÃ³n, mostrando en primer lugar los pedidos mÃ¡s recientes.
select * from pedido
order by fecha desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.


-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algÃºn pedido. Tenga en cuenta
-- que que no debe mostrar identificadores que estÃ©n repetidos.
select distinct id_cliente from pedido;

select distinct pedido.id_cliente, cliente.nombre
from pedido join cliente
on pedido.id_cliente = cliente.id_cliente; -- sacados con el nombre

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el aÃ±o 2017, cuya cantidad total
-- sea superior a 500â‚¬.
select * from pedido
where total > 500 and to_char(fecha,'YYYY') like 2017;

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisiÃ³n entre 0.05 y 0.11.
select nombre, apellido1, apellido2 from comercial
where comision between (0.05) and (0.11);

-- 6. Devuelve el valor de la comisiÃ³n de mayor valor que existe en la tabla comercial.
select max(comision) from comercial;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL.
-- El listado deberÃ¡ estar ordenado alfabÃ©ticamente por apellidos y nombre.
select cliente.id_cliente, cliente.nombre, cliente.apellido1, cliente.apellido2
from cliente
where apellido2 is not null
order by apellido1;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y tambiÃ©n los nombres
-- que empiezan por P. El listado deberÃ¡ estar ordenado alfabÃ©ticamente.
select nombre
from cliente
where (upper(nombre) like 'A%N') or (upper(nombre) like 'P%')
order by nombre;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberÃ¡
-- estar ordenado alfabÃ©ticamente.
select nombre
from cliente
where upper(nombre) not like 'A%'
order by nombre;

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se
-- deberÃ¡n eliminar los nombres repetidos.
select distinct(nombre)
from comercial
where upper(nombre) like '%O';

---------------------------------------------------------------------------
-- CONSULTA MULTITABLA

-- 11.	Devuelve un listado con el identificador, nombre y los apellidos de todos 
-- los clientes que han realizado algún pedido. El listado debe estar ordenado 
-- alfabéticamente y se deben eliminar los elementos repetidos. 
select distinct(cliente.id_cliente), cliente.nombre, cliente.apellido1, cliente.apellido2
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
order by nombre;

-- 12.	Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente. 
select pedido.* ,cliente.nombre as CLIENTE 
from pedido join cliente
on pedido.id_cliente = cliente.id_cliente
order by cliente.nombre;

-- 13.	Devuelve un listado que muestre todos los pedidos en los que ha participado 
-- un comercial. El resultado debe mostrar todos los datos de los pedidos y de los 
-- comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
select pedido.*, comercial.*
from pedido join comercial
on pedido.id_comercial = comercial.id_comercial
order by comercial.nombre;

-- 14.	Devuelve un listado que muestre todos los clientes, con todos los pedidos 
-- que han realizado y con los datos de los comerciales asociados a cada pedido. 
select cliente.*, pedido.*, comercial.*
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
join comercial
on pedido.id_cliente = comercial.id_comercial;

-- 15.	Devuelve un listado de todos los clientes que realizaron un pedido durante 
-- el año 2017, cuya cantidad esté entre 300 € y 1000 €. 
select cliente.nombre, pedido.fecha, pedido.total
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
where to_char(fecha,'YYYY') like 2017 and
total BETWEEN 300 and 1000;

-- 16.	Devuelve el nombre y los apellidos de todos los comerciales que ha 
-- participado en algún pedido realizado por María Santana Moreno. 
select comercial.nombre, comercial.apellido1, comercial.apellido2
from comercial join pedido
on comercial.id_comercial = pedido.id_comercial
join cliente
on pedido.id_cliente = cliente.id_cliente
where upper(cliente.nombre) like 'MARIA' 
    and upper(cliente.apellido1) like 'SANTANA'
    and upper(cliente.apellido2) like 'MORENO';

-- 17.	Devuelve el nombre de todos los clientes que han realizado algún pedido 
-- con el comercial Daniel Sáez Vega.
select cliente.nombre
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
join comercial
on comercial.id_comercial = pedido.id_comercial
where upper(comercial.nombre) like 'DANIEL'
    and upper(comercial.apellido1) like 'SAEZ'
    and upper(comercial.apellido2) like 'VEGA';
    
---------------------------------------------------------------------------
-- CONSULTAS COPOSICIÓN EXTERNA (LEFT JOIN, RIGHT JOIN)

-- 18.	Devuelve un listado con todos los clientes junto con los datos de los 
-- pedidos que han realizado. Este listado también debe incluir los clientes 
-- que no han realizado ningún pedido. El listado debe estar ordenado 
-- alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
select pedido.*, cliente.*
from cliente left join pedido
on pedido.id_cliente = cliente.id_cliente
order by cliente.apellido1;

-- 19.	Devuelve un listado con todos los comerciales junto con los datos de 
-- los pedidos que han realizado. Este listado también debe incluir los 
-- comerciales que no han realizado ningún pedido. El listado debe estar 
-- ordenado alfabéticamente por el primer apellido, segundo apellido y nombre 
-- de los comerciales. 
select comercial.*, pedido.*
from comercial left join pedido
on pedido.id_comercial = comercial.id_comercial
order by comercial.nombre;

-- 20.	Devuelve un listado que solamente muestre los clientes que no han 
-- realizado ningún pedido.
select pedido.*, cliente.*
from cliente left join pedido
on pedido.id_cliente = cliente.id_cliente
where pedido.id_cliente is null
order by cliente.apellido1;

-- 21.	Devuelve un listado que solamente muestre los comerciales que no han 
-- realizado ningún pedido. 
select comercial.*, pedido.*
from comercial left join pedido
on pedido.id_comercial = comercial.id_comercial
where pedido.id_comercial is null
order by comercial.nombre;

-- 22.	Devuelve un listado con los clientes que no han realizado ningún 
-- pedido y de los comerciales que no han participado en ningún pedido. 
-- Ordene el listado alfabéticamente por los apellidos y el nombre. En el 
-- listado deberá diferenciar de algún modo los clientes y los comerciales.
select comercial.*, pedido.*, cliente.*
from comercial left join pedido
on pedido.id_comercial = comercial.id_comercial
where pedido.id_comercial is null
having cliente.* = (select pedido.*, cliente.* from pedido right join cliente
    on pedido.id_cliente = cliente.id_cliente
    where pedido.id_cliente is null);

right join cliente
on pedido.id_cliente = cliente.id_cliente
where (pedido.id_comercial is null) or (pedido.id_cliente is null)
order by comercial.nombre;

--------------------------------------------------------------------------
-- CONSULTA RESUMEN

-- 23.	Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(count(*)) from pedido
group by id_pedido;

-- 24.	Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(total) from pedido;

-- 25.	Calcula el número total de comerciales distintos que aparecen en la tabla pedido. 
select distinct(comercial.nombre)
from comercial join pedido
on comercial.id_comercial = pedido.id_comercial;

-- 26.	Calcula el número total de clientes que aparecen en la tabla cliente. 
select count(*) from cliente;

-- 27.	Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(total) from pedido;

-- 28.	Calcula cuál es la menor cantidad que aparece en la tabla pedido. 
select min(total) from pedido;

-- 29.	Calcula cuál es el valor máximo de categoría para cada una de las 
-- ciudades que aparece en la tabla cliente. 
select ciudad, categoria
from cliente
where categoria = (select max(categoria) from cliente)
group by ciudad,categoria;

-- 30.	Calcula cuál es el máximo valor de los pedidos realizados durante el 
-- mismo día para cada uno de los clientes. Es decir, el mismo cliente puede 
-- haber realizado varios pedidos de diferentes cantidades el mismo día. Se 
-- pide que se calcule cuál es el pedido de máximo valor para cada uno de los 
-- días en los que un cliente ha realizado un pedido. Muestra el identificador 
-- del cliente, nombre, apellidos, la fecha y el valor de la cantidad. 
select cliente.id_cliente, cliente.apellido1, cliente.apellido2,pedido.fecha, pedido.total
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
where to_char(pedido.fecha, 'DD/MM/YY') like '11/03/19'
and pedido.total = (select max(total) from pedido);

-- 31.	Calcula cuál es el máximo valor de los pedidos realizados durante 
-- el mismo día para cada uno de los clientes, teniendo en cuenta que sólo 
-- queremos mostrar aquellos pedidos que superen la cantidad de 2000 €. 

-- 32.	Calcula el máximo valor de los pedidos realizados para cada uno de 
-- los comerciales durante la fecha 2016-08-17. Muestra el identificador del 
-- comercial, nombre, apellidos y total. 
select comercial.id_comercial, comercial.nombre, comercial.apellido1, pedido.total
from comercial join pedido
on comercial.id_comercial = pedido.id_comercial
where to_char(pedido.fecha, 'YYYY-MM-DD') like '2016-08-17';

-- 33.	Devuelve un listado con el identificador de cliente, nombre y apellidos 
-- y el número total de pedidos que ha realizado cada uno de clientes. Tenga 
-- en cuenta que pueden existir clientes que no han realizado ningún pedido. 
-- Estos clientes también deben aparecer en el listado indicando que el número 
-- de pedidos realizados es 0. 

-- 34.	Devuelve un listado con el identificador de cliente, nombre y apellidos 
-- y el número total de pedidos que ha realizado cada uno de clientes durante 
-- el año 2017.
select cliente.id_cliente, cliente.nombre, cliente.apellido1, count(*) as pedidos_totales
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
where to_char(pedido.fecha, 'YYYY') like 2017
group by cliente.id_cliente, cliente.nombre, cliente.apellido1;
 
-- 35.	Devuelve un listado que muestre el identificador de cliente, nombre, 
-- primer apellido y el valor de la máxima cantidad del pedido realizado por 
-- cada uno de los clientes. El resultado debe mostrar aquellos clientes que 
-- no han realizado ningún pedido indicando que la máxima cantidad de sus 
-- pedidos realizados es 0.

-- 36.	Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año. 
select * from pedido
where fecha = (select max(fecha) from pedido)
and total = (select max(total) from pedido);

-- 37.	Devuelve el número total de pedidos que se han realizado cada año.
select count(*), extract(YEAR from fecha)
from pedido
group by fecha;

----------------------------------------------------------------------------

-- CON OPERADORES BÁSICOS DE COMPARACIÓN

-- 38.	Devuelve un listado con todos los pedidos que ha realizado Adela 
-- Salas Díaz. (Sin utilizar INNER JOIN). 
select pedido.* 
from pedido join cliente
on pedido.id_cliente = cliente.id_cliente
where upper(cliente.nombre) like 'ADELA';

-- 39.	Devuelve el número de pedidos en los que ha participado el comercial 
-- Daniel Sáez Vega. (Sin utilizar INNER JOIN) 
select pedido.*
from pedido join comercial
on comercial.id_comercial = pedido.id_comercial
where upper(comercial.nombre) like 'DANIEL';

-- 40.	Devuelve los datos del cliente que realizó el pedido más caro en el año 
-- 2019. (Sin utilizar INNER JOIN) 
select cliente.*
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
where to_char(pedido.fecha,'YYYY') like '2019'
and pedido.total = (select max(total) from pedido);

-- 41.	Devuelve la fecha y la cantidad del pedido de menor valor realizado 
-- por el cliente Pepe Ruiz Santana. 

-- 42.	Devuelve un listado con los datos de los clientes y los pedidos, 
-- de todos los clientes que han realizado un pedido durante el año 2017 
-- con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
select cliente.*, pedido.*
from cliente join pedido
on cliente.id_cliente = pedido.id_cliente
where to_char(pedido.fecha,'YYYY') like '2017'
and pedido.total = (select avg(total) from pedido
where avg(total));

--------------------------------------------------------------------------------

-- CON ALL Y ANY

-- 43.	Devuelve el pedido más caro que existe en la tabla pedido si hacer 
-- uso de MAX, ORDER BY ni LIMIT. 
select * 
from pedido
where total >= all(select total from pedido);

-- 44.	Devuelve un listado de los clientes que no han realizado ningún 
-- pedido. (Utilizando ANY o ALL).
select *
from cliente 
where id_cliente = any(select id_cliente from pedido);

-- 45.	Devuelve un listado de los comerciales que no han realizado 
-- ningún pedido. (Utilizando ANY o ALL).
select *
from comercial
where id_comercial = any(select id_comercial from pedido);

-----------------------------------------------------------------------------
-- CON IN Y NOT IN

-- 46.	Devuelve un listado de los clientes que no han realizado 
-- ningún pedido. (Utilizando IN o NOT IN). 
select *
from cliente
where id_cliente not in (select id_cliente from pedido);

-- 47.	Devuelve un listado de los comerciales que no han realizado ningún pedido. 
-- (Utilizando IN o NOT IN).
select * 
from comercial
where id_comercial not in (select id_comercial from pedido);

-----------------------------------------------------------------------------
-- CON EXISTS Y NOT EXISTS

-- 48.	Devuelve un listado de los clientes que no han realizado ningún 
-- pedido. (Utilizando EXISTS o NOT EXISTS). 
SELECT *
FROM cliente
WHERE NOT EXISTS (SELECT * FROM pedido WHERE id_cliente = cliente.id_cliente);

-- 49.	Devuelve un listado de los comerciales que no han realizado ningún
-- pedido. (Utilizando EXISTS o NOT EXISTS).
select *
from comercial
where not exists(select * from pedido where id_comercial = comercial.id_comercial);



