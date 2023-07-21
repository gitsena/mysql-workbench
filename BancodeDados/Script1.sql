 
 CREATE DATABASE sprint1;
  USE sprint1;

-- CRIAR TABELA ATLETA
  
CREATE table atleta (
IdAtleta int primary key,
Nome varchar(40),
Modalidade varchar(40),
QtdMedalha int
);
SELECT *FROM atleta;
-- INSERIR DADOS NA TABELA 

INSERT INTO atleta values
('2021', 'Bianca Messias', 'Handebol', '8'),
('1415', 'Lucas Alves', 'Skate', '5'),
('2022', 'Vitoria Oliveira', 'Handebol', '10'),
('4546', 'Matheus Eloy', 'Volei', '9'), 
('7458', 'Bruna Marques', 'Volei', '4');


select * from atleta; 

-- EXIBIR TODOS OS DADOS DA TABELA 
select IdAtleta, Nome, Modalidade, QtdMedalha From atleta;

-- EXIBIR APENAS OS NOMES E QUANTIDADE DE MEDALHAS DOS ATLETAS 
Select IdAtleta, Nome, Modalidade, QtdMedalhas From atleta WHere Modalidade = 'Handebol';

-- EXIBIR OS DADOS DA TABELA ORDENADOS PELA MODALIDADE
select * FROM atleta order by modalidade;
-- EXIBIR OS DADOS DA TABELA, ORDENADOS PELA QNTD DE MEDALHAS, EM ORDEM DECRESCENTE. 
select * FROM atleta order by qtdMedalha desc; 

-- EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME CONTENHA A LETRA S
select * FROM atleta where Nome Like '%s%';
-- EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME COMECE COM UMA DETERMINADA LETRA 
select Nome From atleta where Nome LIKE 'B%';

-- EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME TERMINE COM A LETRA A
select Nome from atleta where Nome like '%_A';

-- EXIBIR OS DADOS DA TABELA, DOS ATLETAS CUJO NOME TENHA A PENULTIMA LETRA R 
select * from atleta where nome like '%R_'







