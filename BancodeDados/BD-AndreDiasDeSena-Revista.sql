-- criar database Revista
create database revista;
-- selecionar banco de dados revista 
use revista;

-- criar tabela Revista
create table Revista(
idRevista int primary key,
nome varchar(40),
categoria varchar(30)
);

-- exibir tabela 
select * from Revista;

-- inserir registros na tabela 
insert into Revista values
(1, 'Recreio',null ),
(2, 'Veja', null),
(3, 'Carro', null),
(4, 'Agora', null);

-- exibir dados ta tabela
select * from Revista;

-- atualizando os dados das categorias 
update Revista set categoria = 'Educativo'where idRevista = 1;
update Revista set categoria = 'Informativo'where idRevista = 2;
update Revista set categoria = 'Automotivo'where idRevista = 3;
update Revista set categoria = 'Noticia'where idRevista = 4;

-- inserir mais registros na tabela Revista
select * from Revista; 
insert into Revista values
(5, 'Vogue', 'Moda'),
(6, 'Capricho', 'Entretenimento'),
(7, 'Jornal', 'Noticia');

-- exibir tabela
select * from Revista; 

-- describe, exibir a descrição da tabela Revista
describe Revista;

-- alter table, alterar a tabela 
-- modify column, modificar a coluna  
alter table Revista modify column categoria varchar (40);
-- exibindo novamente a descrição para verificar alteração 
describe Revista;

-- add column, acrescentar coluna na tabela
alter table Revista add column Periodicidade varchar(15);

-- exibir os dados da tabela
select * from Revista;

-- drop column, excluir coluna da tabela
alter table Revista drop column periodicidade;