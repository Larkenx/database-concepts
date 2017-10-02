DROP TABLE Buys;
DROP TABLE Major;
DROP TABLE Cites;
DROP TABLE Book;
DROP TABLE Student;

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
  Bid   INTEGER,
  Title VARCHAR(30),
  Price INTEGER,
  PRIMARY KEY (Bid)
);

CREATE TABLE Cites (
  Bid      INTEGER REFERENCES Book (Bid),
  CitedBid INTEGER REFERENCES Book (Bid)
);

CREATE TABLE Buys (
  Sid INTEGER REFERENCES Student (Sid),
  Bid INTEGER REFERENCES Book (Bid)
);

-- Data for the student relation.
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

-- Data for the book relation.

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

-- Data for the buys relation.

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
INSERT INTO buys VALUES (1020, 2012);

-- Data for the cites relation.
INSERT INTO cites VALUES (2012, 2001);
INSERT INTO cites VALUES (2008, 2011);
INSERT INTO cites VALUES (2008, 2012);
INSERT INTO cites VALUES (2001, 2002);
INSERT INTO cites VALUES (2001, 2007);
INSERT INTO cites VALUES (2002, 2003);
INSERT INTO cites VALUES (2003, 2001);
INSERT INTO cites VALUES (2003, 2004);
INSERT INTO cites VALUES (2003, 2002);

-- Data for the cites relation.

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

-- 1. (10 points) Find the bid and title of each book that costs between $10 and
-- $40 and that was bought by a student who majors in both CS and Math.
\echo "Exercise 1"
SELECT DISTINCT
  Book.Bid,
  Book.Title
FROM

  -- build a view of all the purchase orders for books by students
  Buys AS T, Book
WHERE
  T.Bid = Book.Bid AND
  T.Bid IN (SELECT
              -- build a view of all the books priced between 10 and 40 dollars
              Book.Bid
            FROM Book
            WHERE Book.Price >= 10 AND Book.price <= 40)

  AND
  T.Sid IN -- build a view of students majoring in math and cs
  ((SELECT M.Sid
    FROM Major M
    WHERE M.Major = 'CS')
   INTERSECT
   (SELECT M.Sid
    FROM Major M
    WHERE M.Major = 'Math'));

\echo "Exercise 2"

-- 2. (10 points) Find the sid and name of each student who bought a book
-- that is cited by a higher-priced book.

-- test data
-- INSERT INTO Book VALUES (9999, 'More', 100);
-- INSERT INTO Book VALUES (8888, 'Less', 50);
-- INSERT INTO Buys VALUES (1001, 8888);
-- INSERT INTO Cites VALUES (8888, 9999);
-- INSERT INTO Cites VALUES (9999, 8888);

-- collaborated with Caleb Gardner on this problem
SELECT DISTINCT
  S.Sid,
  S.Sname
FROM
  Student S,
  Buys T
WHERE S.Sid = T.Sid
      AND
      T.Bid IN
      -- all books that are cited by other higher priced books
      ((SELECT DISTINCT Cites.CitedBid
        FROM Cites, Book B
        WHERE B.Bid = Cites.CitedBid AND
              B.Price < SOME (
                -- books that cite another book
                SELECT Book.Price
                FROM Cites, Book
                WHERE Cites.Bid = Book.Bid AND Cites.CitedBid = B.Bid)));
\echo "Exercise 3"
-- 3. (10 points) Find the Bid of each book that cites another book , let that other book be 'b'. Furthermore,
-- b should be a book cited by at least two books.

SELECT DISTINCT C1.Bid
FROM Book B, Cites C1, Cites C2
WHERE B.Bid = C1.CitedBid AND
      B.Bid = C2.CitedBid AND
      C2.Bid <> C1.Bid;

\echo "Exercise 4"

-- 4. (10 points) Find the bid of each book that was not bought by any student.
-- all possible books
SELECT bid
FROM Book
EXCEPT
--   except ones that have been purchased
SELECT DISTINCT bid
FROM Buys;

\echo "Exercise 5"

-- 5. (10 points) Find the sid of each student who did not buy all books that
-- cost more than $50.
SELECT DISTINCT Sid
FROM
  -- assume that all of the students bought all of the books costing more than $50
  -- create the cartesian product of all sid's and books costing more than $50
  -- this creates pairs of students, books such that every student bought every book costing more than $50
  ((SELECT
      Student.Sid,
      Book.Bid
    FROM Student, Book
    WHERE Book.Price > 50)
   -- Subtract all of the students who did purchase all books costing more than $50, and you will be left
   -- with all of the students who did not purchase all books costing more than $50
   EXCEPT
   -- all of the students who bought a book that costs more than $50
   (SELECT
      Buys.Sid,
      Buys.Bid
    FROM Buys
    WHERE Buys.Bid IN (-- all of the books purchased that cost more than $50
      SELECT Bid
      FROM Book
      WHERE Price > 50))) AS BSBSBSB;


