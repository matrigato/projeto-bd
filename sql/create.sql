START TRANSACTION;

DROP SCHEMA IF EXISTS projeto CASCADE;
DROP DOMAIN IF EXISTS DEmail CASCADE;

-- Tamanho máximo de endereço de email é 254 chars
-- fonte: https://stackoverflow.com/a/574698
-- Domain com validação de email: https://dba.stackexchange.com/a/165923
CREATE DOMAIN DEmail AS varchar(254)
	CHECK ( value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$' );


CREATE SCHEMA projeto


	CREATE TABLE unidade(
		id serial PRIMARY KEY,
		pais varchar(50) NOT NULL,
		estado varchar(50) NOT NULL,
		-- maior cidade: Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
		cidade varchar(58) NOT NULL,
		rua varchar(80),
		numero smallint CHECK(numero >= 0),
		complemento varchar(80),
		
		UNIQUE(pais, estado, cidade, rua, numero, complemento)
	)
	
	CREATE TABLE usuario(
		email DEmail PRIMARY KEY,
		nome varchar(60) NOT NULL,
		sobrenome varchar(60) NOT NULL,
		telefone varchar(20) NOT NULL,
		data_nascimento timestamp NOT NULL,
		pais varchar(50) NOT NULL,
		estado varchar(50) NOT NULL,
		-- maior cidade: Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
		cidade varchar(58) NOT NULL,
		rua varchar(80),
		endereco_numero smallint CHECK(endereco_numero >= 0),
		endereco_complemento varchar(80),
		sexo varchar(9) NOT NULL CHECK(sexo in ('masculino', 'feminino', 'outro')),
		senha varchar(255) NOT NULL,
		-- participação parcial, não usaremos constraints
		vinculo varchar(40),
		prof_especializacao varchar(50),
		prof_titulacao varchar(40),
		unidade integer NOT NULL,

		UNIQUE(nome, sobrenome, telefone),

		FOREIGN KEY (unidade) REFERENCES unidade (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT
	)

	CREATE TABLE mensagem(
		remetente DEmail,
		destinatario DEmail,
		timestamp timestamp,
		conteudo text NOT NULL,

		PRIMARY KEY (remetente, destinatario, timestamp),

		FOREIGN KEY (remetente) REFERENCES usuario (email)
			ON UPDATE CASCADE
			ON DELETE CASCADE,

		FOREIGN KEY (destinatario) REFERENCES usuario (email)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE disciplina(
		codigo varchar(10) PRIMARY KEY,
		nro_aulas_semanais smallint NOT NULL,
		unidade integer NOT NULL,

		FOREIGN KEY (unidade) REFERENCES unidade (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT
	)


	CREATE TABLE material_didatico(
		codigo varchar(10),
		material_didatico text,

		PRIMARY KEY (codigo, material_didatico),

		FOREIGN KEY (codigo) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE regra(
		codigo varchar(10),
		regra text,

		PRIMARY KEY (codigo, regra),

		FOREIGN KEY (codigo) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE necessidade_infraestrutura(
		codigo varchar(10),
		necessidade_infraestrutura text,

		PRIMARY KEY (codigo, necessidade_infraestrutura),

		FOREIGN KEY (codigo) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE departamento(
		codigo varchar(10) PRIMARY KEY,
		nome varchar(80) NOT NULL,
		chefe DEmail NOT NULL UNIQUE,

		FOREIGN KEY (chefe) REFERENCES usuario (email)
			ON UPDATE CASCADE
			ON DELETE RESTRICT
	)

	CREATE TABLE curso(
		nome varchar(50),
		codigo varchar(10),
		departamento varchar(10),
		nivel_ensino varchar(20) NOT NUll,
		carga_horaria smallint NOT NULL,
		nro_vagas smallint NOT NULL,
		ementa text NOT NULL,
		sala_aula varchar(10) NOT NULL,
		unidade integer NOT NULL,
		
		PRIMARY KEY (nome, codigo, departamento),

		FOREIGN KEY (departamento) REFERENCES departamento (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		
		FOREIGN KEY (unidade) REFERENCES unidade (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT

	)

	CREATE TABLE prerequisito(
		nome varchar(50),
		codigo varchar(10),
		departamento varchar(10),
		prerequisito text,

		PRIMARY KEY (nome, codigo, departamento, prerequisito),

		FOREIGN KEY (nome, codigo, departamento) REFERENCES curso (nome, codigo, departamento)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE compoe(
		disciplina varchar(10),
		curso_nome varchar(50),
		curso_codigo varchar(10),
		curso_departamento varchar(10),

		PRIMARY KEY (disciplina, curso_nome, curso_codigo, curso_departamento),

		FOREIGN KEY (disciplina) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE,

		FOREIGN KEY (curso_nome, curso_codigo, curso_departamento) REFERENCES curso (nome, codigo, departamento)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE ministra(
		professor DEmail,
		disciplina varchar(10),

		PRIMARY KEY (professor, disciplina),

		FOREIGN KEY (professor) REFERENCES usuario (email)
			ON UPDATE CASCADE
			ON DELETE CASCADE,

		FOREIGN KEY (disciplina) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE matricula(
		aluno DEmail,
		disciplina varchar(10),
		periodo_letivo varchar(20),
		data_efetivada timestamp,
		status varchar(20) NOT NULL,
		nota decimal(4, 2) CHECK (nota BETWEEN 0 AND 10),
		aval_comentario text,
		classificacao_didatica smallint CHECK (classificacao_didatica BETWEEN 0 AND 10),
		classificacao_material smallint CHECK (classificacao_material BETWEEN 0 AND 10),
		classificacao_relevancia smallint CHECK (classificacao_relevancia BETWEEN 0 AND 10),
		classificacao_infraestrutura smallint CHECK (classificacao_infraestrutura BETWEEN 0 AND 10),

		PRIMARY KEY (aluno, disciplina, periodo_letivo),

		FOREIGN KEY (aluno) REFERENCES usuario (email)
			ON UPDATE CASCADE
			ON DELETE CASCADE,

		FOREIGN KEY (disciplina) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE info_bolsa(
		aluno DEmail,
		disciplina varchar(10),
		periodo_letivo varchar(20),
		info_bolsa text,

		PRIMARY KEY (aluno, disciplina, periodo_letivo, info_bolsa),

		FOREIGN KEY (aluno, disciplina, periodo_letivo) REFERENCES matricula (aluno, disciplina, periodo_letivo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE info_desconto(
		aluno DEmail,
		disciplina varchar(10),
		periodo_letivo varchar(20),
		info_desconto text,

		PRIMARY KEY (aluno, disciplina, periodo_letivo, info_desconto),

		FOREIGN KEY (aluno, disciplina, periodo_letivo) REFERENCES matricula (aluno, disciplina, periodo_letivo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)

	CREATE TABLE confirmacao(
		disciplina varchar(10),
		periodo_letivo varchar(20),
		data_limite timestamp NOT NULL,
		taxa decimal NOT NULL,

		PRIMARY KEY (disciplina, periodo_letivo),

		FOREIGN KEY (disciplina) REFERENCES disciplina (codigo)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	)
;


COMMIT;
