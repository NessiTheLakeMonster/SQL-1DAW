-- 8 de mayo

-- Uso de funciones

CREATE OR REPLACE FUNCTION f_incremento(avalornumber, aincnumber) 
RETURN number 
IS BEGIN 
    RETURN avalor+(avalor*ainc/100); 
END;

-- se llama a la funcion 
SELECT titulo, precio, f_incremento10(precio) FROM libros;

select titulo, precio
from libros
where precio = f_incremento(select min(precio) 
                                from libros),5);

-- SINTAXIS DEL CONDICIONAL IF
if condicion then
    [instrucciones]
end if;

if condicion then
    instrucciones
else
    intrucciones
end if;

-- Realiza una función que recibe un parámetro de tipo numérico 
-- y retorna una cadena de caracteres. Se define una variable 
-- (valorretornadovarchar). Averiguar si el valor enviado es menor 
-- o igual a 40, si lo es, almacenamos en valorretornado“económico”, 
-- en caso contrario “costoso”. Se debe retornar esa variable.
create or replace function costo(valor number)
return varchar2 is
    cadena varchar2(50);
begin
    if (valor >= 40) then
        cadena := 'CARO';
    else
        cadena := 'BARATO';
    end if;
    return cadena;
end;

select nombre, costo(precio)
from libros;

-- SINTAXIS IF ANIDADOS
if condicion then
    instrucciones
else if condicion2 then
    instrucciones2
else if ...
end if;

-- SINTAXIS SWITCH O WHEN
case valor_por_comparar
    when valor then
        sentencia;
        sentencia;
    when valor2 then sentencia;
    else sentencia;
end case;

-- SINTAXIS WHILE
while condicion loop
    sentencias
end loop;

-- Realiza un procedimiento que haga las tablas de multiplicar del 1 al 5

-- Realiza un procedimiento que dado un parámetro de entrada del 1…10 
-- pinte la tabla correspondiente.

-- SINTAXIS DO WHILE
loop
    sentencias
    exit when condicion;
        sentencias;
end loop;

-- SINTAXIS FOR
for variable_contador in[reverse] limite_bajo ... limite_alto loop
    sentencias
end loop;

-- Realiza una función que reciba una fecha y retorna una cadena 
-- de caracteres indicando el nombre del mes de la fecha enviada 
-- como argumento.
create or replace function conversor_fecha(sysdate date)
return date
is mes varchar2(30);
begin
    mes := '';
    mes := to_char(sysdate, 'MONTH');
    return mes;
end;

select conversor_fecha(sysdate) from dual;

-------------------------------------------------------------------------------

-- Contar del 20 al 1
<<bucle>>
FOR i IN REVERSE 0..19 LOOP
    DBMS_OUTPUT.PUT_LINE(i + 1);
    
    EXIT bucle WHEN i=20; 
END LOOP;

DECLARE
    i NUMBER;
BEGIN
    FOR i IN 0..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i*3);
    END LOOP;
END;    

-- Tablas de multiplicar
DECLARE i NUMBER;
BEGIN 
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('-----' ||  i || '-----');
        FOR j iN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(i*j);
        END LOOP;
    END LOOP;
END;


