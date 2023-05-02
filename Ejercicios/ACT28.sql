-- 1. A�ade al c�digo del producto de la tabla producto en la salida de la 
-- select delante �CODPROD-�. Debe entrar el c�digo del producto entero. 
-- (Debes sumarle pues el tama�o del c�digo de la base de datos con el prefijo 
-- indicado)Ten cuidado que no todos son del mismo tama�o.
	Ej: CODPROD-AR-001
                    CODPROD-FR-1

-- 2.- Quita de la tabla GAMA_PRODUCTO en la salida de la select en el campo 
-- DESCRIPCION_TEXTO la palabra �PARA� siempre y cuando la encuentre por la 
-- izquierda. (Hazlo en select)

3.- Quita de la tabla GAMA_PRODUCTO en la salida de la select en el campo DESCRIPCION_TEXTO la palabra �PARA� siempre y cuando la encuentre por la derecha. (Hazlo en select)
4.- Modifica de la tabla GAMA_PRODUCTO en el campo DESCRIPCION_TEXTO para que no existan espacios en blanco ni a izquierda ni a derecha. (Hazlo en update)
5.- Convertir la cadena del campo DESCRIPCION_TEXTO de la tabla GAMA_PRODUCTO a min�sculas y en la salida de la select que te muestre la posici�n de la cadena �PARA�.

-- 6.- Eliminar los espacios a izquierda y derecha del campo DESCRIPCION_TEXTO 
-- y agregar el car�cter �-� hasta completar una cadena de 50 caracteres.

7.- Sacamos de la tabla PRODUCTO el nombre del producto junto a su precio concatenando el s�mbolo del �$� al final. Ambas cosas en el mismo campo y en may�scula.
	Ej: PRODUCTO-200 $

-- 8.- Modificamos en el nombre del producto de la tabla PRODUCTO todas las 
-- �� por �ni�.
select replace(nombre,'�','ni')
from cosmetico;

-- 9.- Completar todos los nombres de productos cuyo tama�o sea menor que 
-- 25 con �-�. (Lo puedes hacer en un UPDATE o en un INSERT.
select rpad(nombre,25,'-') from cosmetico;

10.- Recorta desde la posici�n de comienzo de la palabra para de la tabla GAMA_PRODUCTO en el campo DESCRIPCION_TEXTO del nombre del producto hasta el final de la cadena de esa descripci�n. (en una select).
11.- Haz un update de la tabla oficina que escriba de forma cifrada (al rev�s) el nombre del pa�s.
12.- Haz una select que consulte todos los datos de la oficina escribiendo sin cifras el nombre del pa�s donde se encuentra la misma.
13.- Haz una select que le haga el 12 por ciento de descuento a los productos de la tabla producto redondeando en 1 decimal el resultado junto al nombre del producto y con el s�mbolo del euro al lado.
      Ej: 12,3 � - PRODUCTO
      
-- 14.- Saca un listado de todos los productos cuyo precio sea par.
select CONCAT(nombre, 'par'), precio
from cosmetico
where mod(precio,2) = 0;

-- 15.- Saca un listado de todos los productos cuyo precio sea impar.
select nombre, precio
from cosmetico
where mod(precio,2) != 0;

16.- Saca un listado de todos los productos junto a la palabra par (si su precio es par) o la palabra impar (si su precio es impar).
17.- Escribe la fecha del siguiente lunes despu�s de la fecha del �ltimo pago realizado.

-- 18.- Dime los meses que hay (en letra) entre el primer y �ltimo pago 
-- realizado.
select months_between(min(fecha_venta), max(fecha_venta)) from venta;

-- 19.- Suma 14 meses a la fecha del �ltimo pago realizado.
select add_months(max(fecha_venta),14) from venta;

-- 20.- Saca la semana del a�o a la que pertenece el primer pedido que se 
-- ha hecho junto al a�o en concreto escrito en letra.
select to_char(min(fecha_venta), 'MONTH') from venta;

-- 21.- Saca la semana del mes a la que pertenece el �ltimo pedido que se 
-- ha hecho junto al mes en concreto escrito en letra.
select to_char(max(fecha_venta), 'W') from venta;

-- 22.- Saca la semana del a�o a la que pertenece el primer pedido que se 
-- ha hecho junto al a�o en concreto escrito en n�mero.
select to_char(min(fecha_venta), 'WW'), to_char(min(fecha_venta), 'YYYY')
from venta;

-- 23.- Saca la semana del mes a la que pertenece el �ltimo pedido que se 
-- ha hecho junto al mes en concreto escrito en n�mero.
