-- EJERCICIO 1
create table ALUMNOS07 (
    NUMERO_MATRICULA number(6)not null,
    NOMBRE varchar2(15) not null,
    FECHA_NACIMIENTO date,
    DIRECION varchar2(30),
    LOCALIDAD varchar2(15)
);

-- EJERCICIO 2
-- La tabla se crea sin ningún problema

-- EJERCICIO 3

-- EJERCICIO 6
create table EMPLEADO (
    NUM_EMP number(6) primary key,
    NOMBRES varchar2(15),
    PUESTO varchar2(15),
    SALARIO number(6,3),
    COMISION number(6,3),
    NUM_DEPT number(6),
    FECHA_ING date,
    NUM_SUP number(4)
);

-- EJERCICIO 7
create table DEPARTAMENTO (
    NUM_DEPT number(6) primary key,
    NOMBRE varchar2(15),
    LOCALIDAD varchar2(15)
);

-- EJERCICIO 8
create table GRADOS (
    GRADO number(6) primary key,
    SALINF number(6,3) default 1200.0,
    SALSUP number(6,3) default 5000.0,
    SALARIO number(6,3),
    constraint ck_salario check (SALARIO between SALINF and SALSUP)
); -- da error miralo

-- EJERCICIO 9
create table CLIENTE (
    DNI varchar2(9)primary key,
    NOMBRE varchar2(30),
    APELLIDO1 varchar2(30),
    APELLIDO2 varchar2(30),
    FECHA_NAC date,
    TLFNO number(15)
);

create table CLIENTE_COMPRA_PRODUCTO (
    DNI varchar2(9),
    COD number(6),
    primary key (DNI,COD),
    foreign key (DNI) references CLIENTE(DNI),
    foreign key (COD) references PRODUCTO(COD)
);

create table PRODUCTO (
    COD number(6) primary key,
    NIF number(12),
    NOMBRE varchar2(15),
    PRECIO number(4,3),
    foreign key (NIF) references PROVEEDOR(NIF)
);

create table POVEEDOR (
    NIF number(12) primary key,
    NOMBRE varchar(15),
    DIRECCION varchar2(30)
);

-- EJERCICIO 10
create table EMPLEADO2 (
    NOMBRE varchar2(25),
    EDAD number(2) check (EDAD >= 18 and EDAD <= 25),
    COD_PROVINCIA number(6),
    foreign key (COD_PROVINCIA) references PROVINCIAS(CODIGO) on delete cascade
);

create table PROVINCIAS (
    CODIGO number(2) primary key,
    NOMBRE varchar2(25)
);

-- EJERCICIO 11
create table BLOQUE_PISOS (
    CALLE varchar2(30)not null,
    NUMERO number(3) not null,
    PISO number(2) not null,
    PUERTA char(1) not null,
    COD_POSTAL number(5),
    METROS number(5),
    COMENTARIOS varchar2(60),
    COD_ZONA number(2),
    DNI varchar2(10),
    primary key (CALLE,NUMERO,PISO,PUERTA)
);

-- EJERCICIO 12

-- EJERCICIO 13
create table PERSONAS2 (
    DNI varchar2(10) primary key,
    NOMBRE varchar2(15),
    DIRECCION varchar2(30),
    POBLACION varchar2(15),
    COD_PROVINCIA number(6),
    foreign key (COD_PROVINCIA) references PROVINCIA2(COD)
);

create table PROVINCIA2 (
    COD number(6) primary key,
    NOMBRE varchar2(30)
);

-- EJERCICIO 14 --------------------------------------------------------------
create table EJEMPLO01 (
    FECHA date,
    DNI varchar2(10) primary key,
    NOMBRE varchar2(30)
);
-- se utiliza sysdate en el insert para poner la fecha actual
insert into EJEMPLO01 values (sysdate,'05984134H','Ines');

-- EJERCICIO 15 --------------------------------------------------------------
create table ALUMNO (
    DNI varchar2(10) primary key,
    NOMBRE varchar2(15)not null,
    APE1 varchar2(15),
    APE2 varchar2(15),
    FECHA_NAC date,
    DIRECCION varchar2(30),
    TELFNO number(12) not null
);

insert into ALUMNO 
    values ('05984357F','Ines','Barrera','Llerena','02-03-2001', 'calle cruces', 6345632);

create table PACIENTE (
    DNI varchar2(10) primary key,
    NOMBRE varchar2(15) not null,
    APE1 varchar2(15),
    APE2 varchar2(15),
    FECHA_NAC date,
    NUM_PACIENTE number(10) not null
);

create table PIEZA (
    NUM_PIEZA number(6),
    COD_PIEZA number(6),
    NOMBRE varchar2(15) not null,
    DESCRIPCION varchar2(60),
    PASILLO number(2) not null,
    ESTANTE number(4) not null,
    ALTURA number(6),
    primary key (NUM_PIEZA, COD_PIEZA)
);

create table PIEZA2 (
    NUM_PIEZA number(6),
    COD_PIEZA number(6),
    NOMBRE varchar2(15) not null,
    DESCRIPCION varchar2(60),
    PRECIO number(3,2) check (PRECIO > 1),
    primary key (NUM_PIEZA, COD_PIEZA)
);

create table PIEZA3 (
    NUM_PIEZA number(6),
    COD_PIEZA number(6),
    NOMBRE varchar2(15) not null,
    DESCRIPCION varchar2(60),
    PASILLO number(2) default 0,
    ESTANTE number(4) default 0,
    ALTURA number(6) default 0,
    primary key (NUM_PIEZA, COD_PIEZA)
);

-- EJERCICIO 16
create table PUB (
    COD number(6)
);
