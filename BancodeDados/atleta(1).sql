 create database sprint1;

-- selecionar o banco de dados faculdade
use sprint1;

create table atleta (

idAtleta int primary key,
nome varchar (40),
modalidade varchar (40),
quantidade_de_medalha int
);

select * from atleta;

insert into atleta values
('1','André', 'natação', '3');

insert into atleta values
('2','raphael', 'corrida', '1');

insert into atleta values
('3','André', 'voley', '20');


