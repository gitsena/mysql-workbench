-- criar banco de dados 
create database chocolate;

-- ultilizar o banco criado
use chocolate;

-- criar tabela
create table marcas(
idChocolate int primary key,
marca varchar (40),
sabor varchar (40),
peso varchar (20)
);

-- inserir registros na tabela
insert into marcas values
(100, 'nestle', 'ao leite', '100g', null ),
(101, 'lacta', 'meio amargo', '90g', null),
(102, 'garoto', 'branco', '100g', null),
(103,'ferreiro roche', 'amendoim', '70g', null);

-- exibir tabela
select * from marcas;

-- alterar uma informação da tabela
update marcas set sabor ='avela' where idChocolate=103;

-- alterar especificação da coluna
alter table marcas modify column peso varchar (30);

-- add uma nova coluna na tabela 
alter table marcas add column validade varchar (40);

-- inserir informações atualizadas na coluna adicionada
update marcas set validade = '10/01/2001' where idChocolate=100;
update marcas set validade = '09/02/2000' where idChocolate=101;
update marcas set validade = '18/02/2002' where idChocolate=102;
update marcas set validade = '27/03/2000' where idChocolate=103;
 
 -- exibir tabela
 select * from marcas;
 
 -- exibir a coluna da tabela com uma letra especifica 
 select * from marcas
 where sabor like '%e';
 
 -- inserir mais registros na tabela marcas
 insert into marcas values 
 (105,'tubetes', 'trento', '70g', '04/03/2001');

-- exibir tabela por ordem crescente ou decrescente 
 select * from marcas order by sabor desc;
 select * from marcas order by marca asc;
 
 -- deletar um dado inteiro da tabela
 delete from marcas where idChocolate =105;
 
 -- exibir a descrição da tabela 
 desc marcas;
 
 -- apagar somente os dados da tabela ]
 truncate marcas;