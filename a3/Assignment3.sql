-- Data for polynomials
DELETE FROM p;
DELETE FROM q;

-- create table p (coefficient bigint, degree bigint);
-- create table q (coefficient bigint, degree bigint);

INSERT INTO p VALUES (2, 2), (-5, 1), (5, 0);
INSERT INTO q VALUES (3, 3), (1, 2), (-1, 1);

-- Data for point
DELETE FROM point;

INSERT INTO POINT VALUES (1, 0, 0);
INSERT INTO POINT VALUES (2, 0, 1);
INSERT INTO POINT VALUES (3, 1, 0);
INSERT INTO POINT VALUES (4, 0, 2);
INSERT INTO POINT VALUES (5, 1, 1);
INSERT INTO POINT VALUES (6, 2, 2);

-- Data for queries
DELETE FROM cites;
DELETE FROM buys;
DELETE FROM major;
DELETE FROM book;
DELETE FROM student;

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
INSERT INTO student VALUES (1021, 'Vince');
INSERT INTO student VALUES (1022, 'Joeri');

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
INSERT INTO book VALUES (2014, 'Topology', 70);

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
INSERT INTO buys VALUES (1020, 2001);
INSERT INTO buys VALUES (1020, 2012);
INSERT INTO buys VALUES (1022, 2014);

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
INSERT INTO major VALUES (1022, 'CS');


\echo "Problem 1"
-- (1)
DROP TABLE A;
DROP TABLE B;
DROP TABLE C;

CREATE TABLE A
(
  a INTEGER PRIMARY KEY
);

CREATE TABLE B
(
  b INTEGER PRIMARY KEY
);

CREATE TABLE C
(
  c INTEGER PRIMARY KEY
);

INSERT INTO A VALUES (1);
-- INSERT INTO A VALUES (2);
INSERT INTO A VALUES (3);
INSERT INTO A VALUES (4);
INSERT INTO B VALUES (1);

INSERT INTO B VALUES (3);
INSERT INTO B VALUES (4);
INSERT INTO B VALUES (5);

INSERT INTO C VALUES (1);
INSERT INTO C VALUES (3);
-- A = {1,2,3,4}
-- B = {3,4}
-- C = {1}

\echo "1.a)"
-- (a)
SELECT
  NOT EXISTS((SELECT *
              FROM A) EXCEPT (SELECT *
                              FROM B))    AS empty_a_minus_b,
  NOT EXISTS((SELECT *
              FROM B) EXCEPT (SELECT *
                              FROM A))    AS empty_b_minus_a,
  NOT EXISTS((SELECT *
              FROM B) INTERSECT (SELECT *
                                 FROM A)) AS empty_a_intersect_b;
\echo "1.b)"
-- (1)
-- (b)
SELECT
  NOT EXISTS(SELECT a
             FROM A
             WHERE a NOT IN (SELECT b
                             FROM B)) AS empty_a_minus_b,
  NOT EXISTS(SELECT b
             FROM B
             WHERE b NOT IN (SELECT a
                             FROM A)) AS empty_b_minus_a,
  NOT EXISTS(SELECT a
             FROM A
             WHERE a IN (SELECT b
                         FROM B))     AS empty_a_intersect_b;

\echo "Problem 2"
-- (2)
\echo "2.a"

-- (a) (10 points) Determine whether or not A ∩ B ̸= {}.
SELECT EXISTS(SELECT *
              FROM A INTERSECT SELECT *
                               FROM B) AS answer;
SELECT EXISTS(SELECT a
              FROM A
              WHERE a NOT IN (SELECT b
                              FROM B)) AS answer;

\echo "2.b"
-- (b) (10 points) Determine whether or not A ∩ B = {}.
SELECT NOT EXISTS(SELECT a
                  FROM A INTERSECT SELECT b
                                   FROM B) AS a_intersect_b_is_empty;

SELECT NOT EXISTS(SELECT a
                  FROM A
                  WHERE A IN (SELECT b
                              FROM B)) AS a_intersect_b_is_empty;

\echo "2.c"
-- (c) (10 points) Determine whether or not A ⊆ B.
SELECT NOT EXISTS(SELECT *
                  FROM A EXCEPT SELECT *
                                FROM B) AS a_is_subset_of_b;

SELECT NOT EXISTS(SELECT a
                  FROM A
                  WHERE a NOT IN (SELECT b
                                  FROM B)) AS a_is_subset_of_b;

