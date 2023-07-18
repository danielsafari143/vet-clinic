CREATE DATABASE medical_clinic;

CREATE TABLE patients (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100),
date_of_birth DATE);

CREATE TABLE medical_histories (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
admitted_at DATE,
patient_id INT,
status VARCHAR ,
FOREIGN KEY (patient_id) REFERENCES patients (id));

CREATE TABLE invoices (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
total_amount DECIMAL ,
generated_at TIMESTAMP,
payed_at TIMESTAMP ,
medical_history_id INT,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id));
