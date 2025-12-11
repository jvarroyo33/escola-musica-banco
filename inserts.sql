---------------------------------------------------
-- 1) CURSO
---------------------------------------------------
INSERT INTO CURSO (sigla, instrumento) VALUES
 ('VIO', 'Violão'),
 ('PIA', 'Piano'),
 ('BAT', 'Bateria'),
 ('GUI', 'Guitarra');

---------------------------------------------------
-- 2) USUARIOS (professores + alunos + responsáveis)
---------------------------------------------------
INSERT INTO USUARIO (login, cpf, nome, senha, email, endereco, telefone) VALUES
 ('prof_carla', '555.555.555-55', 'Carla Torcato', 'hash', 'carla@prof.com',  'Av X, 100', '11955555555'),
 ('prof_jerry', '777.777.777-77', 'Jerry',         'hash', 'jerry@prof.com',  'Av Z, 300', '11933333333'),
 ('user_joao',  '111.111.111-11', 'João Arroyo',   'hash', 'joao@email.com',  'Rua A, 10', '11999999999'),
 ('user_ana',   '444.444.444-44', 'Ana Costa',     'hash', 'ana@email.com',   'Rua D, 40', '11966666666'),
 ('resp_maria', '222.222.222-22', 'Maria Souza',   'hash', 'maria@resp.com',  'Rua B, 20', '11988888888');

---------------------------------------------------
-- 3) RESPONSAVEL
---------------------------------------------------
INSERT INTO RESPONSAVEL (login, data_nasc) VALUES
 ('resp_maria', '1980-03-10');

---------------------------------------------------
-- 4) ALUNO
---------------------------------------------------
INSERT INTO ALUNO (login, data_nasc, responsavel_login) VALUES
 ('user_joao', '2004-01-01', NULL),
 ('user_ana',  '2001-07-07', 'resp_maria');

---------------------------------------------------
-- 5) PROFESSOR
---------------------------------------------------
INSERT INTO PROFESSOR (login, especialidade) VALUES
 ('prof_carla', 'Cordas'),
 ('prof_jerry', 'Guitarra');

---------------------------------------------------
-- 6) SALA
---------------------------------------------------
INSERT INTO SALA (nome, instrumentacao, capacidade, status) VALUES
 ('Sala 1', 'Cordas', 10, 'Ativa'),
 ('Sala 2', 'Geral',   8, 'Ativa');

---------------------------------------------------
-- 7) TURMA (usa professor + curso + sala)
---------------------------------------------------
INSERT INTO TURMA
 (sigla, denominacao, data_inicio, data_fim, dia_semana, horario, professor_login, sala_nome)
VALUES
 ('VIO', 'Violão Iniciante A', '2024-02-01', '2024-06-30', 'Segunda', '19:00', 'prof_carla', 'Sala 1'),
 ('GUI', 'Guitarra Blues',     '2024-02-01', '2024-06-30', 'Segunda', '19:00', 'prof_jerry', 'Sala 2');

---------------------------------------------------
-- 8) MATRICULA
---------------------------------------------------
INSERT INTO MATRICULA
 (numero_matricula, data_matricula, taxa, historico, status, aluno_login)
VALUES
 (1001, '2024-01-20', 150.00, 'Ativo', 'Ativa', 'user_joao'),
 (1004, '2024-03-01', 150.00, 'Ativo', 'Ativa', 'user_ana');

---------------------------------------------------
-- 9) PAGAMENTO
---------------------------------------------------
INSERT INTO PAGAMENTO
 (numero_matricula, data_pagamento, valor, forma_pagamento, data_vencimento, status, multa, desconto)
VALUES
 (1001, '2024-11-15', 150.00, 'Pix',     '2024-11-15', 'Em atraso', 0.00, 0.00),
 (1004, '2024-11-20', 150.00, 'Cartão',  '2024-11-20', 'Em atraso', 0.00, 0.00),
 (1001, '2024-10-15', 150.00, 'Pix',     '2024-10-10', 'Pago',      0.00, 0.00);

---------------------------------------------------
-- 10) FORMA_PAGAMENTO (chave composta → copiar dados do PAGAMENTO)
---------------------------------------------------
INSERT INTO FORMA_PAGAMENTO (numero_matricula, data_pagamento) VALUES
 (1001, '2024-11-15'),
 (1004, '2024-11-20'),
 (1001, '2024-10-15');
