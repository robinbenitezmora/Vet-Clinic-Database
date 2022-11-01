/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY,
    name character varying(50) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
  id   int GENERATED ALWAYS AS IDENTITY,
  admitted_at  timestamp,
  patient_id  int,
  status  varchar,
  PRIMARY KEY (id)
);

CREATE TABLE treatments(
  id   int GENERATED ALWAYS AS IDENTITY,
  type  varchar,
  name  varchar,
  PRIMARY KEY (id)
);

CREATE TABLE invoices (
	id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT,
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(10,2),
    quantity INT,
    total_price DECIMAL(10,2),
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
);
