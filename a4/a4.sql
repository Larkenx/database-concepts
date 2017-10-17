CREATE TABLE Student (
  Sid   INTEGER,
  Sname VARCHAR(15),
  PRIMARY KEY (Sid)
);

CREATE TABLE Major (
  Sid   INTEGER REFERENCES Student (Sid),
  Major VARCHAR(15)
);

CREATE TABLE Book (
  Bookno INTEGER,
  Title  VARCHAR(30),
  Price  INTEGER,
  PRIMARY KEY (Bookno)
);

CREATE TABLE Cites (
  Bookno      INTEGER REFERENCES Book (Bookno),
  CitedBookno INTEGER REFERENCES Book (Bookno)
);

CREATE TABLE Buys (
  Sid    INTEGER REFERENCES Student (Sid),
  Bookno INTEGER REFERENCES Book (Bookno)
);

-- Data for Assignment 4
-- student

INSERT INTO student VALUES (1001, 'Jean');
INSERT INTO student VALUES (1002, 'Maria');
INSERT INTO student VALUES (1003, 'Anna');
INSERT INTO student VALUES (1004, 'Chin');
INSERT INTO student VALUES (1005, 'John');
INSERT INTO student VALUES (1006, 'Ryan');
INSERT INTO student VALUES (1007, 'Catherine');
INSERT INTO student VALUES (1008, 'Emma');
INSERT INTO student VALUES (1009, 'Jan');
INSERT INTO student VALUES (1010, 'Linda');
INSERT INTO student VALUES (1011, 'Nick');
INSERT INTO student VALUES (1012, 'Eric');
INSERT INTO student VALUES (1013, 'Lisa');
INSERT INTO student VALUES (1014, 'Filip');
INSERT INTO student VALUES (1015, 'Dirk');
INSERT INTO student VALUES (1016, 'Mary');
INSERT INTO student VALUES (1017, 'Ellen');
INSERT INTO student VALUES (1020, 'Ahmed');
INSERT INTO student VALUES (1021, 'Vince');
INSERT INTO student VALUES (1022, 'Joeri');
INSERT INTO student VALUES (1023, 'Chris');
INSERT INTO student VALUES (1040, 'Sofie');

-- book

INSERT INTO book VALUES (2001, 'Databases', 40);
INSERT INTO book VALUES (2002, 'OperatingSystems', 25);
INSERT INTO book VALUES (2003, 'Networks', 20);
INSERT INTO book VALUES (2004, 'AI', 45);
INSERT INTO book VALUES (2005, 'DiscreteMathematics', 20);
INSERT INTO book VALUES (2006, 'SQL', 25);
INSERT INTO book VALUES (2007, 'ProgrammingLanguages', 15);
INSERT INTO book VALUES (2008, 'DataScience', 50);
INSERT INTO book VALUES (2009, 'Calculus', 10);
INSERT INTO book VALUES (2010, 'Philosophy', 25);
INSERT INTO book VALUES (2012, 'Geometry', 80);
INSERT INTO book VALUES (2013, 'RealAnalysis', 35);
INSERT INTO book VALUES (2011, 'Anthropology', 50);
INSERT INTO book VALUES (2014, 'Topology', 70);

-- cites
INSERT INTO cites VALUES (2012, 2001);
INSERT INTO cites VALUES (2008, 2011);
INSERT INTO cites VALUES (2008, 2012);
INSERT INTO cites VALUES (2001, 2002);
INSERT INTO cites VALUES (2001, 2007);
INSERT INTO cites VALUES (2002, 2003);
INSERT INTO cites VALUES (2003, 2001);
INSERT INTO cites VALUES (2003, 2004);
INSERT INTO cites VALUES (2003, 2002);
INSERT INTO cites VALUES (2010, 2001);
INSERT INTO cites VALUES (2010, 2002);
INSERT INTO cites VALUES (2010, 2003);
INSERT INTO cites VALUES (2010, 2004);
INSERT INTO cites VALUES (2010, 2005);
INSERT INTO cites VALUES (2010, 2006);
INSERT INTO cites VALUES (2010, 2007);
INSERT INTO cites VALUES (2010, 2008);
INSERT INTO cites VALUES (2010, 2009);
INSERT INTO cites VALUES (2010, 2011);
INSERT INTO cites VALUES (2010, 2013);
INSERT INTO cites VALUES (2010, 2014);

