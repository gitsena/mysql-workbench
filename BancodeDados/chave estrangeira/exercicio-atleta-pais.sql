use faculdade;
drop table Atleta;
drop table Pais;

create table Atleta (
idAtleta int primary key,
nome varchar (40),
modalidade varchar (40),
quantidade_de_medalha int
);

insert into Atleta values
('1','André', 'Natação', '3'),
('2','Raphael', 'Corrida', '1'),
('3','Jonathan', 'Voley', '4'),
('4','Carlos', 'Futebol', '7'),
('5','Ricardo', 'Voley', '9'),
('6','Roberto', 'Tênis', '2'),
('7','Gabriela', 'Voley', '6');

select * from Atleta;
 
 create table Pais (
 idPais int primary key,
 nome varchar(40),
 capital varchar(40)
 );
 
  insert into Pais values
 (100, 'Brasil', 'Rio De Janeiro'),
 (101, 'Estados Unidos', 'whoshington'),
 (102, 'Coreia', 'Seul'),
 (103, 'Russia', 'Moscou'),
 (104, 'Japão', 'Toquio');
 
 select * from  Pais;
 
alter table Atleta add fkPais int;
alter table Atleta add foreign key (fkPais) references Pais (idPais);
desc Pais;


-- atualizar tabela adicionando o Pais para cada atleta
update Atleta set fkPais = 100 where idAtleta = 2;
update Atleta set fkPais = 101 where idAtleta = 1;
update Atleta set fkPais = 102 where idAtleta = 3;
update Atleta set fkPais = 103 where idAtleta = 4;
update Atleta set fkPais = 104 where idAtleta = 7;
update Atleta set fkPais = 101 where idAtleta = 5;
update Atleta set fkPais = 102 where idAtleta = 6;

select * from atleta join Pais on fkPais = idPais;
select * from atleta join Pais on atleta.fkPais = pais.idPais
	where Pais.nome = 'Coreia';
