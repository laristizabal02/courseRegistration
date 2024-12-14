-- Table: public.school

-- DROP TABLE IF EXISTS public.school;

CREATE TABLE IF NOT EXISTS public.school
(
    school_id integer NOT NULL DEFAULT nextval('school_id_seq'::regclass),
    school_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT school_pkey PRIMARY KEY (school_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.school
    OWNER to postgres;

COMMENT ON TABLE public.school
    IS 'Physical entity that houses instructors and course offerings.';