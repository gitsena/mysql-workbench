create database exercicios;
use exercicios;

-- criando tabela Ator
CREATE TABLE Ator (
    idAtor INT PRIMARY KEY AUTO_INCREMENT,
    nomeAtor VARCHAR(45),
    dtNasc DATE
)  AUTO_INCREMENT=100;

-- inserir dados na tabela ator (idAtor - 100)
insert into Ator values
(null, "Robeert dj", "1986-02-11"),
(null, "Chris Evans", "1990-03-18"),
(null, "Jennifer", "1994-06-20"),
(null, "Angelina j", "1982-10-21"),
(null, "Tom Holland", "1999-05-12"),
(null, "jhony Depp", "1984-04-30");

-- exibir tabela Ator
SELECT 
    *
FROM
    Ator;

-- criando tabela Diretor
CREATE TABLE Diretor (
    idDiretor INT PRIMARY KEY AUTO_INCREMENT,
    nomeDiretor VARCHAR(45),
    paisNasc VARCHAR(30)
)  AUTO_INCREMENT=1;

-- inserir dados na tabela Diretor (idDiretor - 1)
insert into Diretor values
(null, "kelvin Figer", "Estados Unidos"),
(null, "Robert dj", "Estados Unidos"),
(null, "Shan J", "Coreia"),
(null, "Cloe G", "Canada");

-- exibir tabela Diretor
SELECT 
    *
FROM
    Diretor;

-- criando tabela Filme ( idFilme = 1000)
CREATE TABLE Filme (
    idFilme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    genero VARCHAR(25),
    fkDiretor INT,
    FOREIGN KEY (fkDiretor)
        REFERENCES Diretor (idDiretor)
)  AUTO_INCREMENT=1000;

-- inserir dados na tabela Filme
insert into Filme values
(null, "Avengers", "Aventura", 1),
(null, "Avengers Ultimate", "Aventura", 1),
(null, "Jogos Vorazes", "Ação", 3),
(null, "Eternos", "Ficção", 4),
(null, "Spider Man", "Aventura", 1),
(null, "Piratas do caribe", "Aventura", 2),
(null, "Iron Man", "Ação", 1),
(null, "Capitão America", "Aventura", 1);

--  exibir tabela Filme
select * from filme;

-- tabela dependente - personagem
CREATE TABLE Personagem (
    fkAtor INT,
    FOREIGN KEY (fkAtor)
        REFERENCES Ator (idAtor),
    fkFilme INT,
    FOREIGN KEY (fkFilme)
        REFERENCES Filme (idFilme),
    PRIMARY KEY (fkAtor , fkFilme),
    papel VARCHAR(35),
    ganhos DOUBLE,
    check (ganhos > 0)
);

-- inserir dado na tabela Personagem
insert into Personagem values
(100, 1000, "Iron Man", 60000),
(101, 1001, "Capitão America", 50000),
(102, 1002, "Joe", 50000),
(103, 1003, "Thena", 60000),
(104, 1004, "Piter Parker", 30000),
(105, 1005, "Pirata", 40000),
(101, 1000, "Capitão america", 40000),
(100, 1001, "Iron man", 40000),
(100, 1006, "Iron man", 40000),
(101, 1007, "Capitão america", 40000);

-- exibir tabela Personagem
SELECT 
    *
FROM
    Personagem;

-- exibir os dados dos diretores e os dados dos seus filmes
SELECT 
    *
FROM
    Diretor AS DR
        JOIN
    Filme AS F ON F.fkDiretor = DR.idDiretor;

-- exibir os dados de um determinado diretor e os dados de seus filmes (informar o nome do diretor
SELECT 
    *
FROM
    Diretor
        JOIN
    Filme ON fkDiretor = idDiretor
WHERE
    nomeDiretor = 'Kelvin Figer';

-- exibir a media e a soma dos valores pagos as atores no geral
SELECT 
    AVG(Personagem.ganhos) AS 'Media',
    SUM(Personagem.ganhos) AS 'Soma'
FROM
    Personagem;

-- exibir o menos e o maior valor pago ao atores 
SELECT 
    MIN(Personagem.ganhos) AS 'Menos valor',
    MAX(Personagem.ganhos) AS 'Maior valor'
FROM
    Personagem;

-- exibir os dados dos filmes os dados dos atores, seus papeis e os valores ganhos
SELECT 
    *
FROM
    Personagem
        JOIN
    filme ON fkFilme = idFilme
        JOIN
    Ator ON fkAtor = idAtor;

-- exibir determinados dados, com titulo editado
SELECT 
    Ator.nomeAtor AS 'Nome Ator',
    Ator.dtNasc AS 'Data de Nascimento',
    Filme.titulo AS 'Titulo do Filme',
    Filme.genero AS 'Gênero',
    Personagem.papel AS 'Papel de Atuação',
    Personagem.ganhos AS 'Valor Recebido'
FROM
    Personagem
        JOIN
    filme ON fkFilme = idFilme
        JOIN
    Ator ON fkAtor = idAtor;
    
-- exibir dados de um determinado filme ( informar o titulo) os atores deste filme e o valor ganhos
SELECT 
    *
FROM
    Personagem
        JOIN
    Filme ON fkFilme = idFilme
        JOIN
    Ator ON fkAtor = idAtor
WHERE
    Filme.titulo = 'Avengers';
    -- exibir os dados dos filmes os dados dos diretores os dados dos atores e o valor ganho 
    SELECT 
    *
FROM
    Personagem
        JOIN
    filme ON fkFilme = idFilme
        JOIN
    Ator ON fkAtor = idAtor
        JOIN
    Diretor ON fkDiretor = idDiretor;
-- exibir a indentificação do filme (fk ou nome)  a media e a soma do valor ganho agrupado por filme (?)
select Filme.titulo as "Titulo do Filme", sum(ganhos) as "Soma", truncate(avg(ganhos),2) as "Média" from Filme join Personagem on fkFilme = idFilme group by titulo;
    
-- exibir a indentificação do Ator (fk ou nome)  a media e a soma do valor ganho agrupado por ator (?)
select Ator.nomeAtor as "Nome Ator", sum(ganhos) as "Soma", truncate(avg(ganhos),2) as "Média" from Ator join Personagem on fkAtor = idAtor group by Ator.nomeAtor;

-- exibir a indentificação do filme (fk ou nome)  o menor e maior valor ganho agrupado por filme
select Filme.titulo as "Titulo do Filme", max(ganhos) as "Valor maximo", min(ganhos) as "Valor minimo" from Filme join Personagem on fkFilme = idFilme group by titulo;

-- exibir a indentificação do Ator (fk ou nome)  o maior e menor dvalor ganho agrupado por ator
select Ator.nomeAtor as "Nome Ator", max(ganhos) as "Valor maximo", min(ganhos) as "Valor minimo" from Ator join Personagem on fkAtor = idAtor group by nomeAtor;

