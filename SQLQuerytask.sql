CREATE DATABASE CompanyDB;


USE CompanyDB;


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT,
    Salary DECIMAL,
    HireDate DATETIME,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert records into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

-- Insert records into Employees table
INSERT INTO Employee (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate) VALUES
(1, 'John', 'Doe', 1, 50000.00, '2022-03-15'),
(2, 'Jane', 'Smith', 2, 45000.00, '2021-12-10'),
(3, 'Michael', 'Johnson', 1, 55000.00, '2023-05-20'),
(4, 'Emily', 'Brown', 3, 60000.00, '2024-02-01'),
(5, 'David', 'Williams', 2, 48000.00, '2023-08-18');
-- ... (insert 5 more records)

-- Update salary for employees in the IT department
UPDATE Employee SET Salary = Salary * 1.1 WHERE DepartmentID = 1;

-- Delete records of employees with salary less than 30000
DELETE FROM Employee WHERE Salary < 30000;

SELECT Employee.FirstName, Employee.LastName, Departments.DepartmentName, Employee.Salary
FROM Employee
INNER JOIN Departments ON Employee.DepartmentID = Departments.DepartmentID;


SELECT Departments.DepartmentName, COUNT(Employee.EmployeeID) AS EmployeeCount
FROM Departments
LEFT JOIN Employee ON Departments.DepartmentID = Employee.DepartmentID
GROUP BY Departments.DepartmentName;

SELECT FirstName, LastName, HireDate
FROM Employee
WHERE HireDate > '2023-01-01';
