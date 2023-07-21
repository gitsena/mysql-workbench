create database PraticaFuncionario;
use PraticaFuncionario;

drop table funcionario;
drop table setor;
drop table acompanhante;

create table funcionario(
idFunc int primary key unique,
nomeFunc varchar(40),
tel char (15),
salario double,
check (salario > 0)
);

insert into funcionario values 
(1000, "ricardo silva", "11 954549089", 5000),
(1001, "thiago souza", "11 954549089", 3000),
(1002, "thais ferreira", "11 954549089", 2000),
(1003, "carlos sena", "11 954549089", 7000),
(1005, "bruno sales", "11 954549089", 2000),
(1006, "fabio ferraz", "11 954549089", 3200),
(1007, "maria gomes", "11 954549089", 2800),
(1004, "jhol barros", "11 954549089", 5300);
select * from funcionario;

create table setor(
codSetor int,
nomeSetor varchar (30),
andar varchar(15),
fkFunc int,
foreign key (fkFunc) references funcionario(idFunc)
);

insert into setor values
(001, "setor A", "1 andar", 1004),
(001, "setor A", "1 andar", 1005),
(001, "setor A", "1 andar", 1006),
(002, "setor B", "2 andar", 1003),
(003, "setor C", "3 andar", 1002),
(003, "setor C", "3 andar", 1007),
(004, "setor D", "4 andar", 1001),
(005, "setor E", "5 andar", 1000);
select * from setor;

create table acompanhante(
idAcomp int,
fkAcomp int,
foreign key (fkAcomp) references funcionario(idFunc),
primary key (idAcomp, fkAcomp),
nomeAcomp varchar(40),
relacao varchar(40),
dataNasc date
);

insert into acompanhante values
(1, 1004, "andre", "irmão", "1995-11-28"),
(2, 1003, "lucas", "amigo", "1997-10-23"),
(3, 1002, "Matheus", "marido", "1987-07-12"),
(4, 1001, "beatriz", "irmã", "1994-10-18"),
(5, 1000, "tatiane", "prima", "2000-03-09"),
(6, 1004, "susane", "namorada", "2000-11-25"),
(1, 1003, "marcos", "primo", "1993-12-14"),
(7, 1002, "eduarda", "filha", "2002-08-02"),
(8, 1004, "rodrigo", "amigo", "1992-05-16");
select * from acompanhante;

-- exibir os setores e os funcionarios daquele setor
select * from setor join funcionario on fkfunc = idFunc;
-- exibir de um determinado setor e dos funcionarios daquele setor
select Setor.nomeSetor as "Nome Setor",
Func.nomeFunc as "Nome funcionario" 
from setor as Setor join funcionario as Func 
on Setor.fkFunc = Func.idFunc where Setor.nomeSetor = "setor A";
-- exibri os dados dos funcionarios e dos acompanhantes
select * from funcionario as Func join acompanhante as Acomp on fkAcomp = idFunc;
-- exibir somente um funcionario e seus acompanhantes
select * from funcionario as Func join acompanhante as Acomp on fkAcomp = idFunc where Func.nomeFunc = "jhol barros";
-- exibir os dados dos funcionarios dos setores e dos acompanhantes
select * from funcionario as Func join setor as Setor on Func.idFunc = Setor.fkFunc join acompanhante as Acomp on fkAcomp = idFunc;
-- exibir a soma e a media dos salarios dos funcionarios
select avg(funcionario.salario) as "Média salário", sum(funcionario.salario) as "Soma do Salário" from funcionario;
-- exibir a soma e a media dos salarios dos funcionarios mas acima de um determinado valor
select avg(funcionario.salario >3000) as "Média salário", sum(funcionario.salario > 5000) as "Soma do Salário" from funcionario;
-- exibir o funcionario de maior salario -- salario = (select max(salario) from funcionario);
select * from funcionario where salario = (select max(salario) from funcionario);
-- exibir o maior e o menor salario
select min(funcionario.salario) as "salario minimo", max(funcionario.salario) as "salario maximo" from funcionario;
select * from funcionario where salario = (select min(salario) from funcionario);
-- exibir a quantidade de salario cadastrado (count)
select count(salario) as "Qtd salario cadastrado" from funcionario;
-- exibir a quantidade de salario cadastrado menores do que um determinado valor
select count(salario) as "Qtd salario cadastrado" from funcionario where salario < 4000 ;


-- count quantidade
-- sum soma
-- avg media
-- max maximo
-- min minimo