CREATE DATABASE bank_management;
USE bank_management;

CREATE TABLE Branch (
    branch_name VARCHAR(100) PRIMARY KEY,
    branch_city VARCHAR(100),
    assets DECIMAL(15,2)
);

CREATE TABLE Customer (
    customer_name VARCHAR(100),
    customer_street VARCHAR(100),
    customer_city VARCHAR(100),
    PRIMARY KEY (customer_name)
);

CREATE TABLE Loan (
    loan_number VARCHAR(50) PRIMARY KEY,
    branch_name VARCHAR(100),
    amount DECIMAL(15,2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

CREATE TABLE Borrower (
    customer_name VARCHAR(100),
    loan_number VARCHAR(50),
    PRIMARY KEY (customer_name, loan_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (loan_number) REFERENCES Loan(loan_number)
);

CREATE TABLE Account (
    account_number VARCHAR(50) PRIMARY KEY,
    branch_name VARCHAR(100),
    balance DECIMAL(15,2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

CREATE TABLE Depositor (
    customer_name VARCHAR(100),
    account_number VARCHAR(50),
    PRIMARY KEY (customer_name, account_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (account_number) REFERENCES Account(account_number)
);

INSERT INTO Branch (branch_name, branch_city, assets) VALUES
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 800000);

INSERT INTO Customer (customer_name, customer_street, customer_city) VALUES
('Adams', 'Spring', 'Pittsfield'),
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sand Hill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Turner', 'Putnam', 'Stamford'),
('Smith', 'North', 'Rye'),
('Williams', 'Nassau', 'Princeton');

INSERT INTO Loan (loan_number, branch_name, amount) VALUES
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500);

INSERT INTO Account (account_number, branch_name, balance) VALUES
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350);

INSERT INTO Depositor (customer_name, account_number) VALUES
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Johnson', 'A-201'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305');

