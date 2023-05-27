-- sesion 12 de mayo

-- CURSORES CON PARAMETROS

DECLARE CURSOR cur_per(dep NUMBER, PUE varchar2(20)) 
IS 
    SELECT nombre, apellidos FROM empleados 
        WHERE departamento=dep AND puesto=pue; 
BEGIN OPEN cur_per(12, 'administrativo');…….



-- COLECCIONES
-- Primera posicion del array es la 1

-- Definir una coleccion (en la zona de declaraciones)
TYPE nombre_tipovarray IS VARRAY (numelementos) OF 
tipo_elementos_va_a_contener[NOT NULL];


-- Ejercicios de cursores

-- EJERCICIO 
-- Visualiza el apellido, el oficio y la comisión de los empleados cuya 
--comisión supera 500€. Resolverlo mediante cursores. 
set serveroutput on;
DECLARE
  -- Declaración del cursor
  CURSOR c_empleados IS
    SELECT apellido, oficio, comision
    FROM emple
        WHERE comision > 500;
BEGIN
  -- Recorrido del cursor y visualización de los valores
  FOR emple IN c_empleados LOOP
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || emple.apellido || 
    ', Oficio: ' || emple.oficio || 
    ', Comision: ' || emple.comision);
  END LOOP;

END;


-- Visualiza el apellido y la fecha de alta de todos los empleados 
-- ordenados por fecha de alta. Realizarlo con cursores normales y con 
-- el uso de FOR..LOOP.
set serveroutput on;
declare
    cursor cur_emple is
        select apellido, fecha_alt from emple
        order by fecha_alt;
begin
    for emple in cur_emple loop
        dbms_output.put_line('Apellido: ' || emple.apellido ||
        ' Fecha de alta: ' || emple.fecha_alt);
    end loop;
end;

-- Realizar un procedimiento con cursores explícitos que obtenga los 
-- siguientes datos: 
-- Para cada empleado: Apellido y salario ordenados por departamento. 
-- Para cada cambio de departamento: Número de empleados y suma de los 
-- salarios del departamento. 
-- Al final del listado: Número total de empleados y suma de todos los 
-- salarios. 
-- Repite el ejercicio utilizando FOR…LOOP









