/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INTEGER,
    name character VARCHAR(50) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INTEGER,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status  VARCHAR(50) NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patients(id),
  FOREIGN KEY (id) REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
  id INTEGER,
  type VARCHAR(50),
  name VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE invoices (
	id INTEGER,
  total_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INTEGER,
    unit_price DECIMAL(10,2),
    quantity INT,
    total_price DECIMAL(10,2),
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories_treatments (
  id INTEGER,
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE INDEX ON medical_histories_treatments (medical_history_id);
CREATE INDEX ON medical_histories_treatments (treatment_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON medical_histories (id);
