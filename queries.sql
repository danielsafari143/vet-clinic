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
 
 SELECT * FROM animals LEFT JOIN owners  ON owners.full_name = owner_id WHERE full_name = 'Melody Pond';
 SELECT * FROM animals JOIN species  ON species.name = 'Pokemon' WHERE species_id = 'Pokemon';
 SELECT * FROM animals FULL OUTER JOIN owners  ON owners.full_name = owner_id;
 SELECT species_id , count(*)  FROM animals JOIN owners  ON owners.full_name = owner_id GROUP BY species_id;
 SELECT * FROM animals JOIN species  ON species.name = species_id WHERE owner_id = 'Jennifer Orwell';
 SELECT * FROM animals JOIN species  ON species.name = species_id WHERE animals.name = 'Dean Winchester' AND escape_attempts = 0;
 SELECT owner_id , count(species_id)  FROM animals JOIN owners  ON owners.full_name = owner_id GROUP BY owner_id;

SELECT name, date_of_visit FROM animals JOIN visits ON visits.animal_id = animals.id WHERE vets_id = 'William Tatcher'
AND date_of_visit = (
  SELECT MAX(date_of_visit)
  FROM visits
  WHERE vets_id = 'William Tatcher'
);

SELECT count(*) FROM visits GROUP BY vets_id  HAVING vets_id = 'Stephanie Mendez';

SELECT * FROM vets FULL OUTER JOIN specializations ON name = vets_id;

SELECT * FROM animals JOIN visits ON visits.animal_id = id WHERE vets_id = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-4-1' AND  '2020-8-30';

SELECT name , count(*) FROM animals JOIN visits ON visits.animal_id = id GROUP BY name ORDER BY count DESC;

SELECT name, date_of_visit FROM animals JOIN visits ON visits.animal_id = animals.id WHERE vets_id = 'Maisy Smith'
AND date_of_visit = (
  SELECT MIN(date_of_visit)
  FROM visits
  WHERE vets_id = 'Maisy Smith'
);

SELECT * FROM animals
JOIN visits ON visits.animal_id = id
JOIN vets ON vets.name = visits.vets_id 
WHERE  date_of_visit = (
  SELECT MAX(date_of_visit)
  FROM visits
);

SELECT count(*) FROM vets FULL OUTER JOIN specializations ON name = vets_id WHERE species_id IS NULL;

