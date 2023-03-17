-- ACTIVIDAD 20 EJER 6

Create table piezas(
   Código number (2),
   Nombre varchar2 (50));

insert into piezas values(1,'Tornillo M5');
insert into piezas values(2,'Tornillo M2');
insert into piezas values(3,'Tuerca M5');
insert into piezas values(4,'Tuerca M2');
   
Create table proveedores (
  Id char (4),
  Nombre varchar2(60));

insert into proveedores values ('RBT','Susan Calvin Corp');
insert into proveedores values ('HAL','Huge Grant SL');
insert into proveedores values ('ILG','Isis Lugagge');
insert into proveedores values ('GVL','Grant Lorry');

Create table suministra (
   Codigopieza number(2),
   idProveedor char(4),
   precio number (6,2));

insert into suministra values (1,'HAL',50.3);
insert into suministra values (2,'HAL',52.25);
insert into suministra values (1,'ILG',5.28);
insert into suministra values (3,'GVL',10.35);
insert into suministra values (4,'HAL',8.28);
insert into suministra values (1,'RBT',13.3);
------------------------------------------------------------------------------
--? 1. Obtener los nombres de todas las piezas 

--? 2. Obtener todos los datos de todos los proveedores 

--? 3. Obtener el precio medio al que se nos suministran las piezas 

--? 4. Obtener los nombres de los proveedores que suministran la pieza 1 

--? 5. Obtener los nombres de las piezas suministradas por el proveedor cuyo código es HAL 

--? 6. Obtener los nombres de los proveedores que suministran las piezas más 
--?    caras indicando el nombre de la pieza y el precio al que la suministran 

--? 7. Hacer constar en la base de datos que la empresa “Skellington Supplies” 
--?    (código TNBC) va a empezar a suministrarnos tuercas (códio 1) a 7 pesetas cada tuerca. 

--? 8. Aumentar los precios en una unidad 

--? 9. Hacer constar en la base de datos que la empresa “Susan Calvin Corp” 
--?    (RBT) no va a suministrarnos ninguna pieza (aunque la empresa en sí va a 
--?    seguir constando en nuestra base de datos) 

--? 10. Hacer constar en la base de datos que la empresa “Susan Calvin Corp.” 
--?     (RBT) ya no va a suministrarnos clavos (código 4) 