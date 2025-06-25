START TRANSACTION;

CREATE INDEX IdxAlunoAtivo ON projeto.matricula (aluno)
	WHERE status = 'ativa';

--CREATE INDEX IdxAvaliacaoMedia ON projeto.matricula
--	((classificacao_didatica + classificacao_material + classificacao_relevancia + classificacao_infraestrutura) / 4);

CREATE INDEX IdxNomeUsuarioUpper ON projeto.usuario (Upper(nome));

CREATE INDEX IdxVinculoUsuarioUpper ON projeto.usuario (Upper(vinculo));
	
COMMIT;
