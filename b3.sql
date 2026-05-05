USE Session10;
CREATE TABLE Departments (
 Dept_ID INT PRIMARY KEY,
 Dept_Name VARCHAR( 100)
);
CREATE TABLE Invoices (
 Invoice_ID INT PRIMARY KEY,
 Patient_ID INT,
 Dept_ID INT,
 Amount DECIMAL(10, 2)
);
INSERT INTO Departments VALUES (1, 'Noi'), (2, 'Ngoại' );
INSERT INTO Invoices VALUES (101, 1, 1, 500.00), (102, 2, 1, 300.00), (103, 3, 2,
1000.00);
 
CREATE VIEW Department_Revenue_View AS
SELECT d.Dept_Name, COUNT(DISTINCT i.Patient_ID) AS total_patients, SUM(i.Amount) AS total_revenue
FROM Departments AS d
JOIN Invoices AS i 
ON d.Dept_ID = i.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;
