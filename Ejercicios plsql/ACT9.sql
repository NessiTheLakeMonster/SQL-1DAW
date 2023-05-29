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

-- Ejercicio 3
create table control_antiguedad (
    usuario varchar2(30),
    fecha timestamp,
    sueldo_antiguo number(7),
    salario_nuevo number(7),
    comision_antigua number(7),
    comision_nueva number(7)
);

create or replace trigger tr_subirSueldoAntiguedad
before update of salario
on emple
for each row
declare
    anios number;
    nuevo_sueldo number;
    nuevo_comision number;
    fecha date;
begin
    select (salario * 1.02) into nuevo_sueldo
    from emple;
    select (comision * 1.02) into nuevo_comision
    from emple;
    select fecha_alt into fecha from emple;
    
    anios := (months_between(sysdate,fecha))/12;
 
    if anios > 4 then
        insert into control_antiguedad values (user, sysdate, :old.salario, :new.salario, :old.comision, :new.comision);
    end if;
    
    exception
    when others then
        dbms_output.put_line('Error' || sqlerrm);
end tr_subirSueldoAntiguedad;

update emple set salario = salario * 1.02 ;

-- Ejercicio 4
create or replace trigger tr_addDepart
before insert on depart
for each row
declare
    new_director emple.dir%type;
    anios number;
begin
    select emp_no into new_director
    from emple
    where upper(oficio) not like 'DIRECTOR'
    order by fecha_alt
    fetch first 1 row only;
    
    update emple
    set dir = new_director
    where dept_no = :new.dept_no;

end;

insert into depart values (50, 'MARKETING', 'PUERTOLLANO');
insert into 

select emp_no 
from emple
where upper(oficio) not like 'DIRECTOR'
order by fecha_alt
fetch first 1 row only;
