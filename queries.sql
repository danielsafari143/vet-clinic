/*Queries that provide answers to the questions from all projects.*/

 BEGIN;
 UPDATE animals SET species = 'unspecified';
 ROLLBACK;

 BEGIN;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
 COMMIT;

 BEGIN;
 DELETE FROM animals;
 ROLLBACK;

 BEGIN;
 DELETE FROM animals WHERE date_of_birth > '2022-1-1';
 SAVEPOINT deletedAnimals;
 UPDATE animals SET weight_kg = weight_kg * -1;
 ROLLBACK TO SAVEPOINT deletedAnimals;
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
 COMMIT;

 SELECT COUNT(*) FROM animals;
 SELECT escape_attempts , COUNT(*) FROM animals GROUP BY escape_attempts HAVING escape_attempts = 0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT  neutered , COUNT(escape_attempts) FROM animals GROUP BY neutered;
 SELECT species , MIN(weight_kg) , MAX(weight_kg) FROM animals GROUP BY species;
 SELECT species , AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31'  GROUP BY species;
 

