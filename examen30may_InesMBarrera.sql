-- INES MARIA BARRERA LLERENA 1º DAW

DROP TABLE ASISTENCIAS;
DROP TABLE NOTAS;
DROP TABLE CURSOS;
DROP TABLE PROFESORES;
DROP TABLE ESTUDIANTES;

CREATE TABLE Estudiantes (
  id_estudiante INT PRIMARY KEY,
  nombre VARCHAR(50),
  edad INT,
  direccion VARCHAR(100),
  telefono VARCHAR(15)
);

CREATE TABLE Profesores (
  id_profesor INT PRIMARY KEY,
  nombre VARCHAR(50),
  especialidad VARCHAR(50),
  telefono VARCHAR(15)
);

CREATE TABLE Cursos (
  id_curso INT PRIMARY KEY,
  nombre VARCHAR(50),
  duracion INT,
  id_profesor INT,
  FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor)
);

CREATE TABLE Notas (
  id_nota INT PRIMARY KEY,
  id_estudiante INT,
  id_curso INT,
  calificacion DECIMAL(4, 2),
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Asistencias (
  id_asistencia INT PRIMARY KEY,
  id_estudiante INT,
  id_curso INT,
  fecha DATE,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

INSERT INTO Estudiantes (id_estudiante, nombre, edad, direccion, telefono) VALUES (1, 'Juan Pérez', 18, 'Calle Principal 123', '555-1234');
INSERT INTO Estudiantes (id_estudiante, nombre, edad, direccion, telefono) VALUES (2, 'María López', 20, 'Avenida Central 456', '555-5678');

INSERT INTO Profesores (id_profesor, nombre, especialidad, telefono) VALUES (1, 'Pedro Rodríguez', 'Matemáticas', '555-1111');
INSERT INTO Profesores (id_profesor, nombre, especialidad, telefono) VALUES (2, 'Ana García', 'Historia', '555-2222');

INSERT INTO Cursos (id_curso, nombre, duracion, id_profesor) VALUES (1, 'Álgebra', 60, 1);
INSERT INTO Cursos (id_curso, nombre, duracion, id_profesor) VALUES (2, 'Historia del Arte', 90, 2);

INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (1, 1, 1, 8.5);
INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (2, 2, 2, 9.2);
INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (3, 2, 1, 5);
INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (4, 1, 2, 6.3);
INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (5, 1, 2, 6.3);
INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (7, 3, 2, 6.3);

INSERT INTO Asistencias (id_asistencia, id_estudiante, id_curso, fecha) VALUES (1, 1, 1, '15/05/2023');
INSERT INTO Asistencias (id_asistencia, id_estudiante, id_curso, fecha) VALUES (2, 2, 2, '15/05/2023');


--------------------------------------------------------------------------------

-- Ejercicio 1 -----------------------------------------------------------------
create or replace function f_subirCalificacion(nombre_est estudiantes.nombre%type, 
porcentaje number)
return number
is
    calificacion_final notas.calificacion%type;
begin
    select (notas.calificacion + (notas.calificacion * porcentaje/100)) into calificacion_final
    from notas join estudiantes
    on estudiantes.id_estudiante = notas.id_estudiante
    where estudiantes.nombre like nombre_est;
    
    calificacion_final := calificacion_final + (calificacion_final * porcentaje/100);
    
    return calificacion_final;
end;

select f_subirCalificacion('Juan Pérez', 20) 
from notas join estudiantes
on estudiantes.id_estudiante = notas.id_estudiante;

select (notas.calificacion + (notas.calificacion * 0.2))
from notas join estudiantes
on estudiantes.id_estudiante = notas.id_estudiante
where estudiantes.nombre like 'Juan Pérez';

-- Ejercicio 2 -----------------------------------------------------------------
create or replace procedure p_dir(porcentaje in number)
as
begin
    update notas
    set calificacion = (calificacion + (calificacion * 2/100))
    where id_estudiante =  
            (select id_estudiante from estudiantes
            where upper(direccion) like '%PUERTOLLANO%');
end;

execute p_dir(20);

insert into estudiantes values (3, 'Ines Barrera', 22, 'Calle cruces Puertollano', 22-33);
-- Ejercicio 3 -----------------------------------------------------------------
create table cont_subcalif (
    usuario varchar2(30),
    fecha timestamp
);

create or replace trigger tr_bloquesub
before update of calificacion 
on notas
for each row
declare
    max_subida number := 10;
    max_calif number;
begin
    max_calif := :old.calificacion + (:old.calificacion * max_subida/100);
    
    if max_calif < :new.calificacion then
        insert into cont_subcalif values (user, sysdate);
    end if;
    
    exception
        when others then
            dbms_output.put_line('Error: ' || sqlerrm);
end tr_bloquesub;

update notas
set calificacion = calificacion + (calificacion * 0.2)
where id_nota = 5;

-- Ejercicio 4 -----------------------------------------------------------------
create table cont_elimnot (
    id_est number(38),
    id_cur number(38),
    fecha timestamp,
    usuario varchar2(40)
);

set serveroutput on;

create or replace trigger tr_eliminanot
before delete 
on notas
for each row
begin
    if deleting then
        insert into cont_elimnot values (:old.id_estudiante, :old.id_curso, 
        sysdate, user);
    end if;
    
    exception
        when others then
            dbms_output.put_line('Error: ' || sqlerrm);
end tr_eliminanot;

delete notas where id_nota = 5;

-- Ejercicio 5 -----------------------------------------------------------------

-- apartado a
alter trigger tr_eliminanot disable;
alter trigger tr_bloquesub disable;

-- apartado b
create table cont_media (
    fechaYhora timestamp,
    nota_anterior number(4,2) default 0,
    nota_actual number(4,2),
    motivo varchar2(50)
);

create or replace trigger tr_notas
before insert or update of calificacion
on notas
for each row
declare
    media_notas number;
begin
    select avg(calificacion) into media_notas from notas;
    -- apartado b
    if inserting then
        if :new.calificacion < media_notas then
            insert into cont_media values (sysdate, :old.calificacion, 
            :new.calificacion, 'INSERTAR NOTA');
        end if;
    end if;
    
    -- apartado c
    if updating then
        if :new.calificacion > 10 then
            insert into cont_media values (sysdate, :old.calificacion, 
            :new.calificacion, 'MODIFICAR NOTA');
        end if;
    end if;

end tr_notas;

INSERT INTO Notas (id_nota, id_estudiante, id_curso, calificacion) VALUES (6, 1, 2, 5);
update notas set calificacion = 11 where id_nota = 6;

select avg(calificacion) from notas;