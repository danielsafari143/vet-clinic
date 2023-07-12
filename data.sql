/* Populate database with sample data. */

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Charmander' , ('2020-2-8'), 0 , false , -11);

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Plantmon' , ('2021-11-15'), 2 , true , -5.7);

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Squirtle' , ('1993-4-2'), 3 , false , -12.13);

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Angemon' , ('2005-6-12'), 1 , true , -45);

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Boarmon' , ('2005-6-7'), 7 , true , 20.4);

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Blossom' , ('1998-10-13'), 3 , true , 17);

INSERT INTO animals (id , name , date_of_birth , escape_attempts , neutered , weight_kg)  VALUES 
(DEFAULT , 'Ditto' , ('2022-5-14'), 4 , true , 22);

INSERT INTO owners VALUES (DEFAULT ,'Sam Smith' , 34);
INSERT INTO owners VALUES (DEFAULT ,'Jennifer Orwell'  , 19);
INSERT INTO owners VALUES (DEFAULT ,'Bob'  , 45 );
INSERT INTO owners VALUES (DEFAULT ,'Melody Pond'  , 77) ;
INSERT INTO owners VALUES (DEFAULT ,'Dean Winchester'  , 14 );
INSERT INTO owners VALUES (DEFAULT ,'Jodie Whittaker' ,  38);

INSERT INTO species VALUES (DEFAULT , 'Pokemon');
INSERT INTO species VALUES (DEFAULT , 'Digimon');

UPDATE animals
SET species_id =
CASE
WHEN name LIKE '%mon' THEN 'Digimon'
ELSE 'Pokemon'
END;

UPDATE animals SET owner_id = 'Dean Winchester' WHERE name = 'Angemon' OR name = 'Boarmon';
UPDATE animals SET owner_id = 'Melody Pond' WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 'Bob owns' WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 'Jennifer Orwell' WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 'Sam Smith' WHERE name = 'Agumon';
