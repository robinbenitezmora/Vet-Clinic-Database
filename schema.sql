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

-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date

CREATE TABLE vets (
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(50),
	age INT,
	date_of_graduation DATE,
	PRIMARY KEY(id)
);

-- There is a many-to-many relationship between the tables species and vets: 
-- a vet can specialize in multiple species, and a species can have multiple vets 
-- specialized in it. 
-- Create a "join table" called specializations to handle this relationship.

CREATE TABLE specialization (
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT,
    species_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES  species(id),
    PRIMARY KEY (id)
);

-- There is a many-to-many relationship between the tables animals and vets: 
-- an animal can visit multiple vets and one vet can be visited by multiple animals. 
-- Create a "join table" called visits to handle this relationship
-- it should also keep track of the date of the visit.
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animals_id INT,
    vets_id INT,   	
    date_of_visit VARCHAR(50),
    FOREIGN KEY (animals_id) REFERENCES  animals(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id),
    PRIMARY KEY (id)
);

--Add an email column to owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX index_animals_vets_visits ON visits (animals_id, vets_id);

CREATE INDEX index_email_owners ON owners (email);
