-- ACTIVIDAD 2

-- Ejercicio 1
set serveroutput on;

create or replace procedure pr_modOficio(numero in number, cadena in varchar2)
as
begin
    update emple set oficio = cadena 
    where emp_no = numero;
end;

execute pr_modOficio(7369,'EMPLEADO');

-- Ejercicio 2
set serveroutput on;

create or replace procedure pr_modDepar(numero_e in number, numero_d in number)
as
begin
    update emple set dept_no = numero_d
    where emp_no = numero_e;
end;

execute pr_modDepar(7369, 10);

-- Ejercicio 3
set serveroutput on;

create or replace procedure pr_sumar(n1 in number, n2 in number)
as
    resultado number;
begin
    resultado := n1 + n2;
    dbms_output.put_line('La suma de ' || n1 || ' + ' || n2 || ' = ' || 
    resultado);
end;

execute pr_sumar(2,3);

-- Ejercicio 4
set serveroutput on;

create or replace procedure pr_revCadena(cadena in varchar2)
as
    revCadena varchar2(100);
begin
    for i in reverse 1..length(cadena) loop
        revCadena := revCadena || SUBSTR(cadena, i, 1);
    end loop;
    dbms_output.put_line('Cadena original -> ' || cadena);
    dbms_output.put_line('Cadena al reves -> ' || revCadena);
end;

execute pr_revCadena('La casa lila');

-- Ejercicio 5
set serveroutput on;

create or replace function fun_devFecha(fecha date)
return varchar2
is
    anio varchar2(100);
begin
    anio := to_char(fecha,'YYYY');
    dbms_output.put_line('Año -> ' || anio);
    
    return anio;
end;

select fun_devFecha('02/03/2001') from dual;

-- Ejercicio 6
set serveroutput on;

create or replace function fun_devAnios(fecha1 date, fecha2 date)
return number
is
    anios number;
begin
    anios := trunc((months_between(fecha1,fecha2))/12);
    dbms_output.put_line('Nº años -> ' || anios);
    
    return anios;
end;

select fun_devAnios(sysdate, '02/03/2001') from dual;

-- Ejercicio 7
set serveroutput on;


