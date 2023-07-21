create database projetos_pi;
use projetos_pi;

drop table Grupo;
drop table Aluno;
drop table Professor;
-- criar tabela grupo
create table Grupo (
idGrupo int primary key auto_increment,
nome_grupo varchar(45),
descricao_projeto varchar(45)
);

-- criar tabela aluno
create table Aluno(
ra int primary key,
nome_aluno varchar(40),
email varchar (40)
);

-- criar tabela professor
create table Professor(
idProfessor int primary key auto_increment,
nome_professor varchar(40),
disciplina varchar(30)
);

-- inserir grupos
insert into Grupo values
(null, 'AquaLife', 'Piscicultura'),
(null, 'PortVinho', 'controle de temperatura de vinhos');

-- inserir alunos
insert into Aluno values
(01212001, 'Arthur silva', 'arthur.silva@gmail.com'),
(01212002, 'Bruno ferreira', 'bruno.ferreira@gmail.com'),
(01212003, 'Thiago souza', 'thiago.souza@gmail.com'),
(01212004, 'Andre sena', 'andre.sena@gmail.com'),
(01212005, 'Jose paulo', 'jose.paulo@gmail.com'),
(01212006, 'Paloma dias', 'paloma.dias@gmail.com'),
(01212007, 'Fernanda silva', 'fernandasilva@gmail.com'),
(01212008, 'Ricardo araujo', 'ricardoaraujo@gmail.com'),
(01212009, 'Carlos felix', 'carlosfelix@gmail.com'),
(01212010, 'Marcos souza', 'marcossouza@gmail.com'),
(01212011, 'Nayara pereira', 'nayarapereira@gmail.com'),
(01212012, 'Camila oliveira', 'camilaoliveira@gmail.com');

-- inserir professor
insert into Professor values
(10000, 'Brandãp', 'Pesquisa Inovação'),
(null, 'Marise', 'Arq comp'),
(null, 'Leonardo', 'Socio Emocional'),
(null, 'Thiago', 'T.I'),
(null, 'Vivian', 'Banco de Dados'),
(null, 'Frizza', 'Algoritmos');

select * from Grupo;
select * from Aluno;
select * from Professor;

-- interligar chave estrangeira fkGrupo na tabela aluno
alter table Aluno add fkGrupo int;
alter table Aluno add foreign key (fkGrupo) references Grupo (idGrupo);
desc Grupo;
desc Aluno;


-- atualizar tabela adicionando aluno no grupo
update Aluno set fkGrupo = 1 where ra = 01212001 ;
update Aluno set fkGrupo = 2 where ra = 01212002 ;
update Aluno set fkGrupo = 1 where ra = 01212003 ;
update Aluno set fkGrupo = 2 where ra = 01212004 ;
update Aluno set fkGrupo = 1 where ra = 01212005 ;
update Aluno set fkGrupo = 2 where ra = 01212006 ;
update Aluno set fkGrupo = 1 where ra = 01212007 ;
update Aluno set fkGrupo = 2 where ra = 01212008 ;
update Aluno set fkGrupo = 1 where ra = 01212009 ;
update Aluno set fkGrupo = 2 where ra = 01212010 ;
update Aluno set fkGrupo = 1 where ra = 01212011 ;
update Aluno set fkGrupo = 2 where ra = 01212012 ;

select * from Aluno join Grupo on fkGrupo = idGrupo;
select * from Aluno join Grupo on Aluno.fkGrupo = Grupo.idGrupo
	where Grupo.nome_grupo = 'Aqualife';



-- interligar chave estrangeira fkAvaliar na tabela professor
alter table Grupo add fkAvaliar int;
alter table Grupo add foreign key (fkAvaliar) references Professor (idProfessor);
desc Grupo;

-- atualizar tabela adicionando professores para avaliar cada grupo
update Grupo set fkAvaliar = 10000 where idGrupo = 1;
update Grupo set fkAvaliar = 10000 where idGrupo = 2;
update Grupo set fkAvaliar = 10002 where idGrupo = 1;
update Grupo set fkAvaliar = 10001 where idGrupo = 2;
update Grupo set fkAvaliar = 10002 where idGrupo = 2;
update Grupo set fkAvaliar = 10003 where idGrupo = 2;
update Grupo set fkAvaliar = 10004 where idGrupo = 1;
update Grupo set fkAvaliar = 10005 where idGrupo = 2;
update Grupo set fkAvaliar = 10005 where idGrupo = 1;

select * from Grupo join Professor on fkAvaliar = idProfessor;
select * from Grupo join Professor on Grupo.fkAvaliar = Professor.idProfessor
	where Professor.nome_grupo = 'Aqualife';