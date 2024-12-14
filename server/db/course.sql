-- Table: public.course

-- DROP TABLE IF EXISTS public.course;

CREATE TABLE IF NOT EXISTS public.course
(
    course_id integer NOT NULL DEFAULT nextval('course_id_seq'::regclass),
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    department_id integer NOT NULL,
    CONSTRAINT course_pkey PRIMARY KEY (course_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course
    OWNER to postgres;

COMMENT ON TABLE public.course
    IS 'Master table for courses offered at the institution.';

COMMENT ON COLUMN public.course.title
    IS 'The title for the course. Example: Calculus 101';

COMMENT ON COLUMN public.course.department_id
    IS 'Foreign Key to the department table.';