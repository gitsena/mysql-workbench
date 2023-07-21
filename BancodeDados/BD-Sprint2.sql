create database sprint2;
use sprint2;

-- criando tabela cliente
create table cliente(
idCliente int primary key auto_increment,
nome_cliente varchar (45),
tel_cel varchar(18),
endereco varchar(45),
CPF char(15)
)auto_increment = 1;

-- criando tabela usuario
create table usuario(
idUsuario int primary key auto_increment,
nome_usuario varchar (35),
login char (15),
senha varchar (20),
fkCliente int,
foreign key (fkCliente) references cliente(idCliente)
)auto_increment = 101;

-- criando tabela vinho
create table vinho (
idVinho int primary key auto_increment,
tipo varchar (35),
temp_ideal double,
temp_min double,
temp_max double
)auto_increment = 1001;

-- criando tabela barril
create table barril (
idBarril int primary key,
nome_barril varchar (20),
local_barril varchar (35),
fkCliente int,
fkVinho int,
foreign key (fkCliente) references cliente(idCliente),
foreign key (fkVinho) references vinho(idVinho)
);

-- criando tabela sensor
create table sensor (
idSensor int primary key auto_increment,
nome_sensor varchar (30),
status_sensor varchar (30),
check (status_sensor = 'ativo' or status_sensor = 'inativo'),
fkBarril int,
foreign key (fkBarril) references barril(idBarril)
)auto_increment = 001;

-- criando tabela leitura
create table leitura(
idLeitura int primary key auto_increment,
data_temp datetime default current_timestamp,
temperatura double not null,
fkSensor int,
foreign key (fkSensor) references sensor(idSensor)
)auto_increment = 10001;

--  inserindo dados na tabela cliente (idCliente = 1)
insert into cliente (nome_cliente, tel_cel, endereco, CPF) values
('Joaquin Brandine', '(11)975647329', 'AV Pauliceia','453.765.654-81'),
('ArmazenVinhos', '(11)999881243', 'Rua Notre Dame', '543.789.481-23'),
('Distribuidora VHB', '(11)945738699', 'Rua bela flor do campo', '768.234.945-05'),
('Casa da Uva', '(23)976234486', 'AV Mant sul', '218.529.472-67'),
('Aurora Vinho borgo', '(11)953701212', 'AV Ipiranga', '434.927.822-52');

-- inserindo dados na tabela usuario (idUsuario = 101)
insert into usuario (nome_usuario, login, senha, fkCliente) values
('Joaquin Brandine', 'Joaquin40', 'JoqB453', 1),
('Ricardo Silva', 'armazen01', 'ArmV001', 2),
('Junior Alvez', 'armazen01', 'ArmV002', 2),
('Daniela Felix', 'danielaVHB', 'Dist123', 3),
('Michele Dias', 'MicheleVHB', 'Dist456', 3),
('Carlos Souza', 'carlossouza', 'CDU#67', 4),
('Marcelo De Assis', 'marceloSS', 'Malinhares02', 5);

-- inserindo dados na tabela vinho (idVinho = 1001)
insert into vinho (tipo, temp_ideal, temp_min, temp_max) values
('Tinto Médio','17','16','18'),
('Rosé','14','12','15'),
('Branco','8','6','12');

-- inserindo dados na tabela barril 
insert into barril values
(0101, 'BarrilComum', 'Adega', 1, 1002),
(0102, 'Barril-M-101', 'corredor E1', 2, 1001),
(0103, 'Barril-M-102', 'corredor E1', 2, 1002),
(0104, 'Barril-M-103', 'corredor E1', 2, 1003),
(0105, 'B-madeira-A', 'Corredor-3-Adega-B', 3, 1001),
(0106, 'B-madeira-B', 'Corredor-3-Adega-C', 3, 1002),
(0107, 'BARRIL-Tinto', 'Adega-102-E', 4, 1001),
(0108, 'BARRIL-Rose', 'Adega-102-F', 4, 1002),
(0109, 'BARRIL-Branco', 'Adega-102-G', 4, 1003),
(0110, 'Barril-simples', 'corredor 02', 5, 1003);

-- inserindo dados na tabela sensor (idSensor = 001)
insert into sensor (nome_sensor, status_sensor, fkBarril) values
('sensor-01', 'ativo', 0101),
('sensor-02', 'ativo', 0102),
('sensor-03', 'ativo', 0103),
('sensor-04', 'ativo', 0104),
('sensor-05', 'ativo', 0105),
('sensor-06', 'ativo', 0106),
('sensor-07', 'ativo', 0107),
('sensor-08', 'ativo', 0108),
('sensor-09', 'ativo', 0109),
('sensor-10', 'ativo', 0110);

-- inserindo dados na tabela leitura
insert into leitura (temperatura, fkSensor) values
('14.02', 001 ),
('17', 002 ),
('14', 003 ),
('8.01', 004 ),
('17', 005 ),
('13.98', 006 ),
('17', 007 ),
('14', 008 ),
('8', 009 ),
('8.02', 010 );

-- exibir todas as tabelas (join on)
select * from leitura 
 join sensor on fkSensor = idSensor 
 join barril on idBarril = fkBarril 
 join cliente on fkCliente = idCliente
 join usuario on usuario.fkCliente = cliente.idCliente;

-- select de cada tabela 
select * from cliente;
select * from usuario;
select * from vinho;
select * from barril;
select * from sensor;
select * from leitura;

-- drop de cada tabela 
drop table cliente;
drop table usuario;
drop table vinho;
drop table barril;
drop table sensor;
drop table leitura;

--  data e hora do sistema
select sysdate();