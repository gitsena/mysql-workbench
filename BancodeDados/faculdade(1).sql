-- criar banco de dados faculdade;
-- criar o banco de dados apenas uma vez
-- creat database faculdade

create database faculdade;

-- selecionar o banco de dados faculdade
use faculdade;

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
 ('01212003', 'ANDRE DIAS DE SENA', 'TABOÃO', 'andrediasdesena@gmail.com');
  INSERT INTO aluno VALUES
 ('01212002', 'THIAGO SILVA', 'CAMPANARIO', 'THIAGO@gmail.com');
 
 -- vamos inserir mais alunos na mesma comando --
  INSERT INTO aluno VALUES
  ('01212066', 'Guilherme Vazquez Garcia', 'Conceição', 'guilherme.garcia@bandtec.com.br');
  
  INSERT INTO aluno VALUES
  ('01212145', 'Augusto Henrrique', 'Vila Chavez', 'augusto.henrrique@bandtec.com.br'),
  ('01212161', 'Juliana Esteves Trindade', 'Jardim Maringa', 'juliana.trindade@bandtec.com.br'),
  ('01212070', 'Paulo Gabriel Andrade de Souza', 'Jardin Ricardo', 'paulo.souza@bandtec.com.br');

SELECT email, nome_aluno, bairro FROM aluno WHERE bairro = 'jardin Ricardo';

SELECT bairro FROM aluno
 WHERE bairro LIKE '%a%';

SELECT nome_aluno FROM aluno
 WHERE nome_aluno LIKE '%i_';

SELECT nome_aluno FROM aluno
 WHERE nome_aluno LIKE '% % _n%';
 
 update aluno set nome_aluno = 'Andre Dias de Sena' WHERE ra = '01212003';





 
 
 