-- Table: public.role_type

-- DROP TABLE IF EXISTS public.role_type;

CREATE TABLE IF NOT EXISTS public.role_type
(
    role_type_id integer NOT NULL DEFAULT nextval('role_type_id_seq'::regclass),
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT role_type_pkey PRIMARY KEY (role_type_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.role_type
    OWNER to postgres;