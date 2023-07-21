create database faculdade;

use faculdade;

create table Empresa(
idEmpresa int primary key,
nomeEmpresa varchar (50),
responsavel varchar (40)
);

insert into Empresa value
(1, 'Fleury', 'Maria'),
(2, 'C6', 'Pedro'),
(3, 'TIVIT', 'Camila'),
(4, 'SAFRA', 'Natalia');

select * from Empresa;

select nomeEmpresa, responsavel from Empresa;

select * from Empresa order by nomeEmpresa asc; 

select * from Empresa order by responsavel desc; 

select * from Empresa where responsavel like '%r%';

select * from Empresa where responsavel like 'm%';

select * from Empresa where nomeEmpresa like '%r_';

update Empresa set responsavel = 'Andre' where idEmpresa= '3';

select* from Empresa;

delete from Empresa where idEmpresa='3';

CREATE TABLE aluno (
-- nome_do _campo tipo_do_campo, virgula do final
 ra char(8) PRIMARY KEY,
 nome_aluno VARCHAR(100),
 bairro VARCHAR(75),
 email VARCHAR(50)
 );
 
 SELECT * FROM aluno;
 -- vamos inserir nosso aluno --
 INSERT INTO aluno VALUES
  ('01212003', 'ANDRE DIAS DE SENA', 'TABOÃO', 'andrediasdesena@gmail.com'),
  ('01212002', 'THIAGO SILVA', 'CAMPANARIO', 'THIAGO@gmail.com'),
  ('01212066', 'Guilherme Vazquez Garcia', 'Conceição', 'guilherme.garcia@bandtec.com.br'),
  ('01212145', 'Augusto Henrrique', 'Vila Chavez', 'augusto.henrrique@bandtec.com.br'),
  ('01212161', 'Juliana Esteves Trindade', 'Jardim Maringa', 'juliana.trindade@bandtec.com.br'),
  ('01212070', 'Paulo Gabriel Andrade de Souza', 'Jardin Ricardo', 'paulo.souza@bandtec.com.br');


alter table aluno add fkempresa int;
desc aluno;
alter table empresa drop fkempresa;
-- add adicionar 
alter table aluno add foreign key (fkempresa)
references Empresa (idEmpresa);

 -- exibir as duas tabelas
select * from aluno, Empresa
where idEmpresa = fkempresa;

-- exibir somente de um registro
select * from aluno, Empresa
where idEmpresa = fkempresa and nomeEmpresa = 'Safra';

-- exibir de duas colunas
select * from aluno, Empresa
where idEmpresa = fkempresa and nomeEmpresa in ('Safra', '(2)');

update aluno set fkempresa = 4 where ra= '01212003';

-- exibir somende o idEmpresa das duas tabelas
select ra,nome_aluno, bairro, email, fkempresa, nomeEmpresa, responsavel from empresa, aluno where idEmpresa = fkempresa;

-- excluir tabela empresa
drop table Empresa;

-- QUANDO SE TEM DUAS COLUNAS COM NOMES IGUAIS EXEMPLO: ALUNO.NOME EMPRESA.NOME DEVE TER A TABELA NA FRENTE

SELECT ra as 'Matricula', nome_aluno as 'Nome do Aluno', nomeEmpresa as 'Empresa de Interesse'
 from aluno JOIN empresa ON idEmpresa = fkempresa;
 
 
 
 
 
 