create database estudo;
use estudo;
drop table pai;
create table filho(
idfilho int primary key auto_increment,
nomeFilho varchar(30),
idade int unique,
aparencia varchar(7),
check (aparencia ="jovem" or aparencia ="adulto" or aparencia ="velho"),
fkpai int,
foreign key (fkpai) references filho(idfilho)
)auto_increment=1000;

-- inserindo filho sem pai
insert into filho values 
(null, "jose", 69 , "velho", null),
(null, "adão", 86 , "velho", null);
-- inserindo pais e filhos
insert into filho values 
(null, "antonio", 50 , "jovem", 1000),
(null, "daniel", 33 , "adulto", 1000),
(null, "piter", 20 , "jovem", 1001),
(null, "lucas", 18 , "jovem", 1001);

-- inserir filhos
insert into filho values
(null, "thiago", 16 , "jovem", 1002),
(null, "ana", 14 , "jovem", 1003),
(null, "maria", 17 , "jovem", 1002);

-- select comum
select * from filho;

-- exibindo a tabela filho ultilizando join 
select * from filho as Filho join filho as Pai 
										on Filho.fkpai = Pai.idfilho;
-- exibir somente os nomes do pai e do filho                                          
select Filhos.nomeFilho as Filhos, Pai.nomeFilho as Pai
from filho as Filhos join filho as Pai on Filhos.fkpai = Pai.idfilho;                                          

create table dependente (
fkdep int,
foreign key (fkdep) references filho(idfilho),
iddep int,
primary key (fkdep, iddep), -- chave primaria composto
nomeParente varchar(35),
parentesco varchar (25)
);                                 

insert into dependente values
(1000, 1, "gabriela", "Irmã"),
(1001, 2, "carol", "Prima"),
(1002, 1, "ricardo", "irmão"),
(1003, 2, "luiz", "tio"),
(1004, 3, "carlos", "primo"),
(1005, 4, "paloma", "tia");

-- exibir tabela dependente
select * from dependente;
-- exibir tabela filho
select * from filho;
-- exibir os dados das duas tabelas - select limitado - traz somente a junção
SELECT * FROM filho, dependente where idfilho = fkdep;
-- exibir dados das duas tabelas utilizando join
SELECT * FROM filho inner join dependente on idfilho = fkdep;
-- exibir os dados dos Filhos sem parentes e os Filhos com parentes                                   
SELECT * FROM FILHO left JOIN dependente on idfilho = fkdep;
-- exibir os dados dos parentes e filhos e dos filhos sem parentes
SELECT * FROM FILHO right JOIN dependente on idfilho = fkdep;
-- correspondente
select * from filho as fi
inner join filho as p on p.idfilho = fi.fkpai
inner join dependente on fi.idfilho = fkdep;
-- correspondente de um determinado nome
select * from filho as fi
inner join filho as p on p.idfilho = fi.fkpai
inner join dependente on fi.idfilho = fkdep;



select 
Filho.nomeFilho as Filho, 
Pai.nomeFilho as Pai, 
Parente.nomeParente as Parente,
Parentesco.parentesco as Parentesco 
	from filho as Filho 
          join filho as Pai
                        on Filho.fkpai = Pai.idfilho                 
                            join dependente as Parente
                            on Parente.iddep
                            join dependente as Parentesco
                             on Parentesco.fkdep;