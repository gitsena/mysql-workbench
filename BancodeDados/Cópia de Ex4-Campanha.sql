create database campanha;
use campanha;

-- criando tabela Organizador
create table Organizador(
idOrg int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(35),
email varchar(45),
fkExp int,
foreign key (fkExp) references Organizador(idOrg)
)auto_increment= 30;

-- inserindo dados na tabela Organizador (udOng = 30)
insert into Organizador values 
(null, "Renan Silva", "R Platina", "Taboão", "renansilva@gmail.com", null),
(null, "Michele Dias", "Av Brasilia", "Cursino", "micheledias@gmail.com", null),
(null, "Debora Silva", "R Santana", "Moema", "deborasilva@gmail.com", 31),
(null, "Paulo Ferraz", "R Japão", "Taboão", "pauloferraz@gmail.com", 30),
(null, "Daniel Filho", "R bela flor", "Jardins", "danielfilho@gmail.com", 31),
(null, "Marcos Paulo", "R Ipiranga", "Paulista", "marcospaulo@gmail.com", 32);

-- exibir tabela Organizador
select * from Organizador;

-- criando tabela Campanha
create table Campanha (
idCmp int primary key auto_increment,
categoria varchar(45),
instituicao varchar (40),
check (instituicao = "Mãos que ajudam" or instituicao = "Contra Covid"),
dtFinal date,
fkOrg int,
foreign key (fkOrg) references Organizador(idOrg)
)auto_increment = 500;

-- inserindo dados na tabela Campanha (idCmp = 500)
insert into Campanha values
(null, "Produto de Higiene", "Contra Covid", "2022-01-10", 30),
(null, "Alimentos", "Mãos que ajudam", "2022-02-18", 31),
(null, "Máscaras", "Contra Covid", "2022-01-10", 33),
(null, "Produto Higiene", "Mãos que ajudam", "2022-02-18", 32),
(null, "Máscaras", "Mãos que ajudam", "2022-02-18", 35),
(null, "Produto Higiene", "Mãos que ajudam", "2022-02-18", 34);

-- inserindo um mesmo organizador para mais uma campanha
insert into Campanha values
(null, "Alimentos", "Contra Covid", "2022-03-10", 30);
-- exibir tabela Campanha 
select * from Campanha;

-- exibir os dados dos organizadores e os dados de suas campanhas 
select * from Organizador join Campanha on fkOrg = idOrg;

-- exibir os dados de um determinado organizador informado pelo nome e os dados de suas campanhas 
select * from Organizador join Campanha on fkOrg = idOrg where Organizador.nome = "Renan Silva";

-- exibir os dados dos organizadores novatos e os dados dos organizadores orientadores experientes
SELECT 
    Og_nov.nome AS 'Organizadores novatos',
    Og_nov.rua AS 'Endereço',
    Og_nov.bairro AS 'Bairo',
    Og_nov.email AS 'Email',
    Og_exp.nome AS 'Orientadores experientes',
    Og_exp.rua AS 'Endereço',
    Og_exp.bairro AS 'Bairo',
    Og_exp.email AS 'Email'
FROM
    Organizador AS Og_nov
        JOIN
    Organizador AS Og_exp ON Og_nov.fkExp = Og_exp.idOrg;
 
-- exibir os dados dos organizadores novatos e os dados dos organizadores orientadores experientesem geral dos que náo sáo orientados
SELECT 
    Og_nov.nome AS 'Organizadores novatos',
    Og_nov.rua AS 'Endereço',
    Og_nov.bairro AS 'Bairo',
    Og_nov.email AS 'Email',
    Og_exp.nome AS 'Orientadores experientes',
    Og_exp.rua AS 'Endereço',
    Og_exp.bairro AS 'Bairo',
    Og_exp.email AS 'Email'
FROM
    Organizador AS Og_nov
        LEFT JOIN
    Organizador AS Og_exp ON Og_nov.fkExp = Og_exp.idOrg;
 
-- exibir os dados dos organizadores novatos e os dados dos organizadores orientadores experientes , porem de um determinado orientador
select * from Organizador as Og_nov join Organizador as Og_exp on Og_nov.fkExp = Og_exp.idOrg where Og_nov.nome = "Daniel Filho";

-- exibir os dados dos organizadores novatos os dadosndas campanhas e os dados dos organizadores experientes 
SELECT 
    Og_nov.nome AS 'Organizadores novatos',
    Og_nov.rua AS 'Endereço',
    Og_nov.bairro AS 'Bairo',
    Og_nov.email AS 'Email',
    Campanha.categoria AS 'Categorias',
    Campanha.instituicao AS 'Nome da Instituição',
    Campanha.dtFinal AS 'Data de Encerramento',
    Og_exp.nome AS 'Orientadores experientes',
    Og_exp.rua AS 'Endereço',
    Og_exp.bairro AS 'Bairo',
    Og_exp.email AS 'Email'
FROM
    Organizador AS Og_nov
        JOIN
    Campanha ON fkOrg = idOrg
        LEFT JOIN
    Organizador AS Og_exp ON Og_nov.fkExp = Og_exp.idOrg;

-- exibir os dados de um organizador novado informado pelo nome os dados de suas campanhas e os dados dos seu orientador experiente 
SELECT 
    Og_nov.nome AS 'Organizadores novatos',
    Og_nov.rua AS 'Endereço',
    Og_nov.bairro AS 'Bairo',
    Og_nov.email AS 'Email',
    Campanha.categoria AS 'Categorias',
    Campanha.instituicao AS 'Nome da Instituição',
    Campanha.dtFinal AS 'Data de Encerramento',
    Og_exp.nome AS 'Orientadores experientes',
    Og_exp.rua AS 'Endereço',
    Og_exp.bairro AS 'Bairo',
    Og_exp.email AS 'Email'
FROM
    Organizador AS Og_nov
        JOIN
    Campanha ON fkOrg = idOrg
        JOIN
    Organizador AS Og_exp ON Og_nov.fkExp = Og_exp.idOrg
WHERE
    Og_nov.nome = 'Paulo Ferraz';