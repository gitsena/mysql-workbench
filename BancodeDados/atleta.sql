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
('1','André', 'Natação', '3');

insert into atleta values
('2','Raphael', 'Corrida', '1');

insert into atleta values
('3','Jonathan', 'Voley', '4');

insert into atleta values
('4','Carlos', 'Futebol', '7');

insert into atleta values
('5','Ricardo', 'Voley', '9');

insert into atleta values
('6','Roberto', 'Tênis', '2');

insert into atleta values
('7','Gabriela', 'Voley', '6');

SELECT idAtleta, nome, modalidade, quantidade_de_medalha FROM atleta WHERE modalidade = 'Voley';

SELECT modalidade FROM atleta WHERE modalidade LIKE '%o%';

SELECT nome FROM atleta
 WHERE nome LIKE '%s%';
 
 SELECT nome FROM atleta
 WHERE nome LIKE '%_o';
 
 SELECT nome FROM atleta
 WHERE nome LIKE '%r_';
 
 drop table atleta;