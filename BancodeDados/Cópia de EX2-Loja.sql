use exercicios;

-- criando tabela Loja
create table Loja (
idLoja int primary key auto_increment,
nomeLoja varchar(40),
dt_funcao date
) auto_increment = 1000;

-- inserindo dados na tabela loja (idLoja = 1000)
insert into Loja values
(null, "Americanas", "2018-03-20"),
(null, "C&A", "2017-10-30"),
(null, "Renner", "2016-02-10"),
(null, "Casas Bahia", "2020-12-02"),
(null, "Extra", "2019-07-14");
-- exibir tabela Loja
select * from Loja;

-- criando tabela Categoria
create table Categoria (
idCtg int primary key auto_increment,
nomeCtg varchar(40)
) auto_increment = 10;
-- inserindo dados na tabela Categoria (idCtg = 10)
insert into Categoria values
(null, "Eletrônico"),
(null, "Têxtil"),
(null, "Alimento"),
(null, "Bazar");
-- exibir tabela Categoria
select * from Categoria;

-- criando tabela Produtos
create table Produto (
idP int auto_increment,
fkLoja int,
foreign key (fkLoja) references Loja(idLoja),
fkCtg int,
foreign key (fkCtg) references Categoria(idCtg),
primary key (idP, fkLoja, fkCtg),
descricao varchar(45),
marca varchar(35),
preco decimal (6, 2),
check (preco > 0)
) auto_increment = 100;

-- inserindo dados na tabela Produtos (idP = 100)
insert into Produto value
(null, 1000, 10, "Celular galaxy12", "Sansung", 1800),
(null, 1000, 12, "Chocolate", "Nestle", 8),
(null, 1001, 11, "camiseta azul", "pollo", 120),
(null, 1002, 11, "camiseta verde", "pollo", 119.99),
(null, 1001, 11, "Calça jeans", "Jeans", 100),
(null, 1002, 11, "Calça jeans", "Jeans", 99.99),
(null, 1004, 12, "Chocolate", "Nestle", 10),
(null, 1004, 12, "Arroz", "Camil", 23),
(null, 1004, 10, "Barbeador", "Bertec", 210 ),
(null, 1004, 13, "Jogo panela", "linux", 320),
(null, 1000, 13, "Tapete", "pol", 120);

-- exibir tabela Produto
select * from Produto;

-- exibir os dados das categorias e os dados dos seus produtos
select * from Categoria join Produto on fkCtg = idCtg;

-- exibir os dados de uma determinada categoria(informar o nome da categoria na consulta) e os dados dos seus produtos
select * from Categoria join Produto on fkCtg = idCtg where Categoria.nomeCtg = "Têxtil";

-- exibir a media e a soma dos preços dos produtos no geral
select truncate(avg(preco),2) as "Média dos Preços", sum(preco) as "Soma dos Preços" from Produto;

-- exibir o menor valor e o maior preço dos produtos, no geral
select min(preco) as "Preço minimo", max(preco) as "Preços maximo" from Produto;

-- exibir os dados dos produtos, os dados das lojas e os preços dos produtos em cada loja
select * from Produto join Loja on fkLoja = idLoja;

-- exibir os dados de um determinado produto( informar a descriçao) os dados das lojas e seu preço em cada loja 
select * from Produto join Loja on fkLoja = idLoja where Produto.descricao = "Calça jeans";

-- exibir os dados dos produtos, os dados das categoria os dados das lojas e os preços dos produtos
select * from Produto join Categoria on fkCtg = idCtg join Loja on fkLoja = idLoja;

-- exibir os dados dos produtos, os dados das categoria os dados das lojas e os preços dos produtos em geral ate os sem dados 
select * from Produto join Categoria on fkCtg = idCtg right join Loja on fkLoja = idLoja;

-- exibir a identificação do  produto(fk ou descrição), a média e a soma dos produtos, agrupado por produto
select Produto.idP, truncate(avg(preco),2) as "Média dos Preços", sum(preco) as "Soma dos Preços" from Produto group by Produto.idP;

-- exibir a identificação da loja(fk ou nome), a média e a soma dos produtos, agrupado por loja
select Loja.nomeLoja as "Nome da Loja", truncate(avg(preco),2) as "Média dos Preços", sum(preco) as "Soma dos Preços" from produto join Loja on idLoja = fkLoja group by Loja.nomeLoja;

-- exibir a identificação do produto(fk ou descrição) o menos e o maior preço agrupado por produto
select Produto.descricao as "Produto", min(preco) as "Menores Preços", sum(preco) as "Maiores Preços" from Produto group by Produto.descricao;

-- exibir a identificação da loja(fk ou nome) o menos e o maior preço agrupado por loja
select Loja.nomeLoja as "Nome da Loja", min(preco) as "Menores Preços", max(preco) as "Maiores Preços" from produto join Loja on idLoja = fkLoja group by Loja.nomeLoja;
