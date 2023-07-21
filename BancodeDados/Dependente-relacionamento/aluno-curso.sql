create database EscolaIdiomas;
use EscolaIdiomas;

create table aluno(
ra int primary key auto_increment,
nome_aluno varchar(45),
bairro varchar(30)
)auto_increment = 1000;

insert into aluno values
(null, "André sena", "Cursino"),
(null, "Fernanda Dias", "Taboão"),
(null, "Paloma Araujo", "Paineiras"),
(null, "Rafael Silva", "Ipiranga");

create table curso(
idCurso int primary key auto_increment,
nome_curso varchar(40),
coordenador varchar (45)
)auto_increment = 100;

insert into curso values
(null, "Ingles", "Jose"),
(null, "Espanhol", "Maria"),
(null, "Mandarim", "Ana"),
(null, "Frances", "Ricardo"),
(null, "Japones", "João");

create table matricula (
fkra int,
foreign key (fkra) references aluno(ra),
fkcurso int,
foreign key (fkcurso) references curso(idcurso),
dtinicio date,
primary key(fkra, fkcurso, dtinicio),
media decimal(4, 2),
nivel char (2)
);

insert into matricula values
(1000, 100, "2020-02-18", "9.5", "B1" ),
(1001, 100, "2020-11-09", "5.6", "A1" ),
(1002, 101, "2020-05-11", "7.6", "B2" ),
(1001, 103, "2020-11-09", "6.0", "B1" );

-- exibir nome aluno nome do curso e o nivel
select nome_aluno, nome_curso, nivel
from aluno join matricula on fkra = ra 
join curso on fkcurso = idcurso;

-- exibir os alunos nao matriculado
select nome_aluno, nome_curso, nivel
from aluno left join matricula on fkra = ra 
left join curso on fkcurso = idcurso;

-- exibir os dados dos alunos, mas somente de um curso
select * from matricula join aluno on ra = fkra join curso on idcurso = fkcurso where idcurso = "100";

-- exiber os dados de um aluno e os dados dos cursos desse aluno;
select * from aluno join matricula on fkra = ra join curso on fkcurso = idcurso where nome_aluno = "André sena";

-- exibir os dados a soma das medias e as media das maedias
select sum(media), truncate(avg(media),2) from matricula;

-- exibir a media minima e a maxima
select min(matricula.media) as "Media minima", max(matricula.media) as "Media maxima" from matricula;
