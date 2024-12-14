-- Table: public.person

DROP TABLE IF EXISTS public.person;

CREATE TABLE IF NOT EXISTS public.person
(
    person_id integer NOT NULL DEFAULT nextval('person_id_seq'::regclass),
    last_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    middle_name character varying(40) COLLATE pg_catalog."default",
    personal_title character varying(10) COLLATE pg_catalog."default",
    suffix character varying(10) COLLATE pg_catalog."default",
    nickname character varying(30)[] COLLATE pg_catalog."default",
    gender_id integer,
    birth_date date,
    comment text COLLATE pg_catalog."default",
    CONSTRAINT person_pkey PRIMARY KEY (person_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person
    OWNER to postgres;

COMMENT ON TABLE public.person
    IS 'Represents the base information for a person. A person can serve different roles. For example, parent, teacher, student, ....';

COMMENT ON COLUMN public.person.person_id
    IS 'Primary key for the person table.';

COMMENT ON COLUMN public.person.personal_title
    IS 'This is titles such as Jr., Sr. etc';

COMMENT ON COLUMN public.person.suffix
    IS 'Dr., Mr., Ms., etc.';