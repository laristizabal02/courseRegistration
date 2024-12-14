-- Table: public.address

-- DROP TABLE IF EXISTS public.address;

CREATE TABLE IF NOT EXISTS public.address
(
    address_id integer NOT NULL,
    address1 character varying(255) COLLATE pg_catalog."default" NOT NULL,
    address2 character varying(255) COLLATE pg_catalog."default",
    city_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    state_code character varying(2) COLLATE pg_catalog."default" NOT NULL DEFAULT 'CO'::character varying,
    zip_code character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT address_pkey PRIMARY KEY (address_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.address
    OWNER to postgres;

COMMENT ON TABLE public.address
    IS 'Master table for holding addresses.';