create database banco;
use banco;

create table usuario (
id int primary key auto_increment,
nome varchar(45),
saldo decimal(10,2)
)auto_increment = 100;

insert into usuario values (null, "Vivian", 100.00);
insert into usuario values (null, "Vitor", 100.00);

select * from usuario;

-- start transaction inicia uma transição
start transaction;
update usuario set saldo = 80.00 where id = 100;
-- commit cumpri a transição e encerra, ou rollback volta a ultima transição
rollback;
commit;

start transaction;
insert into usuario values (null, "sarah", 1000.00);
select * from usuario;