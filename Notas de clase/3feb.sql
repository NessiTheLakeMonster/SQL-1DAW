CREATE TABLE PRUEBA (
    DNI VARCHAR2(12),
    LETRA CHAR(1),
    NOMBRE VARCHAR2(30) DEFAULT 'Pepe',
    TLFNO NUMBER(12),
    PRIMARY KEY (DNI, LETRA),
    CHECK (TLFNO > 5 AND NOMBRE='Juan')
);

INSERT INTO PRUEBA VALUES (
    '1',
    'D',
    'Juan',
    4
);

DROP TABLE PRUEBA; -- Para borrar la tabla creada