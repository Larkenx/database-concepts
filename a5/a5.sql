-- CREATE TABLE Student (
--   Sid   INTEGER,
--   Sname VARCHAR(15),
--   PRIMARY KEY (Sid)
-- );
--
-- CREATE TABLE Major (
--   Sid   INTEGER REFERENCES Student (Sid),
--   Major VARCHAR(15)
-- );
--
-- CREATE TABLE Book (
--   Bookno INTEGER,
--   Title  VARCHAR(30),
--   Price  INTEGER,
--   PRIMARY KEY (Bookno)
-- );
--
-- CREATE TABLE Cites (
--   Bookno      INTEGER REFERENCES Book (Bookno),
--   CitedBookno INTEGER REFERENCES Book (Bookno)
-- );
--
-- CREATE TABLE Buys (
--   Sid    INTEGER REFERENCES Student (Sid),
--   Bookno INTEGER REFERENCES Book (Bookno)
-- );

DELETE FROM Cites;
DELETE FROM Major;
DELETE FROM Buys;
DELETE FROM Book;
DELETE FROM Student;

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

CREATE OR REPLACE FUNCTION setunion(A ANYARRAY, B ANYARRAY)
  RETURNS ANYARRAY AS
$$
WITH
    Aset AS (SELECT UNNEST(A)),
    Bset AS (SELECT UNNEST(B))
SELECT array((SELECT *
              FROM Aset)
             UNION (SELECT *
                    FROM Bset)
             ORDER BY 1);
$$ LANGUAGE SQL;

\echo "(a)"

CREATE OR REPLACE FUNCTION setintersection(A ANYARRAY, B ANYARRAY)
  RETURNS ANYARRAY AS
$$
WITH
    Aset AS (SELECT UNNEST(A)),
    Bset AS (SELECT UNNEST(B))
SELECT array((SELECT *
              FROM Aset)
             INTERSECT (SELECT *
                        FROM Bset)
             ORDER BY 1);
$$ LANGUAGE SQL;

\echo "(b)"

CREATE OR REPLACE FUNCTION setdifference(A ANYARRAY, B ANYARRAY)
  RETURNS ANYARRAY AS
$$
WITH
    Aset AS (SELECT UNNEST(A)),
    Bset AS (SELECT UNNEST(B))
SELECT array((SELECT *
              FROM Aset)
             EXCEPT (SELECT *
                     FROM Bset)
             ORDER BY 1);
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION memberof(x ANYELEMENT, S ANYARRAY)
  RETURNS BOOLEAN AS
$$
SELECT x = SOME (S)
$$ LANGUAGE SQL;

\echo "Problem 2"
CREATE OR REPLACE VIEW student_books AS
  SELECT
    s.sid,
    array(SELECT t.bookno
          FROM buys t
          WHERE t.sid = s.sid
          ORDER BY bookno) AS books
  FROM student s
  ORDER BY sid;

SELECT *
FROM student_books;

\echo "(a)"
-- Define a view book students(bookno,students)
-- which associates with each book the set of students who bought that book.
-- Observe that there may be books that are not bought by any student.
CREATE OR REPLACE VIEW book_students AS
  SELECT DISTINCT
    t2.bookno,
    array(SELECT t1.sid
          FROM buys t1
          WHERE t1.bookno = t2.bookno) AS students
  FROM book t2;

-- select * from book_students;

\echo "(b)"
-- Define a view book citedbooks(bookno,citedbooks) which associates with each book the set of books
-- that are cited by that book. Observe that there may be books that cite no books.

CREATE OR REPLACE VIEW citedbooks AS
  SELECT DISTINCT
    b.bookno,
    array(SELECT c.citedbookno
          FROM cites c
          WHERE c.bookno = b.bookno) AS citedbooks
  FROM book b;

SELECT *
FROM citedbooks;

\echo "(c)"
-- Define a view book citingbooks(bookno,citingbooks) which associates with each book the set of
--  books that cites that book. Observe that there may be books that are not cited.

CREATE OR REPLACE VIEW citingbooks AS
  SELECT DISTINCT
    b.bookno,
    array(SELECT c.bookno
          FROM cites c
          WHERE c.citedbookno = b.bookno) AS citingbooks
  FROM book b;

SELECT *
FROM citingbooks;

\echo "(d)"
-- Define a view major students(major,students) which associates with each major the set of
-- students who have that major. (You can assume that each major has at least one student.)
CREATE OR REPLACE VIEW major_students AS
  SELECT DISTINCT
    m.major,
    array(SELECT DISTINCT m2.sid
          FROM major m2
          WHERE m2.major = m.major) AS students
  FROM major m
  ORDER BY m.major;

\echo "(e)"
-- Define a view student majors(sid,majors) which associates with each student the set of his or
-- her majors. Observe that there can be students who have no major.

CREATE OR REPLACE VIEW student_majors AS
  SELECT DISTINCT
    s.sid,
    array(SELECT DISTINCT m2.major
          FROM major m2
          WHERE m2.sid = s.sid) AS majors
  FROM student s
  ORDER BY s.sid;


\echo "Problem 3"
\echo "(a) Find the bookno of each book that is cited by at least two books that cost less than $50."
CREATE OR REPLACE VIEW books_citinglessthan50 AS
  SELECT
    DISTINCT
    b.bookno,
    p.bookno AS citedbookno
  FROM citingbooks b, book p
  WHERE memberof(p.bookno, b.citingbooks) AND p.price < 50;


