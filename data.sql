/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Devimon', '2017-05-12', 5, true, 11);

-- Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Charmander', '2020-02-08', 0, false, 11);

-- Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Plantmon', '2021-11-15', 2, true, 5.7);

-- Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Squirtle', '1993-04-02', 3, false, 12.13);


-- Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Angemon', '2005-06-12', 1, true, 45);


-- Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

-- Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Blossom', '1998-10-13', 3, true, 17);

-- Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.
INSERT INTO animals (name, date_of_birh, escape_attempts, neutered, weigth_kg)  
VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- Insert the following data into the owners table:
-- Sam Smith 34 years old.
-- Jennifer Orwell 19 years old.
-- Bob 45 years old.
-- Melody Pond 77 years old.
-- Dean Winchester 14 years old.
-- Jodie Whittaker 38 years old.
INSERT INTO owners (full_name, age)  
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert the following data into the species table:
-- Pokemon
-- Digimon
INSERT INTO species (name)  
VALUES 
('Pokemon'),
('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals SET species_id = 2  where name like '%mon';
UPDATE animals SET species_id = 1 where name not like '%mon';

-- Modify your inserted animals to include owner information (owner_id):
-- Sam Smith owns Agumon.
-- Jennifer Orwell owns Gabumon and Pikachu.
-- Bob owns Devimon and Plantmon.
-- Melody Pond owns Charmander, Squirtle, and Blossom.
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 1  where name IN ('Agumon');
UPDATE animals SET owner_id = 2  where name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3  where name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4  where name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5  where name IN ('Angemon','Boarmon');

-- Insert the following data for vets:
-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
-- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
-- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
-- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
INSERT INTO vets(name, age, date_of_graduation)
VALUES 	('William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'),
	('Stephanie Mendez', 64, '1981-05-04'),	('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (vet_id, species_id)
VALUES  (1 , 1), (3, 1), (3, 2), (4, 2);

-- Insert the following data for visits:
-- Agumon visited William Tatcher on May 24th, 2020.
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
-- Pikachu visited Maisy Smith on May 14th, 2020.
-- Devimon visited Stephanie Mendez on May 4th, 2021.
-- Charmander visited Jack Harkness on Feb 24th, 2021.
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
-- Plantmon visited William Tatcher on Aug 10th, 2020.
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
-- Angemon visited Jack Harkness on Nov 4th, 2020.
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
-- Boarmon visited Maisy Smith on May 15th, 2019.
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
-- Blossom visited Stephanie Mendez on May 24th, 2020.
-- Blossom visited William Tatcher on Jan 11th, 2021.

INSERT INTO visits (date_of_visit, animals_id, vets_id)
VALUES ('2020-05-24', 1, 1), ('2020-07-22', 1, 3), ('2021-02-02', 2, 4), 
  ('2020-01-05', 3, 2), ('2020-03-08', 3, 2), ('2020-05-14', 3, 2),
	('2021-05-04', 4, 3), ('2021-02-24', 5, 4), ('2019-12-21', 6, 2), 
  ('2020-08-10', 6, 1), ('2021-04-07', 6, 2), ('2019-09-29', 7, 3),
	('2020-10-03', 8, 4), ('2020-11-04', 8, 4), ('2019-01-24', 9, 2), 
  ('2019-05-15', 9, 2), ('2020-02-27', 9, 2), ('2020-08-03', 9, 2),
	('2020-05-24', 10, 3),('2021-01-11', 10, 1);

	-- This will add 11.861.143 visits considering you have 10 animals and 4 vets, 
	-- and it will use around 87.000 timestamps (4 minutes aprox).
	-- It took 14.433 seconds to run this query in my computer (3 times)
	INSERT INTO visits (animals_id, vets_id, date_of_visit) 
	SELECT * FROM 
	(SELECT id FROM animals) animals_id, 
	(SELECT id FROM vets) vets_id, generate_series('1980-01-01'::timestamp, '2021-01-01'::timestamp, '4 hours') visit_timestamp;

	-- This will add 11.000.006 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (12.764 seconds).
	INSERT INTO owners (full_name, email) 
	SELECT 'Owner ' || generate_series(1, 2500000), 'owner_' 
	|| generate_series(1, 2500000) || '@mail.com';

	EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animals_id = 4;
	