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
PRIMARY KEY(id)
);

CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(50),
age INT , 
PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN species;
 
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT species_id
FOREIGN KEY (species_id) REFERENCES species (id);
SELECT * FROM animals;

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT owner_id
FOREIGN KEY (owner_id) REFERENCES owners (id);
SELECT * FROM animals;