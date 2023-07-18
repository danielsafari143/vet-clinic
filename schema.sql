/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
 id               INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
 name             VARCHAR(20) ,
 date_of_birth    DATE ,
 escape_attempts  INTEGER,
 neutered         BOOLEAN,
 weight_kg        DECIMAL,
 species          VARCHAR(30)
 );

CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50) , 
PRIMARY KEY(name)
);

CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(50),
age INT , 
PRIMARY KEY(full_name)
);

ALTER TABLE animals
DROP COLUMN species;
 
ALTER TABLE animals
ADD COLUMN species_id VARCHAR(50),
ADD CONSTRAINT species_id
FOREIGN KEY (species_id) REFERENCES species (name);
SELECT * FROM animals;

ALTER TABLE animals
ADD COLUMN owner_id VARCHAR(50),
ADD CONSTRAINT owner_id
FOREIGN KEY (owner_id) REFERENCES owners (full_name);
SELECT * FROM animals;

 CREATE TABLE vets(
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(20),
 age INT,
 date_of_graduation DATE,
 PRIMARY KEY(id)
 );

 CREATE TABLE specializations (
 vets_id VARCHAR(50) ,
 species_id VARCHAR(50),
 FOREIGN KEY (species_id) REFERENCES species (id),
 FOREIGN KEY (vets_id) REFERENCES vets (id)
 );

 CREATE TABLE visits (
 animal_id INT,
 vets_id VARCHAR(50) ,
 date_of_visit DATE,
 FOREIGN KEY (animal_id) REFERENCES animals (id),
 FOREIGN KEY (vets_id) REFERENCES vets (id)
 );