-- ACTIVIDAD 8

-- Ejercicio 1
create or replace trigger tr_maxEmpleDepartamento
before insert on emple
for each row
declare
    num_empleados NUMBER;
begin
    select count(*) into num_empleados
    from emple
    where dept_no = :new.dept_no;
    
    if num_empleados >= 8 then
        RAISE_APPLICATION_ERROR(-20001, 'No se puede dar de alta más de 8 empleados en el mismo departamento.');
    end if;
end tr_maxEmpleDepartamento;

drop trigger tr_maxEmpleDepartamento;

-- Ejercicio 2
create or replace trigger tr_aumentarSalario
before update of salario
on emple
for each row
declare
    aumento number := 1.20;
begin
    if :new.salario > (:old.salario * aumento) then
        RAISE_APPLICATION_ERROR(-20001, 'No se puede incrementar el salario');
    end if;
end tr_aumentarSalario;

drop trigger tr_aumentarSalario;

update emple
set salario = salario * 1.20
where emp_no = '7090';

-- Ejercicio 3
create table empleados_baja(
    emp_no number(4),
    fecha_hoy timestamp,
    usuario varchar2(30),
    fecha date
);

create or replace trigger tr_bajaEmpleados
after delete on emple
for each row
begin
    insert into empleados_baja values (:old.emp_no, sysdate, user, :old.fecha_alt);
    dbms_output.put_line('El empleado borrado se añadido a la tabla');
end tr_bajaEmpleados;

drop trigger tr_bajaEmpleados;

delete from emple where apellido like 'b';

-- Ejercicio 4
CREATE OR REPLACE TRIGGER tr_impedir_salario_max
BEFORE INSERT OR UPDATE OF salario ON emple
FOR EACH ROW
DECLARE
    salario_max NUMBER;
    salario_dept NUMBER;
BEGIN

    salario_max:= 10000;
    SELECT SUM(salario) INTO salario_dept FROM depart
    JOIN emple ON depart.dept_no = emple.dept_no;

    IF inserting THEN
        IF (:NEW.salario + salario_dept) > salario_max THEN
                DBMS_OUTPUT.PUT_LINE('Se ha insertado el empleado correctamente.');
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Se supera el límite de salario. No se realiza la inserción.');
        END IF;
    END IF;

    IF updating THEN
        IF (:NEW.salario + salario_dept - :OLD.salario) > salario_max THEN
                DBMS_OUTPUT.PUT_LINE('Se ha actualizado el salario correctamente.');
        ELSE
             RAISE_APPLICATION_ERROR(-20002, 'Se supera el límite de salario. No se actualiza el salario.');

        END IF;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

drop trigger tr_salarioMax;

update emple 
set salario = salario + 300 
where emp_no = '7788';


-- Ejercicio 5
create or replace trigger tr_subidaPrecio
before update of precio
on libros
for each row
declare
    precio_viejo number;
begin
    precio_viejo := :old.precio;
    if :new.precio > 50 and :new.precio - precio_viejo <> 1 then 
        RAISE_APPLICATION_ERROR(-20001, 'El precio solo puede incrementarse de 1 en 1 si supera los 50 euros');
    end if;
end tr_subidaPrecio;

update libros 
set precio = 55 
where codigo = 100;

drop trigger tr_subidaPrecio;

-- Ejercicio 6
create table control1 (
    usuario varchar2(30),
    fecha timestamp,
    precio_antiguo number(4),
    precio_nuevo number(4)
);

create or replace trigger tr_multiusos
before update or insert or delete 
on libros
for each row
begin
    insert into control1 values (user,sysdate,:old.precio,:new.precio);
end;

update libros
set precio = precio + 30
where codigo = 105;

-- Ejercicio 7
create or replace trigger tr_modEmpleado
before update on empleados
for each row
begin
    if updating ('documento') then
        insert into controlCambios values (user, sysdate, :old.documento, :new.documento);
    end if;
    
    if updating ('nombre') then
        insert into controlCambios values (user, sysdate, :old.nombre, :new.nombre);
    end if;
    
    if updating ('domicilio') then
        insert into controlCambios values (user, sysdate, :old.domicilio, :new.domicilio);
    end if;
    
    if updating ('sección') then
        insert into controlCambios values (user, sysdate, :old.sección, :new.sección);
    end if;
end;

drop trigger tr_modempleado;

update empleados
set nombre = 'Ines Barrera'
where documento = 22222222;

-- Ejercicio 8
create or replace trigger tr_addEmpleado
before insert on empleados
for each row
begin
    if inserting then
        insert into controlCambios values (user, sysdate, null, :new.documento);
    end if;
    
    exception
    when others then
        dbms_output.put_line('Error' || sqlerrm);
end;

drop trigger tr_addEmpleado;

insert into empleados values (28888888, 'Ana Llerena', 'Cruces 23', 'Administracion');

-- Ejercicio 9
create or replace trigger tr_removeEmpleado
before delete on empleados
for each row
begin
    if deleting then
        insert into controlCambios values (user, sysdate, :old.documento, null);
    end if;
    
    exception
    when others then
        dbms_output.put_line('Error' || sqlerrm);
end;

delete from empleados where documento = 28888888;

----------------


drop trigger tr_impedir_salario_max;

exception
    when others then
        dbms_output.put_line('Error' || sqlerrm);







