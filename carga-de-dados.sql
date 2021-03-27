INSERT INTO TB_CURSO(nome_curso)
VALUES ('ANALISE E DESENVOLVIMENTO DE SISTEMAS');

INSERT INTO TB_DISCIPLINA(nome_disciplina)
VALUES ('ESTRUTURAS DE DADOS');

INSERT INTO TB_TURMA (codigo_turma,id_disciplina)
VALUES ('CMP1221',1);

INSERT INTO TB_DISCENTE (nome_discente,idade,sexo,id_curso)
VALUES ('MARTIN LUTHER KING', 36, 'M',1);

INSERT INTO TB_DISCENTE (nome_discente,idade,sexo,id_curso)
VALUES ('GEORGE W BUSH', 45, 'M',1);

INSERT INTO TB_DISCENTE (nome_discente,idade,sexo,id_curso)
VALUES ('Natalie Portman', 25, 'F',1);

INSERT INTO TB_DISCENTE (nome_discente,idade,sexo,id_curso)
VALUES ('Scarlet Johansson', 30, 'F',1);


INSERT INTO TB_DISCENTE_TURMA (id_discente ,id_turma)
VALUES (1,1);

INSERT INTO TB_DOCENTE (nome_docente,idade,sexo)
VALUES ('ROBERT C MARTIN', 79, 'M');

INSERT INTO TB_DOCENTE_TURMA (id_docente,id_turma)
VALUES (1,1);

INSERT INTO TB_LANCAMENTOS(n1,n2,id_discente,id_turma)
VALUES (9.4, 8.2, 1, 1);
INSERT INTO TB_LANCAMENTOS(n1,n2,id_discente,id_turma)
VALUES (9.4, 8.2, 2, 1);
INSERT INTO TB_LANCAMENTOS(n1,n2,id_discente,id_turma)
VALUES (9.4, 8.2, 3, 1);
INSERT INTO TB_LANCAMENTOS(n1,n2,id_discente,id_turma)
VALUES (9.4, 8.2, 4, 1);

/* ------------------------------------------- */

SELECT * FROM TB_CURSO;
SELECT * FROM TB_DISCIPLINA;
SELECT * FROM TB_LANCAMENTOS;
SELECT * FROM TB_DOCENTE;
SELECT * FROM TB_DISCENTE;

/* ------------------------------------------- */

SELECT * from TB_DISCENTE as disc
left join TB_LANCAMENTOS AS lanc 
ON disc.id_discente = lanc.id_discente;