\echo "2.d"
-- (d) (10 points) Determine whether or not A ̸⊇ B.

SELECT EXISTS(SELECT b
              FROM B
              EXCEPT SELECT a
                     FROM A) AS b_not_subset_of_a;

SELECT EXISTS(SELECT b -- there's at least something from b not in A
              FROM B
              WHERE b NOT IN (SELECT a
                              FROM A)) AS b_not_subset_of_a;

\echo "2.e"
-- (e) (10 points) Determine whether or not A ̸= B.
SELECT exists(SELECT a -- there's at least one thing in A that's not in B
              FROM A EXCEPT (SELECT b
                              FROM B)) OR
       exists(SELECT b -- at least one thing that's not in A that is in B
              FROM B EXCEPT (SELECT a
                              FROM A)) AS not_equal;


SELECT exists(SELECT a -- there's at least one thing in A that's not in B
              FROM A
              WHERE a NOT IN (SELECT b
                              FROM B)) OR
       exists(SELECT b -- at least one thing that's not in A that is in B
              FROM B
              WHERE b NOT IN (SELECT a
                              FROM A)) AS not_equal;

\echo "2.f"
-- (f) (10 points) Determine whether or not |A − B| < 2.

-- determining whether or not |A-B| = 1 or 0
SELECT exists(SELECT a -- all of |A-B| is equal to one of a, so there is exactly one member
              FROM A
              WHERE a = ALL ((SELECT *
                              FROM A) EXCEPT (SELECT *
                                              FROM B)))
       OR NOT exists(SELECT * -- or there are no members at all from A-B
                     FROM A EXCEPT SELECT *
                                   FROM B) AS no_more_than_one;

-- determining whether or not |A-B| = 1 or 0
SELECT exists(SELECT a
              FROM A
              WHERE a = ALL ((SELECT a
                              FROM A
                              WHERE a NOT IN (SELECT *
                                              FROM B)))
                    OR NOT exists(SELECT a
                                  FROM A
                                  WHERE a NOT IN (SELECT *
                                                  FROM B))) AS no_more_than_one;

\echo "2.g"
-- (g) (10 points) Determine whether or not (A ∩ B) ̸⊇ C.
SELECT exists(
           SELECT *
           FROM C
           EXCEPT -- is there a member of c not in A intersect b? if so, not a subset
           ((SELECT *
             FROM A)
            INTERSECT
            (SELECT *
             FROM B))
       ) AS c_is_not_subset_of_a_intersect_b;

SELECT exists(
           SELECT c
           FROM C
           WHERE c NOT IN -- is there a member of c not in A intersect b? if so, not a subset
                 ((SELECT a
                   FROM A
                   WHERE a IN
                         (SELECT *
                          FROM B)))
       ) AS c_is_not_subset_of_a_intersect_b;

\echo "2.h"
-- (10 points) Determine whether or not |A ∩ (B ∪ C)| = 2.
DROP FUNCTION a_intersect_b_union_c();
CREATE FUNCTION a_intersect_b_union_c()
  RETURNS TABLE(result INT) AS $$
SELECT *
FROM A
INTERSECT
(SELECT *
 FROM B
 UNION
 SELECT *
 FROM C)
$$ LANGUAGE SQL;

SELECT a_intersect_b_union_c();

-- SELECT r1.result
-- FROM a_intersect_b_union_c() r1
-- WHERE r1.result < ALL (SELECT a_intersect_b_union_c()) AND
--       exists(SELECT r2.result
--              FROM a_intersect_b_union_c() r2
--              WHERE r2.result <> r1.result AND r2.result > ALL (SELECT));


\echo "3.a"

-- INSERT INTO p VALUES (2, 2), (-5, 1), (5, 0);
-- INSERT INTO q VALUES (3, 3), (1, 2), (-1, 1);

-- 2x^2 -5x + 5
-- 3x^3 + 1x^2 - 1x

-- (a)
SELECT
  coefficient,
  degree
FROM
  (((SELECT * -- give me all p and q coefficients & degrees
     FROM p -- except for those that have a coefficient with same degree in both tables
     WHERE p.degree NOT IN (SELECT degree
                            FROM q))
    UNION
    (SELECT *
     FROM q
     WHERE q.degree NOT IN (SELECT degree
                            FROM p)))
   -- for those with the same degree, we add the coefficients together
   UNION
   SELECT
     p.coefficient + q.coefficient,
     p.degree
   FROM
     p, q
   WHERE p.degree = q.degree) AS result;


