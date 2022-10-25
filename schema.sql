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

/*Insert the following data:*/
-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer
CREATE TABLE owners(
  id   int GENERATED ALWAYS AS IDENTITY,
  full_name  varchar,
  age  int,
  PRIMARY KEY (id)
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
CREATE TABLE species(
  id   int GENERATED ALWAYS AS IDENTITY,
  name  varchar,
   PRIMARY KEY (id)	
);

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals  ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id)  REFERENCES species(id); 

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals  ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id)  REFERENCES owners(id); 
