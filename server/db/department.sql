-- Table: public.department

-- DROP TABLE IF EXISTS public.department;

CREATE TABLE IF NOT EXISTS public.department
(
    department_id integer NOT NULL DEFAULT nextval('department_id_seq'::regclass),
    department_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (department_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.department
    OWNER to postgres;

COMMENT ON TABLE public.department
    IS 'The department in a school responsible for a course.';