SELECT bookno
FROM (SELECT
        DISTINCT
        a.bookno,
        array(SELECT b.citedbookno
              FROM books_citinglessthan50 b
              WHERE b.bookno = a.bookno) AS citedbooks
      FROM books_citinglessthan50 a) AS result
WHERE cardinality(citedbooks) >= 2;

\echo "(b) Find the bookno and title of each book that was bought by a student who majors in CS and in Math."
CREATE OR REPLACE VIEW cs_students AS
  SELECT students
  FROM major_students
  WHERE major = 'CS';

CREATE OR REPLACE VIEW math_students AS
  SELECT students
  FROM major_students
  WHERE major = 'Math';

CREATE OR REPLACE VIEW cs_math_students AS
  SELECT setintersection((SELECT *
                          FROM cs_students), (SELECT *
                                              FROM math_students));

SELECT DISTINCT
  b.bookno,
  b.title
FROM book b, student_books s
WHERE memberof(b.bookno, s.books) AND
      memberof(s.sid, (SELECT *
                       FROM cs_math_students))
ORDER BY b.bookno;

\echo "(c) Find the bookno of each book that is cited by exactly one book."
SELECT DISTINCT bookno
FROM citingbooks
WHERE cardinality(citingbooks) = 1
ORDER BY bookno;


CREATE OR REPLACE VIEW cost_book AS
  SELECT DISTINCT
    b.price,
    array(SELECT DISTINCT b2.bookno
          FROM book b2
          WHERE b2.price = b.price) AS books
  FROM book b
  ORDER BY b.price;

CREATE OR REPLACE VIEW books_more_than_50 AS
  SELECT DISTINCT array(SELECT bookno
                        FROM book
                        WHERE price > 50) AS books;

CREATE OR REPLACE VIEW books_less_than_50 AS
  SELECT DISTINCT array(SELECT bookno
                        FROM book
                        WHERE price < 50) AS books;

\echo "(d) Find the sid of each student who bought all books that cost more than $50."
SELECT DISTINCT s.sid
FROM student_books s
WHERE s.books <@ (SELECT *
                  FROM books_more_than_50)
      AND (SELECT *
           FROM books_more_than_50) <@ s.books;

\echo "(e) Find the sid of each student who bought no book that cost more than $50."
SELECT DISTINCT s.sid
FROM student_books s
WHERE NOT s.books && (SELECT *
                      FROM books_more_than_50);

\echo "(f) Find the sid of each student who bought only books that cost more than $50."
SELECT DISTINCT s.sid
FROM student_books s
WHERE s.books <@ (SELECT *
                  FROM books_more_than_50);

\echo "(g) Find the sid of each students who bought exactly one book that cost less than $50."
SELECT DISTINCT s.sid
FROM student_books s
WHERE cardinality(setintersection(s.books, (SELECT *
                                            FROM books_less_than_50))) = 1;

\echo "(h) Find the bookno of each book that was not bought by any students who majors in CS."
SELECT bookno
FROM book_students
WHERE NOT students && (SELECT *
                       FROM cs_students);

\echo "(i) Find the Bookno of each book that was not bought by all students who majors in Anthropology."
CREATE OR REPLACE VIEW anthropology_students AS
  SELECT students
  FROM major_students
  WHERE major = 'Anthropology';

-- this works somehow
-- checking to see if each singleton set of book does not exist in atleast one of the sets of books purchased by anthro students
SELECT c.bookno
FROM book c
WHERE NOT array(SELECT b.bookno
                FROM book b
                WHERE b.bookno = c.bookno) <@ ALL (SELECT books
                                                   FROM student_books
                                                   WHERE memberof(sid, (SELECT *
                                                                        FROM
                                                                          anthropology_students)));

\echo "(j) Find sid-bookno pairs (s, b) such that not all books bought by student s are books that cite book b."
SELECT DISTINCT
  s.sid,
  b.bookno
FROM student_books s, citingbooks b
WHERE cardinality(s.books) <> cardinality(setintersection(b.citingbooks, s.books));

\echo "(k) Find sid-bookno pairs (s,b) such student s only bought books that cite book b."
SELECT DISTINCT
  s.sid,
  b.bookno
FROM student_books s, citingbooks b
WHERE cardinality(s.books) = cardinality(setintersection(b.citingbooks, s.books));

\echo "(l) Find the pairs (s1,s2) of different sids of students that buy the same books."
SELECT DISTINCT
  s1.sid,
  s2.sid
FROM student_books s1, student_books s2
WHERE s1.sid <> s2.sid AND s1.books <@ s2.books AND s1.books @> s2.books;

\echo "(m) Find the pairs (s1,s2) of different sids of students that buy the same number of books."
SELECT DISTINCT
  s1.sid,
  s2.sid
FROM student_books s1, student_books s2
WHERE s1.sid <> s2.sid AND cardinality(s1.books) = cardinality(s2.books);

\echo "(n) Find the bookno of each book that cites all but two books. (In other words, for such a book, there exists only two books that it does not cite.)"
CREATE OR REPLACE VIEW all_books AS
  SELECT array(SELECT bookno
               FROM book);

SELECT c.bookno
FROM citedbooks c
WHERE (cardinality((SELECT *
                    FROM all_books)) - 2) = cardinality(c.citedbooks)
