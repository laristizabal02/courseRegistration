-- Table: public.guardian

-- DROP TABLE IF EXISTS public.guardian;

CREATE TABLE IF NOT EXISTS public.guardian
(
    guardian_id integer NOT NULL DEFAULT nextval('guardian_id_seq'::regclass),
    person_id integer NOT NULL,
    authorized_indicator character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar,
    emergency_indicator character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar,
    CONSTRAINT guardian_pkey PRIMARY KEY (guardian_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.guardian
    OWNER to postgres;

COMMENT ON TABLE public.guardian
    IS 'This is a subtype of the person table.';