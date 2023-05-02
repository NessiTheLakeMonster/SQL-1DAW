--* Lenguaje de control de datos

-- Creación de usuarios
create user NombreUsuario
identified by passworde;

grant select on editorial.alumno to peluqueria;

-- inserta el registro en la tabla emple de tu compañero


-- dar permisos para hacer select en las tablas de peluqueria desde supermercado
grant select on act_peluqueria.CITA to act_supermercado;

grant select on act_peluqueria.CLIENTE to act_supermercado;


grant select on act_peluqueria.CITA to act_supermercado;

grant select on act_peluqueria.CLIENTE to act_supermercado;

alter session set "_oracle_script"=true;
create role ines;

select * from dba_roles; --para ver los roles

grant select, insert on ACT_PELUQUERIA.CITA to ines;

create synonym i for act_peluqueria.CITA;

grant all to ACT_PELUQUERIA;

grant dba to ACT_PELUQUERIA;


-- nombre empleado, nombre cliente, nombre del cosmetico y la fecha

select EMPLEADO.nombre, CLIENTE.nombre, COSMETICO.nombre, VENTA.fecha_venta
from VENTA
         join CLIENTE
              on VENTA.DNI_CLIENTE = CLIENTE.DNI
         join COSMETICO
              on VENTA.COD_COSMET = COSMETICO.COD
         join EMPLEADO
              on VENTA.DNI_EMPLEADO = EMPLEADO.DNI;


create view vista_ventas
as
select EMPLEADO.nombre as Nom_emple, CLIENTE.nombre as Nom_clie, COSMETICO.nombre as Nom_cosme, VENTA.fecha_venta
from VENTA
         join CLIENTE
              on VENTA.DNI_CLIENTE = CLIENTE.DNI
         join COSMETICO
              on VENTA.COD_COSMET = COSMETICO.COD
         join EMPLEADO
              on VENTA.DNI_EMPLEADO = EMPLEADO.DNI;