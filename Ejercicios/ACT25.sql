-- SCRIPT DE SUPERMERCADO

-- 1.- Calcula el número total de productos que hay en el supermercado.
select sum(VOLUMEN) as productos_Totales from PRODUCTO;

-- 2.- Calcula el número total de productos que contiene la letra A en su nombre.
select * from PRODUCTO
where upper(NOMBRE) like '%A%';

-- 3.- Calcula el número total de precios de todos los productos de nuestro supermercado.


-- 4.- Calcula la media del precio de todos los productos.
select avg(VOLUMEN) from PRODUCTO;

-- 5.- Calcula el precio más barato de todos los productos.
select min(VOLUMEN) from PRODUCTO;

-- 5.- Calcula el precio más barato de todos los productos de coste mayor de 10 euros.
select min(VOLUMEN) from PRODUCTO
where VOLUMEN > 10;

-- 6.- Calcula el precio más caro de todos los productos.
select max(VOLUMEN) from PRODUCTO;

-- 7.- Calcula el precio más caro de todos los productos de coste menor de 10 euros.
select max(VOLUMEN) from PRODUCTO
where VOLUMEN < 10;

-- 8.- Muestra el nombre y el precio del producto más barato.
select NOMBRE, min(VOLUMEN) from PRODUCTO
group by NOMBRE;

-- 9.- Muestra el nombre y el precio del producto más caro.
-- 10.- Calcula el número de pedidos del repartidos ‘ANTONIO’.
-- 11.- Calcula el coste total de los pedidos repartidos por ‘ANTONIO’.
-- 12.- Calcula el coste medio de los pedidos repartidos por ‘ANTONIO’.
-- 13.- Muestra el coste de pedido máximo, el coste del pedido mínimo y el número total de productos que ha repartido ‘ANTONIO’.
-- 14.- Muestra el número total de productos de cada categoría junto con el nombre de la categoría.
-- 15.- Listar el nombre y teléfono de los clientes en una única columna.
-- 16.- Lista los datos necesarios para resolver una factura por cada pedido. (Datos del cliente, datos del pedido).