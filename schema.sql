/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date_of_birh date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weigth_kg numeric(4,1) NOT NULL,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
);

/*Add a column species of type string to your animals table*/
ALTER TABLE animals ADD COLUMN species VARCHAR(50);
