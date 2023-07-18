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

CREATE INDEX patient_id_index ON medical_histories (patient_id);

CREATE TABLE invoices (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
total_amount DECIMAL ,
generated_at TIMESTAMP,
payed_at TIMESTAMP ,
medical_history_id INT,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id));

CREATE INDEX medical_histories__id_index ON invoices(medical_history_id);

CREATE TABLE invoice_items (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
FOREIGN KEY (invoice_id) REFERENCES invoices (id),
FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);


CREATE INDEX invoice_treatment_id_index ON invoice_items(invoice_id, treatment_id);

CREATE TABLE treatments (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
type VARCHAR(50),
name VARCHAR(50)
);


CREATE TABLE treatments_histories (
medical_histories_id INT,
treatments_id INT,
FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id),
FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);

CREATE INDEX medical_histories_treatment_id_index ON treatments_histories(medical_histories_id, treatments_id);