-- buys
INSERT INTO buys VALUES (1023, 2012);
INSERT INTO buys VALUES (1023, 2014);
INSERT INTO buys VALUES (1040, 2002);
INSERT INTO buys VALUES (1001, 2002);
INSERT INTO buys VALUES (1001, 2007);
INSERT INTO buys VALUES (1001, 2009);
INSERT INTO buys VALUES (1001, 2011);
INSERT INTO buys VALUES (1001, 2013);
INSERT INTO buys VALUES (1002, 2001);
INSERT INTO buys VALUES (1002, 2002);
INSERT INTO buys VALUES (1002, 2007);
INSERT INTO buys VALUES (1002, 2011);
INSERT INTO buys VALUES (1002, 2012);
INSERT INTO buys VALUES (1002, 2013);
INSERT INTO buys VALUES (1003, 2002);
INSERT INTO buys VALUES (1003, 2007);
INSERT INTO buys VALUES (1003, 2011);
INSERT INTO buys VALUES (1003, 2012);
INSERT INTO buys VALUES (1003, 2013);
INSERT INTO buys VALUES (1004, 2006);
INSERT INTO buys VALUES (1004, 2007);
INSERT INTO buys VALUES (1004, 2008);
INSERT INTO buys VALUES (1004, 2011);
INSERT INTO buys VALUES (1004, 2012);
INSERT INTO buys VALUES (1004, 2013);
INSERT INTO buys VALUES (1005, 2007);
INSERT INTO buys VALUES (1005, 2011);
INSERT INTO buys VALUES (1005, 2012);
INSERT INTO buys VALUES (1005, 2013);
INSERT INTO buys VALUES (1006, 2006);
INSERT INTO buys VALUES (1006, 2007);
INSERT INTO buys VALUES (1006, 2008);
INSERT INTO buys VALUES (1006, 2011);
INSERT INTO buys VALUES (1006, 2012);
INSERT INTO buys VALUES (1006, 2013);
INSERT INTO buys VALUES (1007, 2001);
INSERT INTO buys VALUES (1007, 2002);
INSERT INTO buys VALUES (1007, 2003);
INSERT INTO buys VALUES (1007, 2007);
INSERT INTO buys VALUES (1007, 2008);
INSERT INTO buys VALUES (1007, 2009);
INSERT INTO buys VALUES (1007, 2010);
INSERT INTO buys VALUES (1007, 2011);
INSERT INTO buys VALUES (1007, 2012);
INSERT INTO buys VALUES (1007, 2013);
INSERT INTO buys VALUES (1008, 2007);
INSERT INTO buys VALUES (1008, 2011);
INSERT INTO buys VALUES (1008, 2012);
INSERT INTO buys VALUES (1008, 2013);
INSERT INTO buys VALUES (1009, 2001);
INSERT INTO buys VALUES (1009, 2002);
INSERT INTO buys VALUES (1009, 2011);
INSERT INTO buys VALUES (1009, 2012);
INSERT INTO buys VALUES (1009, 2013);
INSERT INTO buys VALUES (1010, 2001);
INSERT INTO buys VALUES (1010, 2002);
INSERT INTO buys VALUES (1010, 2003);
INSERT INTO buys VALUES (1010, 2011);
INSERT INTO buys VALUES (1010, 2012);
INSERT INTO buys VALUES (1010, 2013);
INSERT INTO buys VALUES (1011, 2002);
INSERT INTO buys VALUES (1011, 2011);
INSERT INTO buys VALUES (1011, 2012);
INSERT INTO buys VALUES (1012, 2011);
INSERT INTO buys VALUES (1012, 2012);
INSERT INTO buys VALUES (1013, 2001);
INSERT INTO buys VALUES (1013, 2011);
INSERT INTO buys VALUES (1013, 2012);
INSERT INTO buys VALUES (1014, 2008);
INSERT INTO buys VALUES (1014, 2011);
INSERT INTO buys VALUES (1014, 2012);
INSERT INTO buys VALUES (1017, 2001);
INSERT INTO buys VALUES (1017, 2002);
INSERT INTO buys VALUES (1017, 2003);
INSERT INTO buys VALUES (1017, 2008);
INSERT INTO buys VALUES (1017, 2012);
INSERT INTO buys VALUES (1020, 2001);
INSERT INTO buys VALUES (1020, 2012);
INSERT INTO buys VALUES (1022, 2014);

-- major
INSERT INTO major VALUES (1001, 'Math');
INSERT INTO major VALUES (1001, 'Physics');
INSERT INTO major VALUES (1002, 'CS');
INSERT INTO major VALUES (1002, 'Math');
INSERT INTO major VALUES (1003, 'Math');
INSERT INTO major VALUES (1004, 'CS');
INSERT INTO major VALUES (1006, 'CS');
INSERT INTO major VALUES (1007, 'CS');
INSERT INTO major VALUES (1007, 'Physics');
INSERT INTO major VALUES (1008, 'Physics');
INSERT INTO major VALUES (1009, 'Biology');
INSERT INTO major VALUES (1010, 'Biology');
INSERT INTO major VALUES (1011, 'CS');
INSERT INTO major VALUES (1011, 'Math');
INSERT INTO major VALUES (1012, 'CS');
INSERT INTO major VALUES (1013, 'CS');
INSERT INTO major VALUES (1013, 'Psychology');
INSERT INTO major VALUES (1014, 'Theater');
INSERT INTO major VALUES (1017, 'Anthropology');
INSERT INTO major VALUES (1022, 'CS');
INSERT INTO major VALUES (1015, 'Chemistry');

