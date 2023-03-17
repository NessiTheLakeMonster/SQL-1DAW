create table nombre (
    ___ varchar2(30) generated always as identity primary key,
    ___ char(1) check (___ IN '_','_'),
    constraint ck_ check (__ between __ and __),
    foreing key (__) references __(__);
);

alter table ___ add primary key (__);
alter table ___ drop primary key (__);

alter table ___ rename to ___;

alter table ___ drop column ___;

alter table ___ add constraint cp_ primary key (_);
alter table ___ add constraint cf_ foreign key (__) references ____(__);

alter table ____ add constraint ck_ check (edad >= 18);

alter table ___ drop constraint ck_;
alter table ___ disable constraint __;

drop table ____;
delete ____ where edad < 18;

insert into ___ values (___);
insert into ___(dni,nombre) values ('059347','PEPE');
insert into ___ values (sysdate);

create sequence ___
start with 1
increment by 1;

insert into ___ values (__.NEXTVAL)

on delete cascade

-- * TEORÍA DE CONJUNTOS (OPERADORES DE CONJUNTOS)
-- Las SELECTS deben tener el mismo número de columnas

---------------------------------------------------------------------------------
-- * UNION
-- Unión de dos conjuntos.
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
UNION 
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 

-- Si hay alumnos que estan en ambas tablas, solo lo coge de una de ellas
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
UNION ALL -- ! NO discrimina los duplicados
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 

-------------------------------------------------------------------------------
-- * INTERSECT
-- salen los comunes a ambas tablas
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
INTERSECT
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 

-------------------------------------------------------------------------------
-- * MINUS
-- saca solo los que se encuentran en una sola de las tablas
SELECT NOMBRE, APELLIDO
FROM AL_ACTUALES
MINUS
SELECT NOMBRE, APELLIDO
FROM AL_FUTUROS; 
-- me saca los alumnos de los actuales que no se encuentran en la de futuros
-- ? en este caso es muy importante el orden de los SELECT



-- FUNCIONES CON DATE
-- Formatear una date a una cadena de caracteres
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') FROM DUAL;
-- Formatear una cadena en una date

SELECT SYSDATE FROM DUAL;

-- Con la fecha de hoy sacar el mes en el que se esta
SELECT TO_CHAR(SYSDATE, 'MM') +2 FROM DUAL;

-- Cuantos dias tengo
SELECT SYSDATE - TO_DATE('02/03/01') FROM DUAL;

-- Cuantos años tengo
SELECT (SYSDATE-TO_DATE('02/03/01'))/365 FROM DUAL;

-- La funcion ADD_MONTHS suma o resta meses
SELECT ADD_MONTHS(SYSDATE, -6) FROM DUAL;

-- La funcion LAST_DAY coge el ultimo dia del mes de la fecha especificada
SELECT LAST_DAY(TO_DATE('03/01', 'MM/YY')) FROM DUAL;

-- Cuantos meses he vivido
SELECT

-- Funcion NEXT_DAY