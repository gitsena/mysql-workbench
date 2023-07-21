use faculdade;

create table atleta (
idAtleta int primary key,
nome varchar (40),
modalidade varchar (40),
quantidade_de_medalha int
);

select * from atleta;

insert into atleta values
('1','André', 'Natação', '3'),
('2','Raphael', 'Corrida', '1'),
('3','Jonathan', 'Voley', '4'),
('4','Carlos', 'Futebol', '7'),
('5','Ricardo', 'Voley', '9'),
('6','Roberto', 'Tênis', '2'),
('7','Gabriela', 'Voley', '6');

SELECT idAtleta, nome, modalidade, quantidade_de_medalha FROM atleta WHERE modalidade = 'Voley';

SELECT modalidade FROM atleta WHERE modalidade LIKE '%o%';

SELECT nome FROM atleta
 WHERE nome LIKE '%s%';
 
 SELECT nome FROM atleta
 WHERE nome LIKE '%_o';
 
 SELECT nome FROM atleta
 WHERE nome LIKE '%r_';
 
 create table Pais (
 idPais int primary key,
 nome varchar(40),
 capital varchar(40)
 );
 
alter table atleta add fkPais int;
desc Pais;
alter table atleta add foreign key (fkPais)
references Pais (idPais);

 insert into Pais values
 (100, 'Brasil', 'Rio De Janeiro'),
 (101, 'Estados Unidos', 'whoshington'),
 (102, 'Coreia', 'Seul'),
 (103, 'Russia', 'Moscou'),
 (104, 'Japão', 'Toquio');
 
 select * from  Pais;
 
 
 drop table atleta;