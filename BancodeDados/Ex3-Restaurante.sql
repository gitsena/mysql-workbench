create database Restaurante;
use Restaurante;

-- criando tabela Restaurante 
create table Restaurante(
idRest int primary key auto_increment,
nomeRest varchar(45),
bairro varchar(30),
especialidade varchar(30)
)auto_increment = 1000;

-- inserindo dados na tabela (idRest = 1000)
insert into Restaurante values 
(null, "Temaki", "Liberdade", "Comida Japonesa" ),
(null, "Yukui", "Liberdade", "Comida Japonesa" ),
(null, "Korean", "Liberdade", "Comida Coreana" ),
(null, "Senor", "Ipiranga", "Comida Mexicana" ),
(null, "Vila Mex", "Diadema", "Comida Mixicana" ),
(null, "Cucina", "Taboão", "Comida Italiana" ),
(null, "O mineiro", "Taboão", "Comida Mineira" );
-- exibir tabela Restaurante
select * from Restaurante;

-- creando tabela Cozinheiro
create table Cozinheiro(
idCoz int primary key auto_increment,
nome varchar(45),
tel char(14),
dtNasc date,
fkExperiente int,
fkRest int,
foreign key (fkRest) references Restaurante(idRest)
)auto_increment = 10;

-- inserindo dados na tabela Cozinheiro (idCoz = 10)
insert into Cozinheiro values
(null, "Yame shokil", "(11)99887-7665", "1997-04-20", null, 1000),
(null, "Shang Shee", "(11)99337-4465", "1998-03-23", 10, 1000),
(null, "Maria Jo", "(11)99347-0985", "1992-05-12", 10, 1001),
(null, "Pitter Sena", "(11)95887-7345", "1990-06-21", 11, 1001),
(null, "Johan Matt", "(11)99885-2312", "1991-07-06", 10, 1002),
(null, "Felipe D", "(11)99234-8790", "1991-12-03", 12, 1003),
(null, "Suzane J", "(11)99833-0876", "1992-10-10", 11, 1004);
-- exibir tabela cozinheiro
select * from Cozinheiro;

-- exibir os dados dos restaurantes e os dados dos cozinheiros 
select * from Cozinheiro join Restaurante on fkRest = idRest;

-- exibir os dados de um determinado restaurante informado pelo nome e os dados dos cozinheiros 
select * from Cozinheiro join Restaurante on fkRest = idRest where Restaurante.nomeRest = "Temaki";																

-- exibir os dados dos cozinheiros dos cozinheiros experientes
Select * from Cozinheiro as C_nov join Cozinheiro as C_exp on C_nov.fkExperiente = C_exp.idCoz;

-- exibir os dados dos cozinheiros os dados dos cozinheiros experientes porem de um determinado cozinheiro (informado pelo nome)
Select * from Cozinheiro as C_nov join Cozinheiro as C_exp on C_nov.fkExperiente = C_exp.idCoz where C_nov.nome = "Johan Matt";

-- xibir os dados dos cozinheiros os dados dos restaurantes e os dados dos cozinheiros experientes 
Select * from Cozinheiro as c_nov join Restaurante on fkRest = idRest join Cozinheiro as C_exp on c_nov.fkExperiente = c_exp.idCoz;

-- xibir os dados dos cozinheiros os dados dos restaurantes e os dados dos cozinheiros experientes e de todos os cozinheiros que não são orientadores experientes
Select * from Cozinheiro as c_nov join Restaurante on fkRest = idRest right join Cozinheiro as C_exp on c_nov.fkExperiente = c_exp.idCoz;

-- xibir os dados de um cozinheiro informado pelo nome , os dados dos restaurante e dos cozinheiros experiente 
Select * from Cozinheiro as c_nov join Restaurante on fkRest = idRest join Cozinheiro as C_exp on c_nov.fkExperiente = c_exp.idCoz where c_nov.nome = "Shang Shee";


