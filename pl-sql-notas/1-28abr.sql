-- Primera sesion de PLSQL

set serveroutput on; -- Para sacar las cosas por pantalla 

declare
    cadena varchar2(30);
    cadena2 varchar2(30) := 'hola';
    
begin
    cadena := 'Hola' || 'Mundo';
    dbms_output.put_line(cadena);
end;
---------------------
set serveroutput on;
declare
    totalLib number;
begin
    select count(*)into totalLib from libros;
    dbms_output.put_line('El número total de libros es: ' || totalLib);
end;
--------------------
-- escribir el titulo del libro de la editorial 3
set serveroutput on;
declare
    titLib varchar2(30);

begin
    select nombre into titLib from libros
        where cod_edit = 3;
    dbms_output.put_line('Los libros con codigo 3 son: ' || titlib);
end;
--------------------
set serveroutput on;
declare
    titLib libros.nombre%type; -- se usan para recoger datos de la bd
    miLibro libros%rowtype;
    segunLib miLibro%type; -- se heredan los tipos

begin
    select * into milibro from libros
        where cod_edit = 3;
    dbms_output.put_line('Codigo: ' || milibro.codigo);
    dbms_output.put_line('Autor: ' || milibro.autor);
end;
--------------------
set serveroutput on;
declare
    v NUMBER:=2;

BEGIN 
    v:=v*2;
    DECLARE
        z NUMBER:=3;
    BEGIN
        z:=v*3;
        DBMS_OUTPUT.PUT_LINE(z); --escribe 12
        DBMS_OUTPUT.PUT_LINE(v); --escribe 4
    END;
    DBMS_OUTPUT.PUT_LINE(v*2); --escribe 8
END;
--------------------
CREATE OR REPLACE PROCEDURE pa_libros_aumentar10
AS
BEGIN
    UPDATE libros set precio=precio+precio*0.1;
END;

execute pa_libros_aumentar10;

drop procedure pa_libros_aumentar10;
--------------------
CREATE OR REPLACE PROCEDURE pa_libros_aumentar(aeditorial in varchar2, aporcentaje in 
number default 10)
as 
BEGIN 
    UPDATE libros set precio=precio+(precio*aporcentaje/100)
        WHERE editorial=aeditorial;
END;

execute pa_libros_aumentar('Planeta',30); 
execute a_libros_aumentar('Planeta');
----------------------
-- Procedimiento que crea una tabla con los libros de un autor, cuyo 
-- título se pasa como parámetro. Se utiliza la variable ‘vautor’ para 
-- almacenar el valor del autor
create or replace procedure 


