-- ============================================================
--  TABELA: USUARIO
-- ============================================================
CREATE TABLE IF NOT EXISTS USUARIO (
  login TEXT PRIMARY KEY,
  cpf TEXT,
  nome TEXT,
  senha TEXT,
  email TEXT,
  endereco TEXT,
  telefone TEXT
);

-- ============================================================
--  TABELA: TELEFONE
-- ============================================================
CREATE TABLE IF NOT EXISTS TELEFONE (
  login TEXT,
  tipo TEXT,
  ddd TEXT,
  prefixo TEXT,
  numero TEXT,
  PRIMARY KEY (login, tipo, ddd, prefixo, numero),
  FOREIGN KEY (login) REFERENCES USUARIO(login)
);

-- ============================================================
--  TABELA: ENDERECO
-- ============================================================
CREATE TABLE IF NOT EXISTS ENDERECO (
  login TEXT,
  tipo TEXT,
  cep TEXT,
  bairro TEXT,
  numero TEXT,
  PRIMARY KEY (login, tipo),
  FOREIGN KEY (login) REFERENCES USUARIO(login)
);

-- ============================================================
--  TABELA: RESPONSAVEL
-- ============================================================
CREATE TABLE IF NOT EXISTS RESPONSAVEL (
  login TEXT PRIMARY KEY,
  data_nasc TEXT,
  FOREIGN KEY (login) REFERENCES USUARIO(login)
);

-- ============================================================
--  TABELA: ALUNO
-- ============================================================
CREATE TABLE IF NOT EXISTS ALUNO (
  login TEXT PRIMARY KEY,
  data_nasc TEXT,
  responsavel_login TEXT,
  FOREIGN KEY (login) REFERENCES USUARIO(login),
  FOREIGN KEY (responsavel_login) REFERENCES RESPONSAVEL(login)
);

-- ============================================================
--  TABELA: PROFESSOR
-- ============================================================
CREATE TABLE IF NOT EXISTS PROFESSOR (
  login TEXT PRIMARY KEY,
  especialidade TEXT,
  FOREIGN KEY (login) REFERENCES USUARIO(login)
);

-- ============================================================
--  TABELA: CURSO
-- ============================================================
CREATE TABLE IF NOT EXISTS CURSO (
  sigla TEXT PRIMARY KEY,
  instrumento TEXT
);

-- ============================================================
--  TABELA: SALA
-- ============================================================
CREATE TABLE IF NOT EXISTS SALA (
  nome TEXT PRIMARY KEY,
  instrumentacao TEXT,
  capacidade INTEGER,
  status TEXT
);

-- ============================================================
--  TABELA: MATRICULA
-- ============================================================
CREATE TABLE IF NOT EXISTS MATRICULA (
  numero_matricula INTEGER PRIMARY KEY,
  data_matricula TEXT,
  taxa REAL,
  historico TEXT,
  status TEXT,
  aluno_login TEXT,
  FOREIGN KEY (aluno_login) REFERENCES ALUNO(login)
);

-- ============================================================
--  TABELA: TURMA
-- ============================================================
CREATE TABLE IF NOT EXISTS TURMA (
  sigla TEXT,
  denominacao TEXT,
  data_inicio TEXT,
  data_fim TEXT,
  dia_semana TEXT,
  horario TEXT,
  professor_login TEXT,
  sala_nome TEXT,
  PRIMARY KEY (sigla, denominacao),
  FOREIGN KEY (sigla) REFERENCES CURSO(sigla),
  FOREIGN KEY (professor_login) REFERENCES PROFESSOR(login),
  FOREIGN KEY (sala_nome) REFERENCES SALA(nome)
);

-- ============================================================
--  TABELA: PAGAMENTO
-- ============================================================
CREATE TABLE IF NOT EXISTS PAGAMENTO (
  numero_matricula INTEGER,
  data_pagamento TEXT,
  valor REAL,
  forma_pagamento TEXT,
  data_vencimento TEXT,
  status TEXT,
  multa REAL,
  desconto REAL,
  PRIMARY KEY (numero_matricula, data_pagamento),
  FOREIGN KEY (numero_matricula) REFERENCES MATRICULA(numero_matricula)
);

-- ============================================================
--  TABELA: FORMA_PAGAMENTO
-- ============================================================
CREATE TABLE IF NOT EXISTS FORMA_PAGAMENTO (
  numero_matricula INTEGER,
  data_pagamento TEXT,
  PRIMARY KEY (numero_matricula, data_pagamento),
  FOREIGN KEY (numero_matricula, data_pagamento)
    REFERENCES PAGAMENTO(numero_matricula, data_pagamento)
);
