/* Dan igual las mayus que las minus en la sintaxis */

CREATE TABLE USUARIOS (
    nombre VARCHAR2(30),
    clave VARCHAR2(10)
);

DESCRIBE USUARIOS;

CREATE TABLE ALUMNO (
    nombre VARCHAR2(30) NOT NULL,-- Para poner que un valor es obligatorio
    dni VARCHAR2(12),
    tlfno NUMBER(15)
); 

/*Crear valores por defecto */
CREATE TABLE ESTADO_CIVIL (
    soltero char(1) default 'S'-- Tiene valor por defecto S 
);

CREATE TABLE TELEFONOS (
    tlfno number(12) default 1111 -- Para números no hace falta poner comilla
);

-- Juntamos la dos propiedades en un mismo elemento
CREATE TABLE CLASE1 (
    tlfno number(12) default 1111 not null
);

-- INSERT
create table clase2 (
    dni varchar2(13),
    nombre varchar2(30) not null,-- Campo obligatorio
    ap1 varchar2(30),
    tlfno number(10),
    estado_civil char(1) default 'S'
);

insert into clase2 values(1111,'PEPE','SANTOS',2222,'C'); -- Insertar una fila

insert into clase2(nombre,ap1,tlfno,estado_civil)
    values('PEPE','SANTOS',2222,'C'); -- Insertar una fila pero sin uno de los campos
    
insert into clase2(nombre,ap1,tlfno)
    values('PEPE','SANTOS',2222); -- Al no decirle nada en estado_civil pone el la 'S' por defecto


-- CONDICIONALES EN LOS CREATES
create table productos (
    cod number(5),
    num_prod varchar2(30) not null,
    precio number(6,2) check (precio > 5)-- Condicion para que todos los precios sean mayores de 5
);

-- Para meter mas condiciones -> check (precio > 5 AND precio < 10)
-- USANDO CONSTRAINT
create table productos2 (
    cod number(5),
    num_prod varchar2(30) not null,
    precio number(6,2),
    CONSTRAINT ck_precio check (precio > 5) -- ck aka check IMPORTANTE NOMBRAR BIEN LA CONSTRAINT
);

insert into productos2 values (123,'FALDA',22);
insert into productos2 values (124,'CAMISETA',3); -- no la insertará por el precio de la camiseta
insert into productos2 values (125,'PANTALÓN',5);
insert into productos2 values (126,'CAMISETA',6);

-- Faltan cosas porque dejo de funcionar xd

CREATE TABLE PRUEBA2 (
    DNI VARCHAR2(12),
    LETRA CHAR(1),
    NOMBRE VARCHAR2(30) DEFAULT 'Pepe',
    TLFNO NUMBER(12) NOT NULL,
    CONSTRAINT CP_DNILET PRIMARY KEY (DNI, LETRA),
    CONSTRAINT CK_TELCOM CHECK (TLFNO > 5 AND NOMBRE='Juan')
);