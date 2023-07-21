create database praticaAtributo;
USE praticaAtributo;

-- numero celular e fixo e email multivalorado porque é da msm familia 
-- endereço atributo  composto dividino em multpartes , não é da mesma familia 
create table funcionario(
idFuncionario int primary key,
nome_completo varchar (45),
tel_fixo char(15),
cel varchar(15),
email_pessoal varchar(35),
email_empresa varchar (35),
rua varchar(35),
numero int,
bairro varchar(30),
cidade varchar(30),
estado varchar(30),
cep char(10),
salario decimal (10,2), 
check (salario > 0 )
);

drop table funcionario;


insert into funcionario values
(100, 'Andre Dias de Sena', '(11) 4091-6880', '(11)96785-3423', 'andrediasdesena@hotmail.com', 'andre.sena@bandtec.com', 'rua Ouro', 35, 'taboão', 'Diadema', 'São Paulo', '09971-513', 3000.50 ),
(101, 'Raphael Souza', '(11) 4091-6880', '(11)96785-3423', 'andrediasdesena@hotmail.com', 'andre.sena@bandtec.com', 'rua Ouro', 35, 'taboão', 'Diadema', 'São Paulo', '09971-513', 2000.00 ),
(102, 'Fernanda Oliveira', '(11) 4091-6880', '(11)96785-3423', 'andrediasdesena@hotmail.com', 'andre.sena@bandtec.com', 'rua Ouro', 35, 'taboão', 'Diadema', 'São Paulo', '09971-513', 1900.00 );

select * from funcionario;