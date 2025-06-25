START TRANSACTION;

-- Todos os professores e os alunos com matrícula ativa para quem eles lecionam
CREATE VIEW projeto.professor_aluno
	AS SELECT a.professor, b.aluno, b.disciplina FROM
	(SELECT email AS professor FROM projeto.usuario WHERE UPPER(vinculo) = 'PROFESSOR') a
		LEFT OUTER JOIN
	(SELECT DISTINCT m.professor, c.aluno, m.disciplina
		FROM projeto.ministra m, projeto.matricula c
		WHERE m.disciplina = c.disciplina AND c.status = 'ativa'
	) b
		ON a.professor=b.professor;


-- Discipinas em que Alunos estão matriculados, de sua mesma Unidade
CREATE VIEW projeto.matricula_mesma_unidade
	AS SELECT c.aluno, c.disciplina, c.unidade FROM
	(SELECT a.aluno, b.disciplina, a.unidade FROM
		(SELECT email as aluno, unidade FROM projeto.usuario WHERE UPPER(vinculo) = 'ALUNO') a
			JOIN projeto.matricula b
			ON a.aluno=b.aluno) c
		JOIN projeto.disciplina d
		ON c.disciplina=d.codigo AND c.unidade=d.unidade;

SELECT * FROM projeto.professor_aluno;
SELECT * FROM projeto.matricula_mesma_unidade;

COMMIT;