\echo "3.b"
-- (b)

SELECT
  sum(coefficient),
  degree -- sum all the coefficients where their degree is equal
FROM
  -- cartesian product of all tuples from p against q, mult the coeffs, add degrees
  (SELECT
     p.coefficient * q.coefficient AS coefficient,
     p.degree + q.degree           AS degree
   FROM p, q) AS cart_p
GROUP BY
  degree;

\echo "4.a"

-- (a) (10 points) Write a SQL query that returns the (p1, p2) pairs of
-- different pids of points that are closest in distance
-- from each other. Recall that if p1 = (x1, y1) and p2(x2, y2) are two points in the plane,
-- then the distance between them is given by the formula
DROP FUNCTION distance(IN x1 INT, IN y1 INT, IN x2 INT, IN y2 INT);
CREATE FUNCTION distance(IN x1 INT, IN y1 INT, IN x2 INT, IN y2 INT)
  RETURNS DOUBLE PRECISION AS $$
SELECT sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
$$ LANGUAGE SQL;

SELECT
  p1.pid,
  p2.pid
FROM point p1, point p2
WHERE p1.pid <> p2.pid
      AND distance(p1.x, p1.y, p2.x, p2.y) <= ALL (SELECT distance(q1.x, q1.y, q2.x, q2.y)
                                                   FROM point q1, point q2
                                                   WHERE q1.pid <> q2.pid);

\echo "4.b"
-- three points are collinear iff the area formed by their triangle is zero
SELECT
  p1.pid,
  p2.pid,
  p3.pid
FROM point p1, point p2, point p3
WHERE
  p1.pid <> p2.pid AND p2.pid <> p3.pid AND p3.pid <> p1.pid AND
  p1.x * (p2.y - p3.y) + p2.x * (p3.y - p1.y) + p3.x * (p1.y - p2.y) = 0;


\echo "5.a"
DROP FUNCTION booksBoughtbyStudent( INPUT INT, OUT bookno INT, OUT title VARCHAR(30), OUT price INTEGER );
CREATE FUNCTION booksBoughtbyStudent(input INT)
  RETURNS TABLE(bookno INT, title VARCHAR(30), price INT) AS $$
SELECT
  book.bid,
  book.title,
  book.price
FROM buys t, book
WHERE t.sid = input AND book.bid = t.bid
$$ LANGUAGE SQL;

\echo "5.b"
SELECT
  bookno,
  title,
  price
FROM
    booksBoughtbyStudent(1001);
SELECT
  bookno,
  title,
  price
FROM
    booksBoughtbyStudent(1015);
\echo "5.c"
\echo "5.c.i"
-- i. (10 points) “Find the sids and names of students
-- who bought exactly one book that cost less than $50.”

SELECT
  s.sid,
  s.sname
FROM student s
WHERE
  -- books costing less than 50 purchased by student
  EXISTS(SELECT bookno
         FROM (SELECT bookno
               FROM booksBoughtbyStudent(s.sid)
               WHERE price < 50) AS less_than_50
         WHERE bookno = ALL ((SELECT bookno
                              FROM booksBoughtbyStudent(s.sid)
                              WHERE price < 50)));

\echo "5.c.ii"
SELECT s.sid
FROM student s, major m
WHERE m.sid = s.sid AND m.major = 'CS' AND
      NOT EXISTS(SELECT bookno
                 FROM booksBoughtbyStudent(s.sid)
                 INTERSECT
                 -- books bought by math students
                 SELECT bid
                 FROM buys
                 WHERE sid IN (SELECT sid
                               FROM major
                               WHERE major = 'Math'));

\echo "5.c.iii"
SELECT DISTINCT
  s1.sid,
  s2.sid
FROM student s1, student s2
WHERE s1.sid <> s2.sid AND
      NOT exists(SELECT bookno
                 FROM booksBoughtbyStudent(s1.sid)
                 EXCEPT
                 SELECT bookno
                 FROM booksBoughtbyStudent(s2.sid))
      AND NOT exists(SELECT bookno
                     FROM booksBoughtbyStudent(s2.sid)
                     EXCEPT
                     SELECT bookno
                     FROM booksBoughtbyStudent(s1.sid));

