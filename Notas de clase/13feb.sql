-- 13 Febrero

CREATE TABLE supermercado (
    codigo NUMBER(4) PRIMARY KEY,
    nombre VARCHAR2(30),
    precio NUMBER(4,2)
);

INSERT INTO supermercado VALUES(1,'CEREALES',2.5);
INSERT INTO supermercado VALUES(2,'REFRESCO',3);
INSERT INTO supermercado VALUES(3,'PATATAS',4);
INSERT INTO supermercado VALUES(4,'patatas',3);
INSERT INTO supermercado VALUES(5,'lechuga',1);

--------------------------------------------------------------------------------------------
-- UPDATE

UPDATE supermercado SET (precio = 6); -- cambia todos los precios del insert anterior a 6

-- todos los productos lechuga deben costar 1€
UPDATE supermercado SET (precio = 1) WHERE LOWER (nombre LIKE 'lechuga');
-- like se utiliza para las cadenas de caracteres (alfanumerico), no se usa el =
-- con los números se sigue utilizando el =
UPDATE supermercado SET (precio = 1) WHERE LOWER (nombre LIKE 'patatas');

-- rebajar todos los precios del supermercado un 20%
UPDATE supermercado SET (precio = precio - precio * 0.2);

-- subir un 60% los precios a las patatas y a la lechuga
UPDATE supermercado SET (precio = precio + precio * 0.6) WHERE LOWER (nombre LIKE 'patatas' OR nombre LIKE 'lechuga');

-- subir 50% el precio a todos los productos que cuesten menos de 5€
UPDATE supermercado SET (precio = precio + precio * 0.5) WHERE (precio < 5);

-- hasta aqui entra en el examen del viernes 17

--------------------------------------------------------------------------------------------

-- como crear un campo autonumerico
cod NUMBER(9) GENERATED ALWAYS AS IDENTITY PRIMARY KEY