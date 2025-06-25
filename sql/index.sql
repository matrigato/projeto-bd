START TRANSACTION;

CREATE INDEX projeto.IdxAlunoAtivo ON projeto.matricula (aluno)
	WHERE status = 'ativa';

CREATE INDEX projeto.IdxAvaliacaoMedia ON projeto.matricula
	((classificacao_didatica + classificacao_material + classificacao_relevancia + classificacao_infraestrutura) / 4);

CREATE INDEX projeto.IdxNomeUsuarioUpper ON projeto.matricula (Upper(usuario.nome))

CREATE INDEX projeto.IdxVinculoUsuarioUpper ON projeto.matricula (Upper(usuario.vinculo))
	
COMMIT;
