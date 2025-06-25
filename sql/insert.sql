START TRANSACTION;

INSERT INTO projeto.unidade(pais, estado, cidade, rua, numero, complemento) VALUES
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'ICMC Bloco 1'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'ICMC Bloco 4'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'ICMC Bloco 5'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'IAU Bloco 1'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'IAU Bloco 2'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'IQSC Bloco 1'),
('Brasil', 'SP', 'Campinas', 'Cidade Universitária Zeferino Vaz - Barão Geraldo', NULL, 'Computação'),
('EUA', 'Massachusetts', 'Cambridge', 'Brattle Street Cambridge', 86, 'Harvard Medical School'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'ICMC Bloco 7'),
('Brasil', 'SP', 'São Carlos', 'Av. Trab. São Carlense - Parque Arnold Schimidt', 400, 'IFSC');


INSERT INTO projeto.usuario(email, nome, sobrenome, telefone, data_nascimento, pais, estado, cidade, rua, endereco_numero, endereco_complemento, sexo, senha, vinculo, prof_especializacao, prof_titulacao, unidade) VALUES
('rafael@gmail.com', 'Rafael', 'Valerio', '19 9999999999', '2003-10-27', 'Brasil', 'SP', 'Campinas', 'Rua 1', 1000, NULL, 'masculino', '12345', 'Aluno', NULL, NULL, 1),
('joao@gmail.com', 'João', 'Silva', '19 9999999998', '2001-11-10', 'Brasil', 'SP', 'São Carlos', 'Rua 3', 10, NULL, 'masculino', '123456', 'Aluno', NULL, NULL, 1),
('pedro@gmail.com', 'Pedro', 'Costa', '19 9999999997', '2002-01-20', 'Brasil', 'SP', 'Campinas', 'Rua 1', 1000, NULL, 'masculino', '123', 'Aluno', NULL, NULL, 3),
('alan24@gmail.com', 'Alan', 'Pereira', '10 9999999999', '1999-05-10', 'Brasil', 'SP', 'São Paulo', 'Rua 10', 5, NULL, 'masculino', 'senhaforte', 'Aluno', NULL, NULL, 1),
('professor@gmail.com', 'Professor', 'professorado', '16 9999999955', '1991-06-01', 'Brasil', 'SP', 'Campinas', 'Rua 200', 65, NULL, 'feminino', 'senha', 'Professor', 'Especializado', 'Titulo', 2),
('bia@gmail.com', 'Beatriz', 'Camargo', '19 9999994568', '2004-07-15', 'Brasil', 'SP', 'Jaguariuna', 'Rua Castos', 8, NULL, 'feminino', 'bia1234', 'Aluno', NULL, NULL, 1),
('julia24@gmail.com', 'Julia', 'Paes', '19 9926999999', '2001-11-03', 'Brasil', 'BA', 'Salvador', 'Rua 45', 94, 'Predio amarelo AP24', 'feminino', '56789', 'Aluno', NULL, NULL, 1),
('ednaldo.pereira@gmail.com', 'Ednaldo', 'Pereira', '19 0000000000', '1973-06-12', 'Brasil', 'SP', 'São Paulo', 'Rua Vale Tudo', 200, NULL, 'masculino', '12345', NULL, NULL, NULL, 4),
('josemaria@gmail.com', 'Jose', 'Maria', '89 9995699999', '2000-01-01', 'Brasil', 'SP', 'Campinas', 'Rua 256', 895, NULL, 'masculino', 'senhadaora', 'Aluno', NULL, NULL, 1),
('mariajose@gmail.com', 'Maria', 'Jose', '18 9996599999', '2000-01-01', 'Brasil', 'SP', 'Campinas', 'Rua 256', 895, NULL, 'masculino', 'senhadaora', 'Aluno', NULL, NULL, 2),
('pateta@gmail.com', 'Pateta', 'Disney', '20 0000000002', '1932-01-16', 'EUA', 'NY', 'New York', 'Street 1', 650, NULL, 'masculino', 'pateta2123', 'professor', 'Artes', 'Ator', 6),
('larata@gmail.com', 'Mickey', 'Mouse', '20 0000000001', '1928-10-27', 'EUA', 'NY', 'New York', 'Street 1', 650, NULL, 'masculino', 'rato', 'Aluno', NULL, NULL, 3),
('papainoel@gmail.com', 'Papai', 'Noel', '00 0000000000', '1000-01-01', 'Polo Norte', 'Norte', 'Mais ao Norte', 'Rua 0', 0, 'Unica Casa', 'masculino', 'presente', NULL, NULL, NULL, 3),
('duende@gmail.com', 'Duende', 'Primeiro', '00 021457895', '1000-01-02', 'Polo Norte', 'Polo Norte', 'Mais ao Norte', 'Rua 0', 0, 'Unica Casa', 'masculino', 'duende1', 'Professor', 'Brinquedos', 'Melhor artesao do norte', 1),
('camila@gmail.com', 'Camila', 'Camimosa', '55 19 02548663645', '2000-05-30', 'Brasil', 'SP', 'Pedreira', 'Rua Alta', 1001, NULL, 'feminino', 'powpow', 'Aluno', NULL, NULL, 2),
('neuro@gmail.com', 'Neuro', 'Sama', '20 10 9900999999', '2020-05-10', 'Reino Unido', 'Inglaterra', 'Inglaterra', 'Rua 156', 4, NULL, 'masculino', 'tea', 'Aluno', NULL, NULL, 1),
('tutubarao@gmail.com', 'Tutu', 'Barao', '60 19 9998899999', '2000-08-09', 'Brasil', 'SP', 'Ribeirão Preto', 'Rua 10', 1000, NULL, 'masculino', 'peixe', 'Funcionário Administrativo', NULL, NULL, 4),
('mr007@gmail.com', 'Bond', 'James', '19 0070070070', '1973-07-07', 'Brasil', 'SP', 'Ubatuba', 'Rua 2', 56, NULL, 'masculino', '007', 'Funcionário Administrativo', NULL, NULL, 1),
('todos@gmail.com', 'Todo', 'Mundo', '00 19 9999999999', '0001-01-01', 'Brasil', 'SP', 'Jundiai', 'Rua 03', 03, NULL, 'outro', 'todasassenhas', 'Funcionário Administrativo', NULL, NULL, 2),
('fantasminha@gmail.com', 'Fantasma', 'Camarada', '19 4568710256', '2002-04-30', 'Brasil', 'SP', 'Mogi Mirim', 'Rua 456', 510, NULL, 'outro', 'buuuu', 'Funcionário Administrativo', NULL, NULL, 3);




