create table nombre (
    ___ varchar2(30) generated always as identity primary key,
    ___ char(1) check (___ IN '_','_')
);

alter table ___ add primary key (__);
alter table ___ drop primary key (__);

alter table ____ add constraint ck_ check (edad >= 18);

alter table ___ add constraint cf_ foreign key (__) references ____(__);

alter table ___ rename to ___;

alter table ___ drop column ___;

drop table ____;
delete ____ where edad < 18;

insert into ___ values (___);
insert into ___ values (sysdate);

create sequence ___
start with 1
increment by 1;

insert into ___ values (__.NEXTVAL)