-- ACTIVIDAD 1

-- Ejercicio 1
set serveroutput on;
create or replace procedure pa_noTotal
as
    num_empleados number;
    num_departamentos number;
begin
    select count(*) into num_empleados from emple;
    select count(distinct dept_no) into num_departamentos from depart;
    dbms_output.put_line('El número total de empleados es ' || num_empleados);
    dbms_output.put_line('El número total de departamentos es ' || num_departamentos);
end;

execute pa_noTotal;

-- Ejercicio 2
set serveroutput on;
create or replace procedure pa_mostrarEmple
as
    ape varchar2(30);
    dep varchar2(30);
begin
    select apellido into ape 
    from emple 
        where emp_no = 7839;
        
    select depart.dnombre into dep
    from depart join emple
        on depart.dept_no = emple.dept_no
        where emple.emp_no = 7839;
        
    dbms_output.put_line('El empleado con número 7839 se llama ' || ape);
    dbms_output.put_line('y trabaja en el departamento de ' || dep);
end;

execute pa_mostrarEmple;

-- Ejercicio 3
set serveroutput on;
create or replace procedure pa_mostrarEmple2(numero in number)
as
    ape varchar2(30);
begin
    select apellido into ape from emple
    where emp_no = numero;
    
    dbms_output.put_line('El nombre del empleado con numero ' || numero
    || ' es ' || ape);
end;

execute pa_mostrarEmple2(7369);


-- Ejercicio 4
set serveroutput on;

create or replace function contador_anios(empz date, fin date)
return number 
is anios number;
begin
    anios := 0;
    anios := (months_between(fin,empz))/12;
    return anios;
end;

select contador_anios('01/02/2000','01/02/2009') from dual;


-- Ejercicio 5
set serveroutput on;

create or replace function mostrar_salario(s number)
return varchar2
is 
    cadena varchar2(100);
begin
    if (s >= 5000) then
        cadena := 'El salario es igual o superior a 5000';
    elsif (s <= 1500) then
        cadena := 'El salario es menor o igual a 1500';
    elsif (s >= 2500 and s < 5000) then
        cadena := 'El salario esta comprendido entre 2500 y 5000';
    end if;
    
    return cadena;
end;

select mostrar_salario(3000) from dual;


-- Ejercicio 6 [IMPRIME TODA LA TABLA Y NO SE PORQUE]
set serveroutput on;

create or replace function mostrar_comision(numero number)
return varchar2
is 
    cadena varchar2(100);
    c number;
begin
    select comision into c from emple 
        where emp_no = numero;
    
    if (c >= 500) then
        cadena := 'Comisión mayor de 500 €';
    elsif (c < 500) then
        cadena := 'Comisión menor de 500 €';
    elsif (c = null) then
        cadena := 'No tiene comisión';
    end if;
    
    return cadena;
end;

select mostrar_comision(emp_no) from emple;
select mostrar_comision(emp_no) from emple
    where emp_no = 7499;


-- Ejercicio 7
set serveroutput on;

create or replace function calculo_antiguedad(numero number)
return varchar2
is
    cadena varchar2(100);
    anios number;
    antiguedad number;
    empz date;
    sysdate date;
begin
    select fecha_alt into empz from emple
        where emp_no = numero;
    
    anios := (months_between(sysdate,empz))/12;
    
    if (anios >= 34) then
        antiguedad := anios/5;
        cadena := ('La antiguedad del trabajador es de ' || anios);
    else
        antiguedad := 0;
        cadena := 'El trabajador no tiene antiguedad';
    end if;
    
    return cadena;
end;

select calculo_antiguedad(emp_no) from emple;


-- Ejercicio 8


