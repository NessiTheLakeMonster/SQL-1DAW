-- 10 de febrero

-- ALTER

create table alteraciones (
    dni varchar2(11),
    nombre varchar2(30),
    edad number(3)
);

alter table alteraciones add primary key (dni); -- alterar para crear una clave primaria
alter table alteraciones drop primary key; -- alterar para quitar la clave primaria
alter table alteraciones add primary key (dni,nombre);
alter table alteraciones drop primary key; -- se borran todas las claves da igual por cuantos campos este compuesta

-- Clave primaria con alter y constraint
alter table alteraciones add constraint
    cp_alt primary key (dni); -- cp bc es de clave primaria (pk primary key)

alter table alteraciones drop constraint cp_alt; -- para quitar el constraint que se creo antes

-- Desactivar y activar constraint
alter table alteraciones disable constraint cp_alt;

-- Alter de un check
alter table alteraciones add constraint ck_edad check (edad >= 18);

-- Hacemos un insert a esa tabla
insert into alteraciones values(11111,'nombre1',10); -- no se insertara pues no cumple el check
insert into alteraciones values(22222,'nombre1',20);
insert into alteraciones values(44444,'nombre1',8); -- no se insertara pues no cumple el check
insert into alteraciones values(33333,'nombre1',34);

-- Desactivar el constraint del check
alter table alteraciones disable constraint ck_edad;

---------------------------------------------------------------------------------------

create table alteCurso (
    dni varchar2(11),
    nom_curso varchar2(30)
);

alter table alteCurso add primary key (dni,nom_curso); -- creamos las claves primarias

-- Hacemos que dni de alteCurso sea una foranea al dni de alteraciones con constraint
alter table alteCurso add constraint cf_dni foreign key (dni) references alteraciones(dni); -- cf aka clave foranea

------------------------------------------------------------------------------------------
-- BORRADO DE TABLAS Y DATOS
-- delete -> borra campos, borras filas enteras
-- drop -> borra tablas enteras
-- Ambos son irreversibles una vez se han ejecutado

drop table alteraciones;

insert into alteraciones values(11111,'nombre1',10); 
insert into alteraciones values(22222,'nombre1',20);
insert into alteraciones values(44444,'nombre1',8); 
insert into alteraciones values(33333,'nombre1',34);

delete alteraciones; -- borra el contenido de la tabla, la tabla sigue exixtiendo

insert into alteraciones values(11111,'nombre1',10); 
insert into alteraciones values(22222,'nombre1',20);
insert into alteraciones values(44444,'nombre1',8); 
insert into alteraciones values(33333,'nombre1',34);

delete alteraciones where edad < 18; -- se borra la fila entera donde no se cumpla

--------------------------------------------------------------------------------------------
-- ALTER DE MODIFICACI�N DE TABLAS

alter table alteraciones rename to alt; -- renombrar tablas (no lo he ejecutado sigo usando el nombre alteraciones)

alter table alteraciones drop column nombre; -- eliminar una determinada columna

alter table alteraciones add ( -- añadir dos columnas a la tabla
    apellido1 varchar2(30),
    apellido2 varchar2(30)
);

alter table alteraciones drop (apellido1,apellido2);-- borrar las dos columnas

----------------------------------------------------------------------------------------
-- MODIFICAR VALORES DENTRO DE LA TABLA --> UPDATE

update alteraciones set nombre = 'pepe'; -- cambiar� todos los 'nombre1' por 'pepe'

update alteraciones set nombre='ana' where edad = 10 ; -- cambiar� el nombre de la fila donde la edad sea 10

--------------------------------------------------------------------------------------




