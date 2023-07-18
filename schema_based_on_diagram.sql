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

CREATE TABLE invoice_items (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
FOREIGN KEY (invoices_id) REFERENCES invoices (id),
FOREIGN KEY (treatments_id) REFERENCES treatments (id)
);

CREATE TABLE treatments (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
type VARCHAR(50),
name VARCHAR(50),
);


CREATE TABLE treatments_histories (
medical_histories_id INT,
treatments_id INT,
FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id),
FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);