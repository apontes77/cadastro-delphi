DROP TABLE IF EXISTS TB_CURSO,
TB_DISCENTE, TB_DOCENTE, TB_DISCIPLINA, TB_TURMA, TB_LANCAMENTOS CASCADE;

create table TB_CURSO(
	id_curso serial primary key,
	nome_curso varchar(50) not null
);

create table TB_DISCIPLINA(
	id_disciplina serial primary key,
	nome_disciplina varchar(50) not null
);

create table TB_TURMA (
	id_turma serial primary key,
	codigo_turma varchar(7) not null,
	id_disciplina int not null,
	FOREIGN KEY (id_disciplina) REFERENCES TB_DISCIPLINA(id_disciplina)
);


create table TB_DISCENTE (
	id_discente serial primary key, 
	nome_discente varchar(150) not null,
	idade int not null,
	sexo char(2),
	id_curso int not null,
	FOREIGN KEY (id_curso) REFERENCES TB_CURSO(id_curso)
);

create table TB_DISCENTE_TURMA (
	id_disc_turma serial primary key,
	id_discente int not null,
	id_turma int null,
	FOREIGN KEY (id_discente) REFERENCES TB_DISCENTE(id_discente),
	FOREIGN KEY (id_turma) REFERENCES TB_TURMA(id_turma)
);

create table TB_DOCENTE (
	id_docente serial primary key,
	nome_docente varchar(150) not null,
	idade int not null,
	sexo char(2)
);

create table TB_DOCENTE_TURMA (
	id_docente int not null,
	id_turma int null,
	FOREIGN KEY (id_docente) REFERENCES TB_DOCENTE(id_docente),
	FOREIGN KEY (id_turma) REFERENCES TB_TURMA(id_turma)
);

create table TB_LANCAMENTOS(
	id_lanc serial primary key,
	n1 decimal not null,
	n2 decimal not null,
	id_discente int not null,
	id_turma int not null,
	FOREIGN KEY (id_discente) REFERENCES TB_DISCENTE(id_discente),
	FOREIGN KEY (id_turma) REFERENCES TB_TURMA(id_turma)
);


