CREATE TABLE IF NOT EXISTS public."Pacientes"
(
    id serial NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cpf character varying(11) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento date NOT NULL,
    telefone character varying(20) NOT NULL,
    email character varying(100) COLLATE pg_catalog."default",
    data_cadastro timestamp with time zone,
    endereco character varying(150) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT id_paciente PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pacientes"
    OWNER to postgres;

REVOKE ALL ON TABLE public."Pacientes" FROM "Recepcao";

GRANT ALL ON TABLE public."Pacientes" TO "Administrador";

GRANT SELECT, INSERT ON TABLE public."Pacientes" TO "Recepcao";

CREATE TABLE IF NOT EXISTS public."Dentistas"
(
    id serial NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    cro integer NOT NULL,
    especialidade character varying(50) COLLATE pg_catalog."default",
    telefone character varying(12) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT id_dentista PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Dentistas"
    OWNER to postgres;

REVOKE ALL ON TABLE public."Dentistas" FROM "Recepcao";

GRANT ALL ON TABLE public."Dentistas" TO "Administrador";

GRANT SELECT, INSERT ON TABLE public."Dentistas" TO "Recepcao";

CREATE TYPE public.status_consulta AS ENUM
    ('Agendada', 'Realizada', 'Cancelada');
CREATE TYPE public.tipo_consulta AS ENUM
    ('Check-up', 'Urgência', 'Tratamento');

CREATE TABLE IF NOT EXISTS public."Consultas"
(
    id serial NOT NULL,
    paciente_id integer,
    dentista_id integer,
    data_consulta date,
    tipo_consulta character varying(20) COLLATE pg_catalog."default" NOT NULL,
    status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Consultas_pkey" PRIMARY KEY (id),
    CONSTRAINT dentista_id FOREIGN KEY (dentista_id)
        REFERENCES public."Dentistas" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT paciente_id FOREIGN KEY (paciente_id)
        REFERENCES public."Pacientes" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE IF NOT EXISTS public."Tratamentos"
(
    id serial NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descricao character(1) COLLATE pg_catalog."default",
    preco real,
    CONSTRAINT id_tratamento PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Tratamentos"
    OWNER to postgres;

REVOKE ALL ON TABLE public."Tratamentos" FROM "Recepcao";

GRANT ALL ON TABLE public."Tratamentos" TO "Administrador";

GRANT SELECT, INSERT ON TABLE public."Tratamentos" TO "Recepcao";


CREATE TABLE IF NOT EXISTS public."Consulta_Tratamento"
(
    consulta_id integer NOT NULL,
    tratamento_id integer NOT NULL,
    CONSTRAINT "Consulta_Tratamento_pkey" PRIMARY KEY (consulta_id, tratamento_id),
    CONSTRAINT "Consulta_id" FOREIGN KEY (consulta_id)
        REFERENCES public."Consultas" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Tratamento_id" FOREIGN KEY (tratamento_id)
        REFERENCES public."Tratamentos" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
