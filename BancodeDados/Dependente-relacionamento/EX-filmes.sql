create database exercicios;
use exercicios;

-- creando tabela ator
create table Ator (
idAtor int primary key auto_increment,
nomeAtor varchar (45),
dtNasc date
)auto_increment= 100;

-- inserir dados na tabela ator (idAtor - 100)
insert into Ator values
(null, "Robeert dj", "1986-02-11"),
(null, "Chris Evans", "1990-03-18"),
(null, "Jennifer", "1994-06-20"),
(null, "Angelina j", "1982-10-21"),
(null, "Tom Holland", "1999-05-12"),
(null, "jhony Depp", "1986-02-30");

create table Diretor (
idDiretor int primary key auto_increment,
nomeDiretor varchar(45),
paisNasc varchar (30)
)auto_increment = 1;

-- inserir dados na tabela Diretor (idDiretor - 1)
insert into Diretor values
(null, "kelvin Figer", "Estados Unidos"),
(null, "Robert dj", "Estados Unidos"),
(null, "Shan J", "Coreia"),
(null, "Cloe G", "Canada");

create table Filme (
idFilme int primary key auto_increment,
titulo varchar (45),
genero varchar(25),
fkDiretor int,
foreign key (fkDiretor) references Diretor(idDiretor)
)auto_increment = 1000;

insert into Filme values
(null, "Avengers", "Aventura", 1),
(null, "Avengers Ultimate", "Aventura", 1),
(null, "Jogos Vorazes", "Ação", 3),
(null, "Eternos", "Ficção", 4),
(null, "Spider Man", "Aventura", 1),
(null, "Piratas do caribe", "Aventura", 2),
(null, "Iron Man", "Ação", 1),
(null, "Capitão America", "Aventura", 1);

create table Personagem(
fkAtor int,
foreign key (fkAtor) references Ator(idAtor),
fkFilme int,
foreign key (fkFilme) references Filme(idFilme),
primary key (fkAtor, fkFilme),
papel varchar (35),
ganho double
);
insert into Personagem values
(100, 1000, "Iron Man", 60.000),
(101, 1001, "Capitão America", 50.000),
(102, 1002, "Joe", 50.000),
(103, 1003, "Thena", 60.000),
(104, 1004, "Piter Parker", 30.000),
(105, 1005, "Pirata", 40.000),
(101, 1000, "Capitão america", 40.000),
(101, 1001, "Iron man", 40.000),
(100, 1006, "Iron man", 40.000),
(101, 1007, "Capitão america", 40.000);