\echo "Problem 1"
-- 1
WITH E1 AS (SELECT *
            FROM Cites
              INNER JOIN Book ON Cites.Bookno =
                                 Book.Bookno) -- this returns cited books cited by books that cost less than 50 and yields the proper output
SELECT DISTINCT CitedBookno
FROM E1
WHERE Price < 50;

\echo "Problem 2"
-- 2

WITH E1 AS (SELECT
              M.Sid,
              M.Major  AS Major1,
              M1.Major AS Major2
            FROM Major M INNER JOIN Major M1 ON M1.Sid = M.Sid),
    E2 AS (SELECT S.Sid
           FROM Student S INNER JOIN E1 ON S.Sid = E1.Sid
           WHERE E1.Major1 = 'CS' AND E1.Major2 = 'Math'),
    E3 AS (SELECT
             Buys.Sid,
             Buys.Bookno
           FROM E2
             INNER JOIN Buys ON E2.Sid = Buys.Sid),
    E4 AS (SELECT
             Book.Bookno,
             Book.Title
           FROM E3
             INNER JOIN Book ON E3.Bookno = Book.Bookno)
SELECT DISTINCT
  Bookno,
  Title
FROM E4;

\echo "Problem 3"
-- 3
-- like number one, this returns cited books that cost less than 50. the question implies that we are seeking
-- books *cited* by books costing less than 50
WITH E1 AS (SELECT
              C.Bookno,
              C.CitedBookno
            FROM Cites C, Cites C1
            WHERE C.CitedBookno = C1.CitedBookno AND C.Bookno <> C1.Bookno),
    E2 AS (SELECT CitedBookno, Price
           FROM E1
             INNER JOIN Book ON Book.Bookno = E1.CitedBookno),
    E3 AS (SELECT CitedBookno
           FROM E2
           WHERE Price < 50)
SELECT DISTINCT
  Sid,
  CitedBookno
FROM Buys
  INNER JOIN E3 ON Buys.Bookno = E3.CitedBookno;

\echo "Problem 4"
-- 4
WITH E1 AS (SELECT Sid
            FROM Student),
    E2 AS (SELECT Bookno
           FROM Book
           WHERE Price > 50),
    E3 AS (SELECT
             Sid,
             Bookno
           FROM E2, Student),
    E4 AS (SELECT *
           FROM E3 EXCEPT SELECT *
                          FROM Buys),
    E5 AS (SELECT Sid
           FROM E4)
SELECT Sid
FROM E5 EXCEPT SELECT sid
               FROM E1;

\echo "Problem 5"
-- 5
WITH E1 AS (SELECT Bookno
            FROM Book EXCEPT SELECT Bookno
                             FROM Buys),
    E2 AS (SELECT Buys.Bookno
           FROM Buys
             INNER JOIN Major ON Major.Sid = Buys.Sid
           WHERE Major = 'CS'),
    E3 AS (SELECT Bookno
           FROM Book EXCEPT SELECT Bookno
                            FROM E2),
    E4 AS (SELECT Bookno
           FROM E1
           UNION SELECT Bookno
                 FROM E3)
SELECT DISTINCT Bookno
FROM E4;

\echo "Problem 6"
-- 6
\echo "Attempt 6#1"
-- this query gets the book number of every book except books that weren't purchased individually by every single CS student
WITH E1 AS (Select Sid from Major WHERE Major='CS'), -- every student majoring in CS
     E2 AS (SELECT Sid, Bookno from E1, Book), -- cartesian product of every CS student and every book
     E3 AS (SELECT Buys.Sid, Buys.Bookno FROM Buys INNER JOIN E1 on E1.Sid=Buys.Sid), -- actual buys table of CS student purchases
     E4 AS (SELECT Bookno from Book EXCEPT Select Bookno from Buys)
SELECT Bookno from E2 EXCEPT SELECT Bookno FROM E3 UNION (SELECT Bookno FROM E4);

\echo "Attempt 6#2"
-- this query gets books not purchased exclusively by CS students
WITH E1 AS (Select Sid from Major WHERE Major='CS'), -- every student majoring in CS
     E2 AS (SELECT Sid from Major WHERE Major<>'CS'), -- all other students
     E3 AS (SELECT Bookno from Buys INNER JOIN E1 on E1.Sid=Buys.Sid),
     E4 AS (Select Bookno from Buys INNER JOIN E2 on E2.Sid=Buys.Sid)
(SELECT Bookno from E3 except Select bookno from E4) UNION (SELECT Bookno FROM Book WHERE book.Bookno not in (select Buys.Bookno from buys))
