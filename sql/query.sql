START TRANSACTION;


-- Obtém a média geral da média das classificações da disciplina
SELECT disciplina, AVG(((classificacao_didatica + classificacao_material + classificacao_relevancia + classificacao_infraestrutura) / 4)) avaliacao_geral
	FROM projeto.matricula m
	GROUP BY disciplina
	ORDER BY avaliacao_geral DESC;

-- Mensagens enviadas por um professor
SELECT destinatario, conteudo Mensagem, timestamp
	FROM projeto.mensagem
	WHERE remetente = 'professor@gmail.com'
	ORDER BY timestamp;

-- Alunos que cursam todas as disciplinas de um professor
SELECT aluno
	FROM (SELECT aluno, disciplina FROM projeto.matricula)
	WHERE disciplina IN (SELECT disciplina FROM projeto.ministra WHERE professor = 'professor@gmail.com')
	GROUP BY aluno
	HAVING COUNT(*) = (SELECT COUNT (*) FROM projeto.ministra WHERE professor = 'professor@gmail.com');


COMMIT;

