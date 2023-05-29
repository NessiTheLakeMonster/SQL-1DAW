-- ACTIVIDAD 3

--Ejercicio 1 -----------------------------------------------------------------

-- apartado a
create or replace procedure pa_empleados_aumentarSueldo(ayear in number, aporcentaje in number)
as
begin
    update empleados 
    set sueldo = (sueldo + (sueldo * aporcentaje/100))
    where (extract(year from sysdate) - extract(year from fechaingreso)) > ayear;
end;

execute pa_empleados_aumentarSueldo(10, 20);
execute pa_empleados_aumentarSueldo(8, 10);

-- apartado b
create or replace procedure pa_empleados_ingresar(doc in empleados.documento%type, 
nom in empleados.nombre%type, ape in empleados.apellido%type)
as
begin
    insert into empleados values(doc, nom, ape, null, null);
end;

execute pa_empleados_ingresar('22777777', 'Ines', 'Barrera');

-- Ejercicio 2 -----------------------------------------------------------------
create or replace function f_condicion(nota notas.nota%type)
return varchar2
is
    cadena varchar2(30);
begin
    if nota >= 5 then
        cadena := 'Aprobado';
    else
        cadena := 'Suspenso';
    end if;
    
    return cadena;
end;

select nombre, f_condicion(nota) from notas;

-- Ejercicio 3 -----------------------------------------------------------------

-- apartado a
create or replace function f_stock(minStock productos.stockminimo%type,
actStock productos.stockactual%type)
return varchar
is
    cadena varchar2(30);
begin
    if minStock = 0 then
        cadena := 'Faltante';
    elsif actStock < minStock then
        cadena := 'Reponer';
    elsif actStock >= minStock then
        cadena := 'Normal';
    end if;
    
    return cadena;
end;

select codigo, stockMinimo, stockActual, f_stock(stockMinimo, stockActual) as estado
from productos;

-- apartado b
create or replace function f_stock2(minStock productos.stockminimo%type,
actStock productos.stockactual%type)
return varchar2
is
    cadena varchar2(100);
    valor number;
begin
    if minStock = 0 then
        valor := minStock;
        cadena := ('Faltante, cantidad que falta -> ' || valor);
    elsif actStock < minStock then
        valor := minStock - actStock;
        cadena := ('Reponer, cantidad que falta -> ' || valor);
    elsif actStock >= minStock then
        cadena := 'Normal';
    end if;
    
    return cadena;
end;

select codigo, stockMinimo, stockActual, f_stock2(stockMinimo, stockActual) as estado
from productos;

-- Ejercicio 4 -----------------------------------------------------------------

-- apartado a
create or replace function f_mayorEdad(edad pacientes.edad%type)
return varchar2
is
    cadena varchar2(100);
begin
    if edad >= 18 then
        cadena := ('Mayor de edad');
    else
        cadena := ('Menor de edad');
    end if;
    
    return cadena;
end;

select documento, nombre, edad,f_mayorEdad(edad) from pacientes;

-- apartado b
create or replace function f_genero(sexo pacientes.sexo%type)
return varchar2
is
    cadena varchar2(100);
begin
    if upper(sexo) like 'F' then
        cadena := 'Femenino';
    else
        cadena := 'Masculino';
    end if;
    
    return cadena;
end;

select documento, nombre, edad, f_mayorEdad(edad), sexo, f_genero(sexo) from pacientes;

-- Ejercicio 10 ----------------------------------------------------------------
set serveroutput on;

declare
    sumatorio number := 0;
begin
    for i in 1..5 loop
        sumatorio := sumatorio + i;
    end loop;
    
    dbms_output.put_line('El sumatorio de 5 es: ' || sumatorio);
end;
    

