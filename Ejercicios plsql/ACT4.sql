-- ACTIVIDAD 4

-- Ejercicio 1 -----------------------------------------------------------------
alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
set serveroutput on;

-- apartado b
create or replace trigger tr_addLibros
before insert 
on libros
for each row
begin
    if inserting then
        insert into control values (user, sysdate);
    end if;
    
    exception
        when others then
            dbms_output.put_line('Error' || sqlerrm);
end tr_addLibros;

-- apartado c
select * from user_triggers
where trigger_name = 'tr_addLibros';

-- apartado d
insert into libros values (100, 'Titulo 1', 'Autor 1', 10);