\echo "Exercise 6"

-- 6. (10 points) Find the Bid of each book that was bought by a student
-- who majors in CS but that was not bought by any student who majors in
-- Math.

-- we want to find all the students who major in CS that bought a book
-- we want to find all the students who major in math that bought a book
-- we want to find the books such that no math major bought them, and at least one CS major bought one

-- -- all the books purchased by CS major
-- SELECT DISTINCT Buys.Bid
-- FROM Major, Buys
-- WHERE Buys.Sid = Major.Sid
--       AND Major.Major = 'CS';
-- -- all the books purchased by Math major
-- SELECT DISTINCT Buys.Bid
-- FROM Major, Buys
-- WHERE Buys.Sid = Major.Sid
--       AND Major.Major = 'Math';

-- solution
SELECT DISTINCT B.Bid
FROM Book B
-- if at least one CS major bought this book
WHERE B.Bid IN (
  SELECT DISTINCT Buys.Bid
  FROM Major, Buys
  WHERE Buys.Sid = Major.Sid
        AND Major.Major = 'CS'
) AND
      -- but no math majors bought this book
      B.Bid NOT IN (
        SELECT DISTINCT Buys.Bid
        FROM Major, Buys
        WHERE Buys.Sid = Major.Sid
              AND Major.Major = 'Math'
      );

\echo "Exercise 7"

-- 7. (10 points) Find the sid and name of each student who has at single major
-- and who only bought books that cite other books.


-- had trouble getting this one even though it seems pretty trivial
SELECT DISTINCT
  T.Sid,
  S.Sname
FROM Buys T, Student S
-- join student and buys table on sid
WHERE S.Sid = T.Sid
      AND
      -- only want books that cite other books
      T.Bid IN (
        --   books that cite other books
        SELECT DISTINCT Cites.Bid
        FROM Cites
      )
      AND
      -- only want students who have one major
      S.Sid NOT IN (
        --   the student isn't a member of the set of students who have more than one major
        SELECT DISTINCT S2.Sid
        FROM Student S2, Major M1, Major M2
        WHERE S2.Sid = M1.Sid AND S2.Sid = M2.Sid AND M1.Major <> M2.Major
      );


-- another partial solution, that also only retrieves 11 rows
/*
SELECT DISTINCT Student.Sid
 FROM Student
 WHERE Student.Sid NOT IN (
   --   the student isn't a member of the set of students who have more than one major
   SELECT DISTINCT Student.Sid
   FROM Student, Major M1, Major M2
   WHERE Student.Sid = M1.Sid AND Student.Sid = M2.Sid AND M1.Major <> M2.Major
 )
INTERSECT
SELECT DISTINCT Buys.Sid
from Buys
Where Buys.Bid in (Select Bid from Cites);
*/



-- UNION DISTINCT
-- SELECT DISTINCT Student.Sid, Student.Sname
-- FROM Student
-- WHERE Student.Sid NOT IN (SELECT Bid
--                           FROM Buys);

\echo "Exercise 8"

-- 8. (10 points) Find the sid and majors of each student who did not buy any
-- book that cost less than $30.
SELECT
  Student.Sid,
  Major.Major
FROM Student, Major
WHERE Student.Sid = Major.Sid
      AND Student.Sid IN
          (SELECT DISTINCT Student.Sid
           FROM Student
           EXCEPT
           SELECT DISTINCT Buys.sid
           FROM Buys
           WHERE Buys.Bid IN (
             SELECT Book.Bid
             FROM Book
             WHERE Book.Price < 30));

\echo "Exercise 9"

-- 9. (10 points) Find each (s, b) pair where s is the sid of a student and b is
-- the Bid of a book whose price is the highest among the books bought
-- by that student.

SELECT DISTINCT
  S.Sid,
  T.Bid
