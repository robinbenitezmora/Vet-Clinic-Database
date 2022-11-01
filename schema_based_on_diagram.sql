/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY,
    name character varying(50) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
  id   int GENERATED ALWAYS AS IDENTITY,
  admitted_at  timestamp,
  patient_id  int,
  status  varchar,
  PRIMARY KEY (id)
);

CREATE TABLE treatments(
  id   int GENERATED ALWAYS AS IDENTITY,
  type  varchar,
  name  varchar,
  PRIMARY KEY (id)
);

CREATE TABLE invoices (
	id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY (id)
);

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