\echo "6.a"
DROP FUNCTION studentWhoBoughtBook(bookno INT, OUT student SID, OUT sname VARCHAR(15) );
CREATE FUNCTION studentWhoBoughtBook(bookno INT)
  RETURNS TABLE(sid INT, sname VARCHAR(30)) AS $$
SELECT
  s.sid,
  s.sname
FROM buys t, student s
WHERE t.sid = s.sid AND t.bid = bookno
$$ LANGUAGE SQL;

\echo "6.b"
SELECT *
FROM studentWhoBoughtBook(2001);
SELECT *
FROM studentWhoBoughtBook(2010);

\echo "6.c"
SELECT DISTINCT bid
FROM buys
WHERE exists(
    SELECT
      -- there are at least different two CS students who bought the same book
      s1.sid,
      s2.sid
    FROM studentWhoBoughtBook(bid) AS s1, studentWhoBoughtBook(bid) AS s2
    WHERE s1.sid <> s2.sid -- and those students bought at least one book costing more than $30
          AND s1.sid IN (SELECT sid
                         FROM major
                         WHERE major = 'CS')
          AND s2.sid IN (SELECT sid
                         FROM major
                         WHERE major = 'CS')
          AND exists(SELECT price
                     FROM booksBoughtbyStudent(s1.sid)
                     WHERE price > 30)
          AND exists(SELECT price
                     FROM booksBoughtbyStudent(s2.sid)
                     WHERE price > 30)
);

\echo "7.a"
DROP FUNCTION numberOfBooksBoughtByStudent( INPUT INT );
CREATE FUNCTION numberOfBooksBoughtByStudent(input INT)
  RETURNS BIGINT AS $$
SELECT count(bid)
FROM buys
WHERE buys.sid = input
$$ LANGUAGE SQL;

SELECT numberOfBooksBoughtByStudent(1012);
-- select * from buys where sid=1001;
SELECT numberOfBooksBoughtByStudent(1001);

\echo "7.b.i"
SELECT
  s.sid,
  numberOfBooksBoughtByStudent(s.sid)
FROM student s, major m
WHERE s.sid = m.sid
      AND m.major = 'CS'
      AND 2 < numberOfBooksBoughtByStudent(s.sid);

\echo "7.b.ii"
-- * NOTE - the assignment states we are finding students who bought
-- fewer books than the number of books bought by student who major in CS. The solution given in the output
-- appears to make use of a '<=' symbol instead giving students who bought fewer or the same number of books as a student majoring in CS,
-- so my solution returns one less row than the expected output given.
SELECT sid
FROM student -- our student bought strictly fewer books than at least one CS student
WHERE numberOfBooksBoughtByStudent(sid) < SOME
      (SELECT numberOfBooksBoughtByStudent(s.sid) -- book purchase counts for CS students
       FROM student s, major m
       WHERE s.sid = m.sid
             AND m.major = 'CS');


\echo "7.b.iii"
SELECT DISTINCT
  s1.sid,
  s2.sid
FROM student s1, student s2
WHERE numberOfBooksBoughtByStudent(s1.sid) = numberOfBooksBoughtByStudent(s2.sid)
      AND s1.sid <> s2.sid;

\echo "8.a"
SELECT
  student.sid,
  numberOfBooksBoughtByStudent(student.sid)
FROM student
WHERE (SELECT sum(price) -- we want total sums of books less than 300
       FROM booksBoughtbyStudent(student.sid)) < 300 OR
      NOT exists(SELECT * -- or the student didn't purchase any books
                 FROM booksBoughtbyStudent(student.sid));

\echo "8.b"
-- takes a bookno and determines how many books are citing that book
CREATE FUNCTION numberOfBooksCiting(input INT)
  RETURNS BIGINT AS $$
SELECT count(bid)
FROM Cites
WHERE CitedBid = input
$$ LANGUAGE SQL;

-- takes a bookno and determines how many books it cites
CREATE FUNCTION numberOfBooksCited(input INT)
  RETURNS BIGINT AS $$
SELECT count(CitedBid)
FROM cites
WHERE bid = input
$$ LANGUAGE SQL;

SELECT bid
FROM book
WHERE numberOfBooksCiting(bid) < 5 AND
      numberOfBooksCited(bid) >= 2;

\echo "8.c"
SELECT
  bid,
  title
