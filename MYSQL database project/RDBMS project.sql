-- Drop database SHMS;

CREATE DATABASE IF NOT EXISTS SHMS; -- We are checking the database name and created one database as "SHMS =  Smart Healthcare Management System". 

use SHMS; -- we selected the database.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    contact_info VARCHAR(255),
    medical_history TEXT,
    allergies TEXT
); -- It is Patients Table.

INSERT INTO Patients (patient_id,name, dob, contact_info, medical_history, allergies) 
VALUES (1,'Jeevan', '2004-04-15', 'jeevanandan2468@gmail.com', 'None', 'Penicillin'),
(2,'Suresh', '2004-05-16', 'suresh@gmail.com', 'None', 'Penicillin'),
(3,'Ganesh', '2002-10-24', 'ganesh@gmail.com', 'None', 'Penicillin'),
(4,'Mano', '2003-11-17', 'Mano@gmail.com', 'None', 'Penicillin'),
(5,'Prasanth', '2004-11-09', 'prasanth@gmail.com', 'None', 'Penicillin'); -- Insert New Patient Record at table "patients".

select * from patients; -- viewed output for table "patient".

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    availability VARCHAR(100) -- Store available hours/days
); -- It is Doctors Table.

insert into Doctors(name,specialization,availability)values('john','Blood','Monday'),('Swetha','Sugar','Thursday'),
('john','Corona','friday'),('john','Fullbody','tuesday'),('john','Corona','Wednesday'); -- Insert New Patient Record at table "Docters".

select * from Doctors;  -- viewed output for table "Docters".

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(50), -- Pending, Completed, Canceled
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
); -- This is an Appointments table.

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) 
VALUES (1, 2, '2024-11-15', 'Pending'),(2, 3, '2024-11-14', 'Completed'),(3, 4, '2024-11-18', 'Completed'),(4, 5, '2024-11-20', 'Pending')
,(5, 1, '2024-11-10', 'Canceled'); -- Schedule an Appointment,we inserted data in table"Appointments".

SELECT * FROM Appointments 
WHERE doctor_id = 2 AND appointment_date BETWEEN '2024-11-01' AND '2024-11-30'; -- Get All Appointments for a Doctor.


CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    medicine_name VARCHAR(255),
    dosage VARCHAR(100),
    duration INT, -- Duration in days
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
); -- This is an prescriptions table.

insert into Prescriptions(patient_id, doctor_id, medicine_name,dosage, duration)values(1,2,'Victomet','200mg',5),
(2,3,'Glucose','300mg',15),(3,5,'Dolo','600mg',8),(4,1,'Parachutemol','150mg',1),(5,4,'Vicks','20mg',4);

select * from Prescriptions; -- viewed output in table"Prescription".

UPDATE Prescriptions
SET medicine_name = 'Tenebeat', dosage = '200mg', duration = 7
WHERE prescription_id = 1; -- Update Prescription for a Patient.


CREATE TABLE Medical_Reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    report_type VARCHAR(100),
    report_date DATE,
    results TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
); -- Its an Medical Reports Table.

insert into Medical_Reports(patient_id, report_type, report_date, results)values(1,'Document','2024-11-10','positive'),
(4,'Online','2024-10-20','positive'),(5,'Document','2024-01-10','Negative'),(2,'Document','2024-11-05','Negative'),
(3,'Online','2024-12-08','positive'); -- inserted datas in table "Medical_Reports".

SELECT report_type, report_date, results 
FROM Medical_Reports 
WHERE patient_id = 1; -- Fetch Patient’s Medical Reports.



CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    treatment_details TEXT,
    amount DECIMAL(10, 2),
    payment_status VARCHAR(50), -- Paid, Unpaid, Pending
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
); -- This is an Bills Table


INSERT INTO Bills (patient_id, treatment_details, amount, payment_status)
VALUES (1, 'Consultation, Blood group Test', 150.00, 'Unpaid'),(4, 'Consultation, Suger Test', 130.00, 'paid'),
(3, 'Consultation, Urine Test', 200.00, 'Pending'),(5, 'Consultation, Corona test', 500.00, 'paid'),
(2, 'Consultation, Full Body Chechup', 6000.00, 'paid');  -- Inserted a data in table "Bills".				


SELECT SUM(amount) AS total_amount 
FROM Bills 
WHERE patient_id = 1; -- Calculate Total Bills for a Patient.



