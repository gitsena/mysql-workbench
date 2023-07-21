create table musica(
idMusica int primary key,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

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

drop table musica;
