START TRANSACTION;

-- Obtém a média geral da média das classificações da disciplina
EXPLAIN ANALYZE SELECT disciplina, AVG(((classificacao_didatica + classificacao_material + classificacao_relevancia + classificacao_infraestrutura) / 4)) avaliacao_geral
	FROM projeto.matricula m
	GROUP BY disciplina
	ORDER BY avaliacao_geral DESC;

-- Procurar por usuario especifico
EXPLAIN ANALYZE SELECT nome, sobrenome, email, vinculo
	FROM projeto.usuario
	WHERE Upper(usuario.nome)='PATETA';

-- Todos os alunos das unidades em alguma localidade
EXPLAIN ANALYZE SELECT aluno
	FROM (SELECT email AS aluno, unidade FROM projeto.usuario WHERE Upper(vinculo) = 'ALUNO')
	WHERE unidade IN (SELECT id FROM projeto.unidade WHERE (pais, cidade) = ('Brasil', 'São Carlos'));



-- Todos os professores e os alunos com matrícula ativa para quem eles lecionam
EXPLAIN ANALYZE SELECT a.professor, b.aluno, b.disciplina FROM
	(SELECT email AS professor FROM projeto.usuario WHERE vinculo = 'Professor') a
		LEFT OUTER JOIN
	(SELECT DISTINCT m.professor, c.aluno, m.disciplina
		FROM projeto.ministra m, projeto.matricula c
		WHERE m.disciplina = c.disciplina AND c.status = 'ativa'
	) b
		ON a.professor=b.professor;




-- Discipinas em que Alunos estão matriculados, de sua mesma Unidade
EXPLAIN ANALYZE SELECT c.aluno, c.disciplina, c.unidade FROM
	(SELECT a.aluno, b.disciplina, a.unidade FROM
		(SELECT email as aluno, unidade FROM projeto.usuario WHERE Upper(vinculo) = 'ALUNO') a
			JOIN projeto.matricula b
			ON a.aluno=b.aluno) c
		JOIN projeto.disciplina d
		ON c.disciplina=d.codigo AND c.unidade=d.unidade;

SELECT * FROM projeto.professor_aluno;
SELECT * FROM projeto.matricula_mesma_unidade;


  




COMMIT;
