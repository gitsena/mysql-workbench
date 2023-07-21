use faculdade;

--  FOREIGN KEY (fkGrupo) REFERENCES grupo(idGrupo),
--  FOREIGN KEY (fkProfessor) REFERENCES professor(idProfessor),
--  PRIMARY KEY (fkGrupo,fkProfessor, dataHora));

-- select * from Pet join Cliente on fkCliente = idCliente;
-- select * from Pet join Cliente on Pet.fkCliente = Cliente.idCliente
	-- where Cliente.nome_cliente  = 'Carlos silva';
    
-- -- Exibir os dados dos grupos e os dados de seus respectivos alunos.
	-- SELECT
	 -- grupo.nomeGrupo as "Nome do Grupo" , 
     -- grupo.descricao as 'Descrição',
	 -- aluno.nomeAluno as 'Nome do Aluno',
	 -- aluno.ra,
	 -- aluno.email
			-- FROM grupo
				-- JOIN aluno
					-- on idGrupo=fkGrupo;