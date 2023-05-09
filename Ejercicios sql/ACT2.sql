-- ACT2

-- EJERCICIO 1 
create table persona (
    cod_cli VARCHAR2(11) PRIMARY KEY,
    dni VARCHAR2(11) UNIQUE,
    nombre VARCHAR2(30) NOT NULL,
    apellido1 VARCHAR2(30),
    apellido2 VARCHAR2(30),
    fecha_nac DATE DEFAULT SYSDATE(),
    tlfno NUMBER(10),
    estado_civil CHAR(1) CHECK (estado_civil IN 'S','C','V','D')
);

-- EJERCICIO 2
CREATE TABLE producto (
    cod_prod VARCHAR2(11) PRIMARY KEY,
    nom VARCHAR2(30) NOT NULL,
    descripcion VARCHAR2(100),
    precio NUMBER(4) CHECK (precio BETWEEN 100 AND 5),
    descuento NUMBER(3) CHECK (descuento IN 10%,20%,50%),
    stock NUMBER(10),
    stockMin NUMBER(4) DEFAULT 5,
    CONSTRAINT ck_stock CHECK (stock > stockMin)
);

-- EJERCICIO 3 
CREATE TABLE pers_prod (
    cod_prod VARCHAR2(11),
    dni_cliente VARCHAR2(11),
    fecha_compra DATE,
    PRIMARY KEY (cod_prod, dni_cliente, fecha_compra),
    FOREIGN KEY (cod_prod) REFERENCES producto(cod_prod),
    FOREIGN KEY (dni_cliente) REFERENCES persona(dni)
);

-- EJERCICIO 4
CREATE TABLE pers_prod (
    num_venta NUMBER PRIMARY KEY, -- no se como hacer el autonumerico
    cod_prod VARCHAR2(11) REFERENCES producto(cod_prod),
    dni_cliente VARCHAR2(11) REFERENCES persona(dni),
    fecha_compra DATE DEFAULT SYSDATE()
);

-- EJERCICIO 5
CREATE TABLE pers_prod1 (
    cod_prod NUMBER PRIMARY KEY, -- no se hacer autonumerico
    nom VARCHAR2(11) NOT NULL,
    descripcion VARCHAR2(100),
    color VARCHAR2(30) CHECK (color IN 'ROJO', 'VERDE', 'AZUL'),
    homologado BOOLEAN, -- seguramente no este bien
    precio NUMBER(5) CHECK (precio BETWEEN 5 AND 100)
);

-- EJERCICIO 6
CREATE TABLE autor (
    nombre VARCHAR2(30) PRIMARY KEY,
    nacionalidad VARCHAR2(30),
    fechaNac DATE
);

CREATE TABLE libro (
    titulo VARCHAR2(30) PRIMARY KEY,
    idioma VARCHAR2(30),
    nroPags NUMBER(4),
    referencia VARCHAR2(11),
    FOREIGN KEY (referencia) REFERENCES libro(titulo)
);

CREATE TABLE autor_escribe_libro (
    nombre_autor VARCHAR2(30),
    titulo_libro VARCHAR2(30),
    PRIMARY KEY (nombre_autor, titulo_libro),
    FOREIGN KEY (nombre_autor) REFERENCES autor(nombre),
    FOREIGN KEY (titulo_libro) REFERENCES libro(titulo)
);

CREATE TABLE edicion (
    ISBN NUMBER(30) PRIMARY KEY,
    anio NUMBER(5),
    titulo_libro VARCHAR2(30),
    FOREIGN KEY (titulo_libro) REFERENCES libro(titulo)
);

CREATE TABLE copia (
    numero NUMBER(6) PRIMARY KEY,
    alquiler NUMBER(10,2),
    ISBN_edicion NUMBER(30),
    FOREIGN KEY (ISBN_edicion) REFERENCES edicion(ISBN)
);

CREATE TABLE usuario (
    dni VARCHAR2(11) PRIMARY KEY,
    nombre VARCHAR2(30),
    apellido1 VARCHAR2(30),
    apellido2 VARCHAR2(30),
    domicilio VARCHAR2(20)
);

CREATE TABLE copia_prestamo_usuario (
    fechaPrestamo DATE,
    fechaDevolucion DATE,
    num_copia NUMBER(6),
    dni_usuario VARCHAR2(11),
    FOREIGN KEY (num_copia) REFERENCES copia(numero),
    FOREIGN KEY (dni_usuario) REFERENCES usuario(dni)
);

-- EJERICIO 7
CREATE TABLE proveedor (
    CUIT VARCHAR2(10) PRIMARY KEY,
    nombre VARCHAR2(30),
    web VARCHAR2(30),
    telefono NUMBER(9),
    ciudad VARCHAR2(20),
    comuna VARCHAR2(20),
    calle VARCHAR2(20),
    numero NUMBER(4),
    id_producto NUMBER(6),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE producto (
    id_producto NUMBER(6) PRIMARY KEY,
    nombre VARCHAR2(30),
    stock NUMBER(5),
    precio NUMBER(4,2)
);

CREATE TABLE venta (
    nro_factura NUMBER(6),
    descuento NUMBER(5,2),
    fecha DATE,
    montoFinal VARCHAR2(20)
);

CREATE TABLE cliente (

);

CREATE TABLE producto_participa_venta (
    montoTotalProducto VARCHAR2(20),
    precio_unidad NUMBER(5,2),
    cantidad_via_unidad NUMBER(6),
    nro_factura NUMBER(6),

);