FROM book
WHERE price = (SELECT min(price)
               FROM book);

\echo "8.d"
DROP FUNCTION cheapestPurchasedBook(sid INT );
CREATE FUNCTION cheapestPurchasedBook(sid INT)
  RETURNS TABLE(bid INT) AS $$
SELECT
  bid
FROM book
WHERE price = (SELECT min(price)
               FROM booksBoughtbyStudent(sid)) AND
      bid IN (SELECT bookno
              FROM booksBoughtByStudent(sid));
$$ LANGUAGE SQL;

SELECT DISTINCT
  sid,
  cheapestPurchasedBook(sid) as bid
FROM Student;

\echo "8.e"
DROP FUNCTION aggregateDepartmentCosts(major VARCHAR(30) );
CREATE FUNCTION aggregateDepartmentCosts(input VARCHAR(30))
  RETURNS BIGINT AS $$
SELECT sum(B.price)
FROM buys T, book B
WHERE t.sid IN (SELECT m.sid
                FROM major m
                WHERE m.major = input) AND
      B.bid = T.bid;
$$ LANGUAGE SQL;

SELECT DISTINCT m.major
FROM major m
WHERE -- calculating this department's total cost and seeing if it's the greatest of all of them
  aggregateDepartmentCosts(m.major) >= ALL (SELECT DISTINCT aggregateDepartmentCosts(m.major)
                                            FROM major m);

\echo "8.f"
DROP FUNCTION studentsInMajor(major VARCHAR(30) );
CREATE FUNCTION studentsInMajor(input VARCHAR(30))
  RETURNS TABLE(sid INT) AS $$
SELECT sid
FROM major
WHERE major = input
$$ LANGUAGE SQL;

SELECT DISTINCT bid
FROM buys
WHERE buys.sid IN (SELECT studentsInMajor('Biology'))
      AND buys.bid NOT IN -- find books purchased by ALL biology students
          -- create a cartesian product of all students paired off with all of the books purchased by biology students
          (SELECT bid
           FROM (SELECT
                   s.sid,
                   t.bid
                 FROM student s, buys t
                 WHERE s.sid IN (SELECT studentsInMajor('Biology')) AND t.sid IN (SELECT studentsInMajor('Biology'))
                 EXCEPT -- subtract from the cartesian product the students who actually purchased those books
                 SELECT
                   sid,
                   bid
                 FROM
                   buys) AS the_student_who_didnt_buy_all_the_books); -- you are left with books not purchased by all bio but some

\echo "8.g"
DROP FUNCTION commonBooksBetweenStudents(sid1 INT, sid2 INT );
CREATE FUNCTION commonBooksBetweenStudents(sid1 INT, sid2 INT)
  RETURNS TABLE(bid INT) AS $$
SELECT bookno
FROM booksBoughtbyStudent(sid1)
INTERSECT
SELECT bookno
FROM booksBoughtbyStudent(sid2)
$$ LANGUAGE SQL;

SELECT
  s1.sid,
  s2.sid
FROM student s1, student s2
WHERE s1.sid <> s2.sid AND
      (SELECT count(*)
       FROM commonBooksBetweenStudents(s1.sid, s2.sid)) = 1;

\echo "8.h"
DROP FUNCTION ALLbutK(k INT );
CREATE FUNCTION ALLbutK(k INT)
  RETURNS TABLE(sid1 INT, sid2 INT) AS $$
SELECT
  s1.sid,
  s2.sid
FROM student s1, student s2
WHERE s1.sid <> s2.sid AND
      (SELECT count(*)
       FROM booksBoughtbyStudent(s2.sid)) - (SELECT count(*)
                                             FROM commonBooksBetweenStudents(s1.sid, s2.sid)) = k
-- both are missing exactly k books after intersecting (in common books between them)
--       AND
--   (SELECT count(*)
--        FROM booksBoughtbyStudent(s2.sid)) - (SELECT count(*)
--                                              FROM commonBooksBetweenStudents(s1.sid, s2.sid)) = k;

$$ LANGUAGE SQL;

SELECT
  sid1,
  sid2
FROM ALLbutK(1);
SELECT
  sid1,
  sid2
FROM ALLbutK(5);
SELECT
  sid1,
  sid2
FROM ALLbutK(8);
SELECT
  sid1,
  sid2
FROM ALLbutK(9);
