use faculdade;
drop table Pet;
drop table Cliente;

--
create table Pet(
idPet int primary key auto_increment,
tipo_animal varchar(15),
nome_pet varchar(30),
raça varchar (15),
data_nascimento date) 
auto_increment = 101;
--
create table Cliente(
idCliente int primary key auto_increment,
nome_cliente varchar(30),
telefone_fixo char (15),
telefone_celular char (15),
endereço varchar (20))
auto_increment = 001;
--
select * from Pet;
insert into Pet (tipo_animal, nome_pet, raça, data_nascimento) values
('Cachorro', 'Bingo', 'Dalmatas', '2019-04-23'),
('Leão', 'Simba', 'Felino', '2018-02-12'),
('Gato', 'Felix', 'Gatuno', '2017-08-30'),
('Cachorro', 'Dino', 'Budog', '2018-04-23'),
('Cachorro', 'REX', 'Vira-lata', '2010-06-27'),
('Passaro', 'José', 'Papagaio', '2019-04-03'),
('Peixe', 'Nemo', 'Palhaço', '2019-04-03'),
('Gato', 'Silas', 'Felino', '2019-04-23');

select * from Cliente;
insert into Cliente (nome_cliente, telefone_fixo, telefone_celular, endereço) values
('Carlos silva', '40916566', '(11)967837433', 'rua carioca'),
('Pedro ferreira', '40236565', '(11)967834567', 'rua manuel'),
('João souza', '40435676', '(11)967832456', 'rua prata'),
('Maria luiz', '40916345', '(11)96786789', 'rua clara'),
('Ana julias', '40911212', '(11)967833456', 'rua escura'),
('Lucas silva', '40911212', '(11)967833456', 'rua brasil');

alter table Pet add fkCliente int;
alter table Pet add foreign key (fkCliente) references  Cliente (idCliente);
desc Pet;


update Pet set fkCliente = 001 where idPet = 101;
update Pet set fkCliente = 002 where idPet = 102;
update Pet set fkCliente = 003 where idPet = 103;
update Pet set fkCliente = 004 where idPet = 104;
update Pet set fkCliente = 001 where idPet = 105;
update Pet set fkCliente = 001 where idPet = 106;
update Pet set fkCliente = 005 where idPet = 107;
update Pet set fkCliente = 006 where idPet = 108;

select * from Pet join Cliente on fkCliente = idCliente;
select * from Pet join Cliente on Pet.fkCliente = Cliente.idCliente
	where Cliente.nome_cliente  = 'Carlos silva';
    
select * from Pet join Cliente on Pet.fkCliente = Cliente.idCliente
	where Cliente.nome_cliente  like '%silva';
    
    select nome_pet, data_nascimento from Pet;
    
    alter table Cliente modify column nome_cliente varchar(35);
    
select * from Pet order by nome_pet asc;

select* from Cliente order by endereço desc;

select * from Cliente where nome_cliente like '%silva';

update Cliente set telefone_fixo= '40919999' where idCliente = 103;

select * from Pet join Cliente on Pet.fkCliente = Cliente.idCliente
	where Cliente.nome_cliente  = 'Maria luiz';

delete from Pet where idPet= 104;