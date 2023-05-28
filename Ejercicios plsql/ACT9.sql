-- ACTIVIDAD 9

-- Ejercicio 1
set serveroutput on;

create or replace trigger tr_subidaSueldo
before update of salario
on emple
for each row
declare
    max_increase NUMBER := 500;
begin
    if :NEW.salario > (:OLD.salario + max_increase) then
        RAISE_APPLICATION_ERROR(-20001,'Err. Modificacion no permitida');
    end if;
end tr_subidaSueldo;

update emple
set salario = salario + 600
where emp_no = '7369';

-- Ejercicio 2
set serveroutput on;

create or replace trigger tr_jornadaLaboral
before insert or update or delete on emple
for each row
declare
    dia_semana varchar2(20);
begin
    select to_char(sysdate, 'DAY') into dia_semana from dual;
    
    if upper(dia_semana) like 'SATURDAY' or upper(dia_semana) like 'SUNDAY' then
        dbms_output.put_line('No estan permitidas las operaciones en el dia de hoy');
    end if;
end tr_jornadaLaboral;

update emple
set apellido = 'b'
where emp_no = '7900';
