/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
 id               INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
 name             VARCHAR(20) ,
 date_of_birth    DATE ,
 escape_attempts  INTEGER,
 neutered         BOOLEAN,
 weight_kg        DECIMAL
 );

