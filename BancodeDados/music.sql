use sprint1;
create table musica(
idMusica int primary key auto_increment,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

desc musica;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| idMusica | int         | NO   | PRI | NULL    |       |
| titulo   | varchar(40) | YES  |     | NULL    |       |
| artista  | varchar(40) | YES  |     | NULL    |       |
| genero   | varchar(40) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

select * from musica;
insert into musica values
('1', 'Believe', 'Imagine Dragon', 'Rock'),
('2', 'Radioactive', 'Imagine Dragon', 'Rock'),
('3', 'In The End', 'Linkin Park', 'Rock'),
('4', 'Toosie Slide', 'Drake', 'Trap'),
('5', 'Céu Azul', 'Charlie Brown Jr', 'Rock Alternativo'),
('6', 'Sosseguei', 'Jorge & Mateus', 'Sertanejo'),
('7', 'Todo Mundo Vai Sofrer', 'Marilia Mendonça', 'Sertanejo'),
('8', 'Quarta Cadeira', 'Matheus & kauan', 'Sertanejo'),
('9', 'Vai Se Tratar Garota', 'Mc Don Juan, Mc Davi Feat Mc Pedrinho', 'Funk');

select * from musica;
insert into musica value
(null, 'Tavendo aquela lua', 'Thiaguinho', 'pagode');

select titulo, artista from musica;

select idMusica, titulo, artista, genero 
from musica where genero = 'Sertanejo';

select idMusica, titulo, artista, genero 
from musica where genero = 'Rock';

select idMusica, titulo, artista, genero 
from musica where artista = 'Imagine Dragon';

select idMusica, titulo, artista, genero from musica;

select idMusica, titulo, artista, genero
from musica where titulo like 'T%';

select idMusica, titulo, artista, genero 
from musica where titulo like '%e';

select idMusica, titulo, artista, genero 
from musica where genero like '_o%';

select idMusica, titulo, artista, genero 
from musica where titulo like '%e_';

-- asc ordenar por ordem crescente --
select * from musica 
order by artista, genero asc;

-- desc ordernar por ordem decrescente; --
select * from musica 
order by artista, genero desc;
-- inserir duas informaçoes em duas colunas 
insert into musica (titulo, artista) values ('gostava tanto de você', 'Tim Maia');
-- alterar o varchar da tabela 
alter table musica modify column titulo varchar (70);
-- delete from musica  where idmusica = 8 or idmusica = 9;
-- delete from musica where idmusic = 8;
-- delete from musica where idmusica in (8.9);

-- truncate excluir todas as informaçoes da tabela 
truncate musica;
drop table musica;
