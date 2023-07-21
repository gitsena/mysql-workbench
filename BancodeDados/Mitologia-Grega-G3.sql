create database Mitologia;

use Mitologia;

create table Deuses(
idDeus int primary key auto_increment,
nome varchar(45),
nivelPoder int,
check (nivelPoder > 0),
fkPai int,
foreign key (fkPai) references Deuses(idDeus)
)auto_increment = 1;

insert into Deuses values 
(null, "Cromos", 2100, null);

insert into Deuses values 
(null, "Zeus", 1300 ,1),
(null, "Poseidon", 800 ,1),
(null, "Hades", 500 ,1),
(null, "Ares", 300 ,2),
(null, "Athena", 100 ,2),
(null, "Perséfone", 100 ,4),
(null, "Hermes", 200 , 2),
(null, "Tritão", 200 ,3);

select * from Deuses;

create table Semideus (
idSemi int primary key auto_increment,
nome varchar(45),
nivelPoder int,
fkDeus int,
foreign key (fkDeus) references Deuses(idDeus)
)auto_increment = 10;

insert into Semideus values 
(null, "Parcy", 1300 , 3),
(null, "Nico", 800 ,4),
(null, "Perseu", 500 ,2),
(null, "Hercules", 300 ,2),
(null, "Luke", 100 ,8),
(null, "Annabeth;", 100 ,6),
(null, "Clarisse", 200 ,5);

select * from Semideus;

create table poder(
fkPdeus int,
foreign key (fkPdeus) references Deuses(idDeus),
fkPsemi int,
foreign key (fkPsemi) references Semideus(idSemi),
tipoPoder varchar(40)
)auto_increment 100;

insert into poder values
(2, 30, "Raio"),
(5, 70, "Força"),
(3, 10, "Controlador das águas"),
(8, 50, "Velocidade"),
(4, 20, "Necromancia"),
(6, 60, "Sabedoria"),
(9, null, "Controlador das águas");


create table Combate(
fkCdeus int,
foreign key (fkCdeus) references Deuses(idDeus),
fkCsemi int,
foreign key (fkCsemi) references Semideus(idSemi),
criatura varchar(30),
descricao varchar (45),
localCombate varchar (45),
dificuldade varchar(20),
check ( dificuldade = "Facil" or dificuldade = "Médio" or dificuldade = "Hard")
)auto_increment = 1000;

