-- ACTIVIDAD 7

set serveroutput on;

-- Ejercicio 1
declare
    n number := 2;
begin
    for i in 1..5 loop
        dbms_output.put_line(i*n);
    end loop;
end;

-- Ejercicio 2
declare
    cantidad number := 25;
    precio number := 2;
    iva number := 15;
    pagar number;
begin
    dbms_output.put_line(cantidad * precio);
    pagar := (cantidad * precio + (iva / 100));
    dbms_output.put_line(pagar);
end;

-- Ejercicio 4

