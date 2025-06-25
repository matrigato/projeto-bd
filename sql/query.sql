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

-- Procurar por usuario especifico
SELECT nome, sobrenome, email, vinculo
	FROM projeto.usuario
	WHERE Upper(usuario.nome)=’PATETA’;

-- Alunos e suas respectivas notas em alguma disciplina 
SELECT aluno, nota
	FROM (SELECT aluno, disciplina, nota FROM projeto.matricula)
	WHERE disciplina = 'SCC0240');

-- Todos os professores de determinado departamento
SELECT professor, disciplina
	FROM projeto.ministra
	WHERE disciplina IN (SELECT disciplina, curso_departamento FROM projeto.compoe WHERE curso_departamento = 'ICMC');

-- Todos os alunos 
SELECT aluno
	FROM (SELECT aluno, unidade FROM projeto.usuario WHERE vinculo = 'aluno')
	WHERE unidade IN (SELECT id FROM projeto.unidade WHERE (pais, cidade) = ('Brasil', 'São Carlos'));



COMMIT;

