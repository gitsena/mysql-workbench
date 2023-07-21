create database treinador;
use treinador;

drop table treinador;
drop table nadador;
create table treinador(
idtnd int primary key auto_increment,
nome_tnd varchar (40),
tel char(15),
email varchar(35) unique,
fk_trein_exp int 
)auto_increment = 10;

-- inserindo um treinador sem ser treinado por outro
insert into treinador values
(null, "Rafael silva", "11 976454321", "rafael@gmail.com", null);
-- inserindo um treinador que é treinado por rafael
insert into treinador values
(null, "Pedro lins", "11 976434344", "pedro@gmail.com", 10);
-- inserindo outros treinadores novatos e seus respectivos treinadores 
insert into treinador values
(null, "Andre ferraz", "11 976434344", "andre@gmail.com", 10),
(null, "Barbara oliveira", "11 976434344", "barbara@gmail.com", 12),
(null, "Ana beatriz", "11 976434344", "anab@gmail.com", 13),
(null, "Rodrigo lira", "11 976434344", "rodrigo@gmail.com", 12),
(null, "Denis santos", "11 976434344", "denis@gmail.com", 10);

select * from treinador;

-- exibir os treinadores novatos e seus respectivos treinadores 
select * from treinador as tr_nov join treinador as tr_exp on tr_nov.fk_trein_exp = tr_exp.idtnd;

create table nadador(
idnadador int primary key auto_increment,
nome varchar (45),
estado_origem varchar(40),
data_nasc date,
fktnd int,
foreign key (fktnd) references treinador(idtnd)
)auto_increment = 100;

insert into nadador values
(null, "Fabio", "Bahia", "1992-02-28", 10),
(null, "Matheus", "Minas", "1992-02-28", 10),
(null, "Mayra", "Para", "1992-02-28", 10),
(null, "Larissa", "Bahia", "1992-02-28", 11),
(null, "Guilherme", "São paulo", "1992-02-28", 11),
(null, "Layza", "São paulo", "1992-02-28", 12),
(null, "Chico", "Santa catarina", "1992-02-28", 13),
(null, "Ronaldo", "Vitoria", "1992-02-28", 14),
(null, "Allan", "Rio grande do sul", "1992-02-28", 15);

select * from nadador;

-- exibir os treinadores e os nadadores 
select * from treinador join nadador on fktnd = idtnd;
-- exibir os dados de um determinado treinador pelo nome e seus respectivos nadadores
select * from treinador join nadador on fktnd = idtnd where treinador.nome_tnd = "Rafael silva";
-- exibir os nomes dos treinadores e dos respectivos treinadores experiente
SELECT 
    tr_experiente.nome_tnd AS 'treinador experiente',
    tr_novato.nome_tnd AS 'treinador novatos'
FROM
    treinador AS tr_experiente
        JOIN
    treinador AS tr_novato ON tr_novato.fk_trein_exp = tr_experiente.idtnd;
    
    -- exibir os dados dos treinadores e dos treinadores experiente porem de um determinado treinador
SELECT 
    *
FROM
    treinador AS tr_nov
        JOIN
    treinador AS tr_exp ON tr_nov.fk_trein_exp = tr_exp.idtnd
WHERE
    tr_exp.nome_tnd = 'Andre ferraz';  
-- exibir os treinadore seus respectivos nadadores e os treinadores experiente (orientadores)
select * from treinador as tr_nov join nadador on fktnd = idtnd 
                          join treinador as tr_exp on tr_nov.fk_trein_exp = tr_exp.idtnd;       
-- exibir um determinado treinador pelo nome seu respectivo nadadores e seu treinador orientador
select * from  treinador as tr_nov join nadador on fktnd = idtnd
                                                 join treinador as tr_exp on tr_nov.fk_trein_exp = tr_exp.idtnd 
                                                                                        where tr_nov.nome_tnd = "Pedro lins";
-- exibir os treinadores e os nadadores com e sem os treinadores
select * from treinador
left join nadador on fktnd = idtnd;
-- exibir os nadadores e treinadores sem treinadores
SELECT * FROM  nadador right join treinador on idtnd = fktnd;
-- exibir os treinadores e os nadadores sem os treinadores orientador
select * from treinador
left join nadador on fktnd = idtnd where fk_trein_exp is null;