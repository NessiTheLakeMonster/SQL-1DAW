-- 1. Añade al código del producto de la tabla producto en la salida de la 
-- select delante “CODPROD-“. Debe entrar el código del producto entero. 
-- (Debes sumarle pues el tamaño del código de la base de datos con el prefijo 
-- indicado)Ten cuidado que no todos son del mismo tamaño.
	Ej: CODPROD-AR-001
                    CODPROD-FR-1

-- 2.- Quita de la tabla GAMA_PRODUCTO en la salida de la select en el campo 
-- DESCRIPCION_TEXTO la palabra “PARA” siempre y cuando la encuentre por la 
-- izquierda. (Hazlo en select)

3.- Quita de la tabla GAMA_PRODUCTO en la salida de la select en el campo DESCRIPCION_TEXTO la palabra “PARA” siempre y cuando la encuentre por la derecha. (Hazlo en select)
4.- Modifica de la tabla GAMA_PRODUCTO en el campo DESCRIPCION_TEXTO para que no existan espacios en blanco ni a izquierda ni a derecha. (Hazlo en update)
5.- Convertir la cadena del campo DESCRIPCION_TEXTO de la tabla GAMA_PRODUCTO a minúsculas y en la salida de la select que te muestre la posición de la cadena ‘PARA’.

-- 6.- Eliminar los espacios a izquierda y derecha del campo DESCRIPCION_TEXTO 
-- y agregar el carácter ‘-‘ hasta completar una cadena de 50 caracteres.

7.- Sacamos de la tabla PRODUCTO el nombre del producto junto a su precio concatenando el símbolo del ‘$’ al final. Ambas cosas en el mismo campo y en mayúscula.
	Ej: PRODUCTO-200 $

-- 8.- Modificamos en el nombre del producto de la tabla PRODUCTO todas las 
-- ‘ñ’ por ‘ni’.
select replace(nombre,'ñ','ni')
from cosmetico;

-- 9.- Completar todos los nombres de productos cuyo tamaño sea menor que 
-- 25 con ‘-‘. (Lo puedes hacer en un UPDATE o en un INSERT.
select rpad(nombre,25,'-') from cosmetico;

10.- Recorta desde la posición de comienzo de la palabra para de la tabla GAMA_PRODUCTO en el campo DESCRIPCION_TEXTO del nombre del producto hasta el final de la cadena de esa descripción. (en una select).
11.- Haz un update de la tabla oficina que escriba de forma cifrada (al revés) el nombre del país.
12.- Haz una select que consulte todos los datos de la oficina escribiendo sin cifras el nombre del país donde se encuentra la misma.
13.- Haz una select que le haga el 12 por ciento de descuento a los productos de la tabla producto redondeando en 1 decimal el resultado junto al nombre del producto y con el símbolo del euro al lado.
      Ej: 12,3 € - PRODUCTO
      
-- 14.- Saca un listado de todos los productos cuyo precio sea par.
select CONCAT(nombre, 'par'), precio
from cosmetico
where mod(precio,2) = 0;

-- 15.- Saca un listado de todos los productos cuyo precio sea impar.
select nombre, precio
from cosmetico
where mod(precio,2) != 0;

16.- Saca un listado de todos los productos junto a la palabra par (si su precio es par) o la palabra impar (si su precio es impar).
17.- Escribe la fecha del siguiente lunes después de la fecha del último pago realizado.

-- 18.- Dime los meses que hay (en letra) entre el primer y último pago 
-- realizado.
select months_between(min(fecha_venta), max(fecha_venta)) from venta;

-- 19.- Suma 14 meses a la fecha del último pago realizado.
select add_months(max(fecha_venta),14) from venta;

-- 20.- Saca la semana del año a la que pertenece el primer pedido que se 
-- ha hecho junto al año en concreto escrito en letra.
select to_char(min(fecha_venta), 'MONTH') from venta;

-- 21.- Saca la semana del mes a la que pertenece el último pedido que se 
-- ha hecho junto al mes en concreto escrito en letra.
select to_char(max(fecha_venta), 'W') from venta;

-- 22.- Saca la semana del año a la que pertenece el primer pedido que se 
-- ha hecho junto al año en concreto escrito en número.
select to_char(min(fecha_venta), 'WW'), to_char(min(fecha_venta), 'YYYY')
from venta;

-- 23.- Saca la semana del mes a la que pertenece el último pedido que se 
-- ha hecho junto al mes en concreto escrito en número.
