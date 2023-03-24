-- Examen Ines Maria Barrera

drop table alumnos;
drop table profesores;
drop table asignaturas;
drop table notas;

create table alumnos
(
  cod_alumno number(3) primary key,
  nombre varchar2(30),
  ape1 varchar2(30),
  ape2 varchar2(30),
  telefono number(10),
  ciudad varchar2(30)
);

insert into alumnos values(1,'antonio', 'rodriguez', 'olmo',111111, 'puertollano');
insert into alumnos values(2,'ana', 'santos', 'santos',222222, 'puertollano');
insert into alumnos values(3,'santiago', 'redondo', 'moreno',333333, 'puertollano');
insert into alumnos values(4,'angela', 'velasco', 'velasco',444444, 'ciudad real');
insert into alumnos values(5,'pepe', 'santos', 'romero',555555, 'ciiudad real');

create table profesores
(
    codigo varchar2(4) primary key,
    dni varchar2(11) unique,
    nombre varchar2(30)
);

insert into profesores values('p001', '59595959', 'antonio');
insert into profesores values('p002', '56565656', 'carmen');
insert into profesores values('p003', '72727272', 'teresa');

create table  asignaturas
(
  cod_asig number(3) primary key,
  nombre  varchar2(20),
  horas number(2),
  cod_profe varchar2(4),
  foreign key (cod_profe) references profesores(codigo)
);

insert into asignaturas values(1,'programacion',6, 'p001');
insert into asignaturas values(2,'base de datos',4, 'p001');
insert into asignaturas values(3,'lenguaje de marcas',6, 'p002');
insert into asignaturas values(4,'ingles',5, 'p003');

create table notas
(
  cod_alumno number(3),
  cod_asig number(3),
  nota number(4,2),
  primary key (cod_alumno, cod_asig),
  foreign key (cod_alumno) references alumnos(cod_alumno) on delete cascade,
  foreign key (cod_asig) references asignaturas(cod_asig) on delete cascade
);



insert into notas values(1,1,6);
insert into notas values(1,2,4);
insert into notas values(1,3,2);
insert into notas values(1,4,9);

insert into notas values(2,1,5);
insert into notas values(2,2,7);
insert into notas values(2,3,8);
insert into notas values(2,4,8);

insert into notas values(3,1,8);
insert into notas values(3,2,1);
insert into notas values(3,3,5);
insert into notas values(3,4,10);

insert into notas values(4,3,2);
insert into notas values(4,4,3);

insert into notas values(5,1,2);
insert into notas values(5,2,1);
insert into notas values(5,3,1);
insert into notas values(5,4,1);

------------------------------------------------------------------------------
-- ejercicio 1
-- sacar las notas medias de todas las asignaturas agrupadas por asignaturas de
-- aquellos alumnos cuyo nombre contenga la letra "a" y ordenado por el nombre
-- de la asignatura, siempre y cuando sea mayor o igual que 5.
select asignaturas.nombre, avg(notas.nota)
from asignaturas join notas
on asignaturas.cod_asig = notas.cod_asig
join alumnos
on notas.cod_alumno = alumnos.cod_alumno
    where upper(alumnos.nombre) like '%a%'
    group by notas.nota, asignaturas.nombre
        having notas.nota = (select avg(nota) from notas
            where nota >= 5
            group by notas.cod_asig)
    order by asignaturas.nombre;

        -- correcion
        select asignaturas.nombre, avg(notas.nota)
        from notas join asignaturas
        on asignaturas.cod_asig = notas.cod_asig
        join alumnos
        on notas.cod_alumno = alumnos.cod_alumno
            where upper(alumnos.nombre) like '%a%'
            group by notas.cod_asig, asignaturas.nombre
                having avg(notas.nota) >= 5
            order by asignaturas.nombre;

-- ejercicio 2
-- listar el numero de horas que cada alumno permanecera en el instituto a la
-- semana sabiendo que el campo horas de la tabla asignaturas son las horas
-- semanales de cada asignatura, ademas pondremos la "fecha de hoy" formateada
-- de esta manera "23 de enero de 2021"
select alumnos.nombre, to_char(sysdate, 'dd-mon-yyyy') as fecha, sum(asignaturas.horas) as horas_semanales
from alumnos join notas
on alumnos.cod_alumno = notas.cod_alumno
join asignaturas
on notas.cod_asig = asignaturas.cod_asig
group by alumnos.nombre;

