-- Actividad 15 ejercicio 1

CREATE TABLE Fabricantes(
	Codigo number (4),
	Nombre VARCHAR(100) NOT NULL,
	CONSTRAINT pk_fab PRIMARY KEY (Codigo)
);

CREATE TABLE Articulos(
	Codigo number (4),
	Nombre VARCHAR2(100) NOT NULL,
	Precio number(6,2) CHECK(precio>0) NOT NULL,
	Fabricante number(4) NOT NULL,
	CONSTRAINT pk_art PRIMARY KEY (Codigo), 
	CONSTRAINT fk_fab FOREIGN KEY (Fabricante) REFERENCES Fabricantes(Codigo)
	ON DELETE CASCADE	
);

insert into fabricantes values(1,'Fabricante1');
insert into fabricantes values(2,'Fabricante2');
insert into fabricantes values(3,'Fabricante3');
insert into fabricantes values(4,'Fabricante4');
insert into fabricantes values(5,'Fabricante5');

insert into articulos values(1,'articulo1',20.5,1);
insert into articulos values(2,'articulo2',120.25,1);
insert into articulos values(3,'articulo3',2.75,2);
insert into articulos values(4,'articulo4',80.5,1);
insert into articulos values(5,'articulo5',100.5,3);
insert into articulos values(6,'articulo6',60.75,5);
insert into articulos values(7,'articulo7',20.5,1);
insert into articulos values(8,'articulo8',220.5,5);
insert into articulos values(9,'articulo9',90.5,4);
insert into articulos values(10,'articulo10',18.55,3);

------------------------------------------------------------------------------
--? 1. Obtener los nombres de los productos de la tienda 
SELECT NOMBRE FROM ARTICULOS;

--? 2. Obtener los nombres y los precios de los productos de la tienda 
SELECT NOMBRE, PRECIO
FROM ARTICULOS;

--? 3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200€ 
SELECT NOMBRE
FROM ARTICULOS
    WHERE PRECIO <= 200;

--? 4. Obtener todos los datos de los artículos cuyo precio esté entre los 60€ 
--?    y los 120€ (ambas cantidades incluidas) 
SELECT *
FROM ARTICULOS
    WHERE PRECIO BETWEEN 60 AND 120;

--? 5. Obtener el nombre y el precio en pesetas (es decir, el precio en euros 
--?    multiplicado por 166,386)
SELECT NOMBRE, (PRECIO * 166.386) AS PRECIO_PESETAS
FROM ARTICULOS;

--? 6. Seleccionar el precio medio de todos los productos 
SELECT AVG(PRECIO)
FROM ARTICULOS;

--? 7. Obtener el precio medio de los artículos cuyo código de fabricante sea 2 
SELECT AVG(PRECIO)
FROM ARTICULOS
    WHERE FABRICANTE = 2;
 
--? 8. Obtener el número de artículos cuyo precio sea mayor o igual a 180€ 
SELECT PRECIO
FROM ARTICULOS
    WHERE PRECIO >= 180;

--? 9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual 
--?    a 180€ y ordenarlos descendentemente por precio, y luego ascendentemente por nombre 
SELECT NOMBRE, PRECIO
FROM ARTICULOS
    WHERE PRECIO >= 180
    ORDER BY PRECIO ASC;

--? 10. Obtener un listado completo de artículos, incluyendo por cada artículo 
--?     los datos del artículo y de su fabricante 
SELECT *
FROM ARTICULOS RIGHT JOIN FABRICANTES
ON ARTICULOS.FABRICANTE = FABRICANTES.CODIGO;
 
--? 11. Obtener un listado de artículos, incluyendo el nombre del artículo, su 
--?     precio, y el nombre de su fabricante 
SELECT ARTICULOS.NOMBRE AS ARTICULO, ARTICULOS.PRECIO, FABRICANTES.NOMBRE AS FABRICANTE
FROM ARTICULOS JOIN FABRICANTES
ON ARTICULOS.FABRICANTE = FABRICANTES.CODIGO;

--? 12. Obtener el precio medio de los productos de cada fabricante, mostrando 
--?     solo los códigos de fabricante 
SELECT FABRICANTE, AVG(PRECIO)
FROM ARTICULOS
GROUP BY FABRICANTE;
    --HAVING PRECIO =(SELECT AVG(PRECIO) FROM ARTICULOS);
    
--? 13. Obtener el precio medio de los productos de cada fabricante, mostrando 
--?     el nombre del fabricante 

--? 14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo 
--?     precio medio sea mayor o igual a 150€ 

--? 15. Obtener el nombre y precio del artículo más barato
SELECT NOMBRE, PRECIO
FROM ARTICULOS 
WHERE PRECIO = (SELECT MIN(PRECIO) FROM ARTICULOS);

--? 16. Obtener una lista con el nombre y precio de los artículos más caros de 
--?     cada proveedor (incluyendo el nombre del proveedor)
SELECT ARTICULOS.NOMBRE, ARTICULOS.PRECIO, FABRICANTES.NOMBRE
FROM ARTICULOS JOIN FABRICANTES
ON ARTICULOS.FABRICANTE = FABRICANTES.CODIGO
    WHERE ARTICULOS.PRECIO = (SELECT MAX(PRECIO) FROM ARTICULOS);

--? 17. Añadir un nuevo producto: Altavoces de 70€ (del fabricante 2) 

--? 18. Cambiar el nombre del producto 8 a ‘Impresora Laser’ 

--? 19. Aplicar un descuento del 10% (multiplicar el precio por 0,9) a todos los productos 

--? 20. Aplicar un descuento de 10€ a todos los productos cuyo precio sea mayor o igual a 120€ 
UPDATE ARTICULOS
SET PRECIO = PRECIO - 10
WHERE PRECIO >= 120;