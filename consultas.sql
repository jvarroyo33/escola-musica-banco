-- Consulta 1: simples
SELECT sigla,
       instrumento
FROM CURSO;

-- Consulta 2: média
SELECT p.numero_matricula,
       p.data_pagamento,
       p.valor
FROM PAGAMENTO AS p
JOIN MATRICULA AS m
      ON p.numero_matricula = m.numero_matricula
WHERE p.status = 'Em atraso';

-- Consulta 3: avançada
SELECT t.sigla,
       t.denominacao,
       u.nome  AS nome_professor,
       s.nome  AS nome_sala
FROM TURMA      AS t
JOIN CURSO      AS c  ON c.sigla = t.sigla
JOIN SALA       AS s  ON s.nome = t.sala_nome
JOIN PROFESSOR  AS pr ON pr.login = t.professor_login
JOIN USUARIO    AS u  ON u.login = pr.login
WHERE t.dia_semana = 'Segunda'
  AND t.horario    = '19:00';
