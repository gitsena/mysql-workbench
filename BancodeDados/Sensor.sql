use faculdade;

create table sensor(
idSensor int primary key auto_increment,
nomeSensor varchar (50),
localSensor varchar (70),
temperatura double not null,
dtTemp datetime default current_timestamp,
statusSensor varchar (40),
check (statusSensor = 'ativo' or statusSensor ='inativo')
);
 select sysdate();
-- int
-- float 7 digitos (32-bit) 0,76
-- double 15 digitos (64-bit) 1,234756
-- decimal  28 digitos (128-bit) 500,87634 -regra de negocil do arduino so aceita double
-- decimal 8,5
-- por não definir se esta ativo ou inativo segundo a ordem da tabela dará erro
insert into sensor (nomeSensor, localSensor, temperatura, statusSensor) values
('Sensor D', 'Estufa beta', 34.8, 'manutenção');
-- inserido corretamente definido como ativo
insert into sensor (nomeSensor, localSensor, temperatura, statusSensor) values
('Sensor A', 'Estufa Alfa', 34.8, 'ativo');

select * from sensor;

-- correção do erro exemplo sensor_chk_1 (normal notificar com o x vermelho de erro)
alter table sensor drop check sensor_chk_1;

alter table sensor add check (statusSensor = 'ativo' or
statusSensor = 'inativo' or statusSensor = 'manutenção');

insert into sensor (nomeSensor, localSensor, temperatura, statusSensor) values
('Sensor B', 'ELETRON', 26.8, 'manutenção'),
('Sensor C', 'EST ARDUINO', 30.2, 'inativo');

select * from sensor;

-- COUNT() exibe a quantidade de dados de certa coluna 
SELECT COUNT(idSensor) from sensor;
SELECT COUNT(localSensor) from sensor;

-- sum() serve para somar 
select sum(temperatura) from sensor;

-- avg() serve para exibir a media 
select avg(temperatura) from sensor;

-- round(()) arredondar 
select round(avg(temperatura),2) from sensor;

-- truncate
select truncate(avg(temperatura),2) from sensor;

select min(temperatura) as 'Temperatura Minima', max(temperatura) as 'Temperatura Maxima' from sensor;

drop table sensor;
