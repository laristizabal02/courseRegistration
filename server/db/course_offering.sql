-- Table: public.course_offering

-- DROP TABLE IF EXISTS public.course_offering;

CREATE TABLE IF NOT EXISTS public.course_offering
(
    course_offering_id integer NOT NULL DEFAULT nextval('course_offering_id_seq'::regclass),
    course_id integer NOT NULL,
    location character varying(40) COLLATE pg_catalog."default" NOT NULL,
    days character varying(40) COLLATE pg_catalog."default" NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    CONSTRAINT course_offering_pkey PRIMARY KEY (course_offering_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course_offering
    OWNER to postgres;