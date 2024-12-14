-- SEQUENCE: public.department_id_seq

-- DROP SEQUENCE IF EXISTS public.department_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.department_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.department_id_seq
    OWNED BY public.department.department_id;

ALTER SEQUENCE public.department_id_seq
    OWNER TO postgres;