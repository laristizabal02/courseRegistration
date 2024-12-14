-- Table: public.student

-- DROP TABLE IF EXISTS public.student;

CREATE TABLE IF NOT EXISTS public.student
(
    student_id integer NOT NULL DEFAULT nextval('student_id_seq'::regclass),
    person_id integer,
    grade_id integer,
    CONSTRAINT student_pkey PRIMARY KEY (student_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.student
    OWNER to postgres;