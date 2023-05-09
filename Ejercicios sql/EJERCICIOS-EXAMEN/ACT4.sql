drop table if exists alumnos;
drop table if exists profesores;
 
 create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  codigoprofesor int,
  primary key(documento)
 );

create table profesores (
   codigo int,
   nombre varchar2(30),
   primary key(codigo)
);
 
 insert into alumnos values('30111111','Ana Algarbe', 5.1, 1);
 insert into alumnos values('30222222','Bernardo Bustamante', 3.2, 1);
 insert into alumnos values('30333333','Carolina Conte',4.5, 1);
 insert into alumnos values('30444444','Diana Dominguez',9.7, 1);
 insert into alumnos values('30555555','Fabian Fuentes',8.5, 2);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70, 2);

 insert into profesores values (1,'Maria Luque');
 insert into profesores values (2,'Jorje Dante'); 

--? 1.- Creamos una vista con los datos de todos los alumnos que tienen una nota mayor o igual a 7, 
-- junto con el nombre del profesor 
--? que lo califico.
create view vista_notas
as
select alumnos.nombre as Nombre_Alumnos, alumnos.nota as Nota_Alumno, profesores.nombre as Nombre_Profesor, profesores.codigo as Cod_Profe
from alumnos join profesores
on alumnos.codigoprofesor = profesores.codigo
where alumnos.nota >= 7;

drop view vista_notas;

--? 2.- Mediante la vista insertamos un nuevo alumno calificado por el profesor con código 1.
insert into vista_notas(Nombre_alumnos,Nota_Alumno, Cod_Profe) values('Ines',8.5,1);
-- NO SE PUEDEN INSERTAR EN VISTAS QUE CONTENGAN MAS DE UNA TABLA
select * from vista_notas;

--? 3.- Consultamos la tabla base (alumnos) y observamos que existe un nuevo alumno.

--? 4.- Modificamos la nota de un alumno aprobado mediante la vista. (nota menor que 7)

--? 5.- Consultamos de nuevo la tabla base y observamos el resultado.
--? 6.- Modificamos la nota de un alumno aprobado mediante la vista. (nota mayor que 7)
--? 7.- Consultamos de nuevo la tabla base y observamos el resultado.
--? 8.- Efectuamos un insert mediante la vista creada e insertamos un alumno con una nota inferior a 7 
--? (comprueba que dicha fila se inserta en la tabla base pero no se visualiza en la vista).
--? 9.- Si añades a cláusula “with check option�? cuando creamos la vista luego no se harán inserciones, borrados o 
--? actualizaciones cuando los cambios no se visualizan en la vista. Probemos de nuevo la inserción.