INSERT INTO projeto.departamento(codigo, nome, chefe) VALUES
('ICMC', 'Instituto de Ciências Matemáticas e de Computação', 'professor@gmail.com'),
('IQSC', 'Instituto de Química de São Carlos', 'pateta@gmail.com'),
('H Arts', 'Arts Institute', 'duende@gmail.com'),
('INTER', 'Inter Unidades', 'chupa.cabra@gmail.com');


INSERT INTO projeto.disciplina(codigo, nro_aulas_semanais, unidade) VALUES
('SCC0240', 10, 3),
('SMA0332', 8, 2),
('COMP-01', 2, 1),
('COMP-06', 1, 1),
('QUIM-01', 3, 6),
('QUIM-02', 3, 6),
('QUIM-03', 2, 6),
('ART-01', 20, 7);


INSERT INTO projeto.material_didatico(codigo, material_didatico) VALUES
('SCC0240', 'Livros de dados'),
('SMA0332', 'Livros de calculo'),
('COMP-01', 'computadores'),
('QUIM-01', 'Livros de Quimica'),
('ART-01', 'computadores');

INSERT INTO projeto.regra(codigo, regra) VALUES
('SCC0240', 'regrado'),
('SMA0332', 'regra das integrais'),
('COMP-01', 'nao quebrar os computadores'),
('QUIM-01', 'nao quebrar os instrumentos, nem explodir o laboratorio'),
('ART-01', 'computadores');

INSERT INTO projeto.necessidade_infraestrutura(codigo, necessidade_infraestrutura) VALUES
('SCC0240', 'sala de aula com projetor'),
('SMA0332', 'apenas a sala'),
('COMP-01', 'laboratorio com computadores'),
('QUIM-01', 'laboratorio de quimica'),
('ART-01', 'computadores');


INSERT INTO projeto.curso (nome, codigo, departamento, nivel_ensino, carga_horaria, nro_vagas, ementa, sala_aula, unidade) VALUES
('Computação', 'COMP', 'ICMC', 'Superior', 20, 80, 'Muitos computadores', '5-103', 3),
('Dados', 'DADO', 'ICMC', 'Superior', 15, 70, 'Muitos Dados', '5-102', 2),
('Matematica', 'MAT', 'ICMC', 'Superior', 30, 120, 'Muita conta', '4-003', 2),
('Quimica', 'QUIM', 'IQSC', 'Superior', 16, 85, 'kaboom', '1-003', 6),
('Artes', 'ART', 'H Arts', 'Superior', 10, 20, 'fazendo arte', '0001', 7),
('Licenciatura em Ciencias Exatas', 'LIC_CE', 'INTER', 'Superior', 200, 20, 'Exatamente', '6-666', 8),
('Engenharia de Computação', 'ENG_COMP', 'INTER', 'Superior', 1, 145, 'Nem programador, nem engnheiro', '7-101', 9);

INSERT INTO projeto.prerequisito (
    nome, codigo, departamento, prerequisito
) VALUES
(
    'Introdução aos Compiuter', 'SCC0240',
    'ICMC', 'Ainda ter sonhos e experanças'
),
(
    'Números: Invenção ou Descoberta?', 'SMA0332',
    'Tomar uma cerveja com o professor após a aula para ter crises exitenciais'
),
(
    'Engenharia de Prompts', 'COMP-01',
    'Ter desistido de apreder programação
    e aceitado que a IA vai tomar nossos empregos'
),
(
    'Como Virar Uber?', 'COMP-06',
    'Jogar seu diploma no lixo e aproveitar
    que o Uber ainda não usa carros autonomos'
),
(
    'Kaboom: Uma Introdução aos Fogos de Artifício',
    'QUIM-01', 'Gostar de explodir coisas'
),
(
    'Kaboom 2: A Corzinha Agora é Outra', 'QUIM-02',
    'Ter cursado "Kaboom: Uma Introdução aos Fogos de Artifício"'
),
(
    'Engenharia de Prompts para Química', 'QUIM-03',
    'Ter cansado de decorar tabela periódica 
    e não se lembrar como faz distribuição eletrônica'
),
(
    'Mãos: Porque São Tão Difíceis?', 'ART-01',
    'Ter tentado desenhar uma mão alguma vez na vida
    (sem piada com IA aqui)'
);


COMMIT;
