CREATE TABLE Supplier (
    scode VARCHAR(5) PRIMARY KEY,
    sname VARCHAR(30),
    scity VARCHAR(20),
    turnover DECIMAL(10,2)
);

CREATE TABLE Part (
    pcode VARCHAR(5) PRIMARY KEY,
    weigh INT,
    color VARCHAR(20),
    cost DECIMAL(10,2),
    sellingprice DECIMAL(10,2)
);

CREATE TABLE Supplier_Part (
    scode VARCHAR(5),
    pcode VARCHAR(5),
    qty INT,

    PRIMARY KEY (scode, pcode),

    CONSTRAINT FK_SP_SUPPLIER
    FOREIGN KEY (scode)
    REFERENCES Supplier(scode),

    CONSTRAINT FK_SP_PART
    FOREIGN KEY (pcode)
    REFERENCES Part(pcode)
);
INSERT INTO Supplier VALUES
('S1', 'ABC Ltd', 'Bombay', 50.00),
('S2', 'XYZ Ltd', 'Delhi', 75.00),
('S3', 'PQR Ltd', 'Bombay', 100.00),
('S4', 'LMN Ltd', 'Pune', NULL),
('S5', 'RST Ltd', 'Ahmedabad', 40.00);

INSERT INTO Part VALUES
('P1', 20, 'Red', 20.00, 30.00),
('P2', 30, 'Blue', 30.00, 45.00),
('P3', 40, 'Green', 40.00, 55.00),
('P4', 28, 'Black', 50.00, 65.00),
('P5', 35, 'White', 60.00, 75.00);

INSERT INTO Supplier_Part VALUES
('S1', 'P1', 100),
('S1', 'P2', 50),
('S2', 'P2', 80),
('S2', 'P3', 40),
('S3', 'P2', 60),
('S3', 'P4', 70),
('S4', 'P5', 30),
('S5', 'P1', 90);

SELECT scode, pcode
FROM Supplier_Part
ORDER BY scode ASC;

SELECT *
FROM Supplier
WHERE scity = 'Bombay'
AND turnover = 50;

SELECT COUNT(scode)
FROM Supplier;

SELECT pcode
FROM Part
WHERE weigh BETWEEN 25 AND 35;

SELECT scode
FROM Supplier
WHERE turnover IS NULL;

SELECT pcode
FROM Part
WHERE cost = 20				/* 	WHERE cost IN (20, 30, 40);	*/
   OR cost = 30
   OR cost = 40;

SELECT SUM(qty)
FROM Supplier_Part
WHERE pcode = 'P2';

SELECT s.sname
FROM Supplier s
JOIN Supplier_Part sp
ON s.scode = sp.scode
WHERE sp.pcode = 'P2';

SELECT pcode
FROM Part
WHERE cost > (
    SELECT AVG(cost)
    FROM Part
);

SELECT scode, turnover
FROM Supplier
ORDER BY turnover DESC;