FROM Student S, Buys T
WHERE T.Bid
      IN (SELECT Expensive.Bid
          FROM Buys Expensive, Book
          WHERE Expensive.Sid = S.Sid -- specify that we are only interested in the books purchased by the
                -- student in the outer query. (for all students, for all books bought by student...)
                AND Expensive.Bid = Book.Bid -- join the books & buys table
                -- the book price we choose has to be greater than or equal to all other books bought by the student
                AND Book.Price >= ALL (SELECT book.price
                                       FROM buys, book -- join books & buys again
                                       WHERE book.bid = buys.bid AND buys.sid = S.sid));

\echo "Exercise 10"

-- 10. (10) Without using the ALL predicate, list the price of the next to most
-- expensive books.
-- * this query uses some
/*
SELECT DISTINCT Book.Price
FROM Book
WHERE Book.Bid IN -- the book is a member of the set of books minus the most expensive book
      (SELECT Book.Bid
       FROM Book
       WHERE Book.Price < SOME (SELECT Price
                                FROM Book))
      -- and the book is greater than all of the other books in the subquery
      AND NOT Book.Price < SOME (SELECT Book.Price
                                 FROM Book
                                 WHERE Book.Price < SOME (SELECT Price
                                                          FROM Book));
                                                          */
-- this query does not use some/all
SELECT DISTINCT B.Price
FROM Book B
WHERE EXISTS(SELECT B1.Bid
             FROM Book B1
             WHERE B1.Price > B.Price)
      AND NOT EXISTS(SELECT b1.Price
                     FROM book b1, book b2
                     WHERE b1.Price > b2.Price AND b2.Price > B.Price);

\echo "Exercise 11"

-- 11. (10 points) Find the triples (s,b1,b2) where s is the sid of a student
-- who if he or she bought book b1, then he or she also bought book b2.
-- Furthermore, b1 and b2 should be different.

-- commenting this out because it returns a lot of rows
/*
SELECT
  Buys.Sid,
  T1.Bid,
  T2.Bid
FROM Buys, Buys T1, Buys T2
WHERE Buys.Sid = T1.Sid
      AND
      Buys.Sid = T2.Sid
      AND T1.Bid <> T2.BID;
*/

\echo "Exercise 12"


-- 12.  (10 points) Find the sid of each student who bought none of the books cited by book with bookno 2001.
SELECT DISTINCT T.Sid
FROM Buys T
WHERE
  NOT EXISTS-- if any tuples are left, then the student did buy a book cited by 2001
  --   all the books that the student purchased
  ((SELECT Buys.Bid
    FROM Buys
    WHERE Buys.Sid = T.Sid)
   INTERSECT -- minus the books that are cited by 2001
   (SELECT DISTINCT Cites.CitedBid
    FROM Cites
    WHERE Cites.Bid = 2001))
UNION DISTINCT
--     students who didn't buy any books at all
SELECT DISTINCT Student.Sid
FROM Student
WHERE Student.Sid NOT IN (SELECT Sid
                          FROM Buys);

\echo "Exercise 13"

-- 13.  (10 points) Find the tuples (b1,b2) where b1 and b2 are the booknos of two different books that were bought by
--  exactly one CS student.

SELECT
  T1.Bid,
  T2.Bid
FROM Buys T1, Buys T2, Major M
-- pairs of books bought by the same CS student
WHERE T1.Bid <> T2.Bid
      AND T1.Sid = T2.Sid
      AND M.Sid = T1.Sid
      AND M.Major = 'CS'
      -- minus the same pairs of books bought by a single different CS student
      AND (T1.Bid, T2.BID) NOT IN
          (SELECT
             T3.Bid,
             T4.Bid
           FROM Buys T3, Buys T4, Major M1, Major M2
           WHERE T3.Bid = T1.Bid AND T2.Bid = T4.Bid
                 AND (T3.Sid <> T1.Sid AND T3.Sid = T4.Sid)
                 AND M1.Sid = T3.Sid
                 AND M2.Sid = T4.Sid
                 AND M1.Major = 'CS' AND M2.Major = 'CS');

\echo "Exercise 14"

-- 14.  (10  points)  Find  the  sid  of  each  student  who  only  bought  books  whose price is
--  greater than the price of any book that was bought by all students who majors in ’Math’.
SELECT Buys.Sid
FROM Buys
EXCEPT
-- all the students who bought at least one book that costs less than at least one math book
SELECT T.Sid
FROM Buys T, Book B
WHERE T.Bid = B.Bid -- join books and buys
      AND B.Price < SOME (SELECT B2.Price
                          FROM Book B2, Buys T2, Major M
                          WHERE
                            B2.Bid = T2.Bid AND M.Sid = T2.Sid AND M.Major = 'Math') -- join books, buys, and student