-- ejercicio 3
-- queremos saber la nota media del alumno 'ana' y la diferencia que existe
-- con la nota media del alumno que ha conseguido la mas alta de la clase
select (select max(avg(nota)) from notas group by nota) - avg(notas.nota) as
nota_diferencia, alumnos.nombre
from notas join alumnos
on notas.cod_alumno = alumnos.cod_alumno
    where upper(alumnos.nombre) like 'ana'
    group by alumnos.nombre;

        -- correcion
        select avg(notas.nota) - (select max(avg(nota)) from notas group by notas.cod_alumno) as
        nota_diferencia, alumnos.nombre, avg(notas.nota) as media_ana
        from notas join alumnos
        on notas.cod_alumno = alumnos.cod_alumno
            where alumnos.nombre like 'ana'
            group by notas.cod_alumno, alumnos.nombre;

 -- ejercicio 4
 -- nombre del profesor que imparte la asignatura que ha obtenido la mejor nota
 -- media entre todos sus alumnos. es decir el nombre del profesor cuyos alumnos
 -- han obtenido los mejores resultados
 select profesores.nombre, asignaturas.nombre, max(avg(notas.nota))
 from profesores join asignaturas
 on profesores.codigo = asignaturas.cod_profe
 join notas
 on asignaturas.cod_asig = notas.cod_asig
 group by profesores.nombre, asignaturas.nombre
    having notas.nota;

        -- correcion
        select notas.cod_asig, asignaturas.nombre, profesores.nombre
        from notas join asignaturas
        on notas.cod_asig = asignaturas.cod_asig
        join profesores
        on asignaturas.cod_profe = profesores.codigo
        group by notas.cod_asig, asignaturas.nombre, profesores.nombre
            having avg(notas.nota) = (select max(avg(nota)) from notas
                group by cod_asig);

 -- ejercicio 5
 -- nombres de los alumnos que esten matriculados en las mismas asignaturas que "ana"
select notas.cod_alumno, alumnos.nombre
from notas join alumnos
on notas.cod_alumno = alumnos.cod_alumno
where notas.cod_asig = (select cod_alumno from alumnos
where upper(nombre) like'ana')
intersect
select notas.cod_alumno, alumnos.nombre
from notas join alumnos
on notas.cod_alumno = alumnos.cod_alumno;

 -- ejercicio 6
 -- listado de los nombres de los profesores junto con las asignaturas que no
 -- han obtenido ningun alumno suspenso
 select profesores.nombre, asignaturas.nombre
 from profesores join asignaturas
 on profesores.codigo = asignaturas.cod_profe
 join notas
 on asignaturas.cod_asig = notas.cod_asig
    where notas.nota > 5;

        -- correcion
        select profesores.nombre, asignaturas.nombre
        from profesores join asignaturas
        on profesores.codigo = asignaturas.cod_profe
        where asignaturas.cod_asig not in (select distinct notas.cod_asig from notas
            where nota < 5);

 -- ejercicio 7
 -- quiero saber si alguna nota de "ana" es mayor que todas las notas de
 -- "antonio". en caso afirmativo mostrara el nombre de la asignatura.
 -- en caso negativo no muestra nada
 select asignaturas.nombre
 from asignaturas join

 -- ejercicio 8
 -- modifica la nota a todos los alumnos de bases de datos poniendole la
 -- misma nota que el alumno que tiene la nota mas alta
 update notas
 set nota = (select max(nota) from notas);

 -- ejercicio 9
 -- borra los datos de todos los alumnos que tengan alguna asignatura suspensa
 delete * from alumnos join notas
 on notas.cod_alumno = alumnos.cod_alumno
 where notas.nota < 5;

 -- ejercicio 10
 -- lista los nombres de todos aquellos alumnos que han suspendido todas las
 -- asignaturas en las que se han matriculado
 select alumnos.nombre, notas.nota
 from alumnos join notas
 on notas.cod_alumno = alumnos.cod_alumno
 where notas.nota < 5 and cod_asig in (1,2,3,4);
