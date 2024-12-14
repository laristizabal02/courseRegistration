-- SEQUENCE: public.guardian_id_seq

-- DROP SEQUENCE IF EXISTS public.guardian_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.guardian_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.guardian_id_seq
    OWNED BY public.guardian.guardian_id;

ALTER SEQUENCE public.guardian_id_seq
    OWNER TO postgres;