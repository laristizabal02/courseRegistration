-- Table: public.gender

-- DROP TABLE IF EXISTS public.gender;

CREATE TABLE IF NOT EXISTS public.gender
(
    gender_id integer NOT NULL DEFAULT nextval('gender_id_seq'::regclass),
    gender_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genders_pkey PRIMARY KEY (gender_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.gender
    OWNER to postgres;