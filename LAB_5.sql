CREATE TABLE AUTHOR (
    Author_ID VARCHAR(5),
    Lastname VARCHAR(15) NOT NULL,
    Firstname VARCHAR(15) NOT NULL,
    Email VARCHAR(40),
    City VARCHAR(15),
    Country VARCHAR(15),

    CONSTRAINT PK_AUTHOR
    PRIMARY KEY (Author_ID)
);

CREATE TABLE BOOK (
    Book_ID VARCHAR(5),
    Book_Title VARCHAR(100) NOT NULL,
    Copies INT,

    CONSTRAINT PK_BOOK
    PRIMARY KEY (Book_ID),

    CONSTRAINT CHK_BOOK_ID
    CHECK (Book_ID LIKE 'B%'),

    CONSTRAINT CHK_COPIES
    CHECK (Copies > 2)
);

CREATE TABLE AUTHOR_LIST (
    Author_ID VARCHAR(5),
    Book_ID VARCHAR(5),
    Role VARCHAR(15),

    CONSTRAINT PK_AUTHOR_LIST
    PRIMARY KEY (Author_ID, Book_ID),

    CONSTRAINT FK_AUTHOR_LIST_AUTHOR
    FOREIGN KEY (Author_ID)
    REFERENCES AUTHOR(Author_ID),

    CONSTRAINT FK_AUTHOR_LIST_BOOK
    FOREIGN KEY (Book_ID)
    REFERENCES BOOK(Book_ID)
);

INSERT INTO AUTHOR
VALUES
('A0001', 'Sharma', 'Raj', 'raj@gmail.com', 'Ahmedabad', 'India'),
('A0002', 'Patel', 'Neha', 'neha@gmail.com', 'Mumbai', 'India'),
('A0003', 'Mehta', 'Amit', 'amit@gmail.com', 'Delhi', 'India'),
('A0004', 'Desai', 'Priya', 'priya@gmail.com', 'Pune', 'India');

INSERT INTO BOOK
VALUES
('B0001', 'Database Management System', 5),
('B0002', 'Computer Networks', 4),
('B0003', 'Operating Systems', 6),
('B0004', 'Data Structures', 8);

INSERT INTO AUTHOR_LIST
VALUES
('A0001', 'B0001', 'Main Author'),
('A0002', 'B0002', 'Main Author'),
('A0003', 'B0003', 'Co-Author'),
('A0004', 'B0004', 'Main Author');

ALTER TABLE AUTHOR_LIST
ADD Publisher VARCHAR(30);

SELECT * FROM AUTHOR;
SELECT * FROM BOOK;
SELECT * FROM AUTHOR_LIST;

/*	CREATE DATABASE USERS	*/
   
CREATE USER 'manager_user'@'localhost'                  /* CREATE USER 'username'@'host' */
IDENTIFIED BY 'Manager@123';							/* IDENTIFIED BY 'password';     */

CREATE USER 'staff_user'@'localhost'
IDENTIFIED BY 'Staff@123';


/*	GRANT PRIVILEGES TO manager_user	*/

GRANT SELECT, INSERT, UPDATE
ON AUTHOR
TO 'manager_user'@'localhost';

GRANT SELECT
ON BOOK
TO 'staff_user'@'localhost';

REVOKE INSERT
ON AUTHOR
FROM 'manager_user'@'localhost';

/*	13. VERIFY PRIVILEGES	*/

SHOW GRANTS FOR 'manager_user'@'localhost';
SHOW GRANTS FOR 'staff_user'@'localhost';