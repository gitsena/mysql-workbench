CREATE DATABASE termovinho;

USE termovinho;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
     cpf char(12),
    telefone char(12)
);

select * from usuario;

