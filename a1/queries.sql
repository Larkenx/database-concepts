DROP TABLE reservations;
DROP TABLE sailors;
DROP TABLE boats;

-- 1.
CREATE TABLE sailors (
    sid integer primary key,
    sname varchar(20),
    rating integer,
    age integer
);
DROP TABLE reservations;
DROP TABLE sailors;
DROP TABLE boats;

-- 1.
CREATE TABLE sailors (
    sid integer primary key,
    sname varchar(20),
    rating integer,
    age integer
);

CREATE TABLE boats (
    bid integer primary key,
    bname varchar(15),
    color varchar(15)
);

CREATE TABLE reservations (
    sid integer references sailors(sid),
    bid integer references boats(bid),
    day varchar(10),
    PRIMARY KEY (sid, bid)
);

-- 2.

INSERT INTO boats VALUES
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');


INSERT INTO sailors VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55),
(32, 'Andy', 8, 25),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25),
(95, 'Bob', 3, 63);


INSERT INTO reservations VALUES
(22,101,'Monday'),
(22,102,'Tuesday'),
(22,103,'Wednesday'),
(31,102,'Thursday'),
(31,103,'Friday'),
(31,104,'Saturday'),
(64,101,'Sunday'),
(64,102,'Monday'),
(74,103,'Tuesday');



-- INSERT into reservations values(57, 57, 'Monday'); -- this fails because foreign keys 57 & 57 don't exist
-- DELETE from sailors where sid=22; -- this fails because this sailor has a reservation

-- 3.

-- (a)
SELECT
  sid,
  rating
FROM sailors;

-- (b)
SELECT bname
FROM boats
WHERE color = 'red';

-- (c)
SELECT DISTINCT color
FROM boats;

-- (d)
SELECT sname
FROM (
       SELECT
         boats.color,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.sname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE boats.color = 'red'
     ) AS reserves;

-- (e)
SELECT DISTINCT bname
FROM (
       SELECT
         boats.bname,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.age
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE sailors.age > 25
     ) AS reserves;

-- (f)
SELECT DISTINCT sname
FROM (
       SELECT
         boats.color,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.sname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE boats.color != 'red' AND boats.color != 'green'
     ) AS reserves;

-- (g)
-- Find the name of each boat that was reserved by a sailor who has reserved
-- a blue and a green boat.

SELECT DISTINCT bname
FROM reservations
  INNER JOIN boats ON reservations.bid = boats.bid
WHERE reservations.sid IN (
  SELECT reservations.sid
  FROM reservations
    INNER JOIN boats ON reservations.bid = boats.bid
  WHERE boats.color = 'blue' OR boats.color = 'green'
  GROUP BY
    reservations.sid
  HAVING count(reservations.sid) >= 2
);

-- (h)
SELECT bid
FROM boats
WHERE bid NOT IN (
  SELECT DISTINCT bid
  FROM reservations
);

-- (i)
SELECT DISTINCT bname
FROM (
       SELECT
         boats.bname,
         reservations.sid,
         sailors.sid
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE sailors.sid IN (
         SELECT reservations.sid
         FROM
           reservations
         GROUP BY
           reservations.sid
         HAVING
           COUNT(reservations.sid) >= 2
       )
     ) AS reserves;

-- (j)
SELECT sid
FROM
  reservations
GROUP BY
  sid
HAVING
  COUNT(sid) = 1;

CREATE TABLE boats (
    bid integer primary key,
    bname varchar(15),
    color varchar(15)
);

CREATE TABLE reservations (
    sid integer references sailors(sid),
    bid integer references boats(bid),
    day varchar(10),
    PRIMARY KEY (sid, bid)
);

-- 2.

INSERT INTO boats VALUES
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');


INSERT INTO sailors VALUES
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55),
(32, 'Andy', 8, 25),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25),
(95, 'Bob', 3, 63);


INSERT INTO reservations VALUES
(22,101,'Monday'),
(22,102,'Tuesday'),
(22,103,'Wednesday'),
(31,102,'Thursday'),
(31,103,'Friday'),
(31,104,'Saturday'),
(64,101,'Sunday'),
(64,102,'Monday'),
(74,103,'Tuesday');



-- INSERT into reservations values(57, 57, 'Monday'); -- this fails because foreign keys 57 & 57 don't exist
-- DELETE from sailors where sid=22; -- this fails because this sailor has a reservation

-- 3.

-- (a)
SELECT
  sid,
  rating
FROM sailors;

-- (b)
SELECT bname
FROM boats
WHERE color = 'red';

-- (c)
SELECT DISTINCT color
FROM boats;

-- (d)
SELECT sname
FROM (
       SELECT
         boats.color,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.sname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE boats.color = 'red'
     ) AS reserves;

-- (e)
SELECT DISTINCT bname
FROM (
       SELECT
         boats.bname,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.age
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE sailors.age > 25
     ) AS reserves;

-- (f)
SELECT DISTINCT sname
FROM (
       SELECT
         boats.color,
         boats.bid,
         reservations.sid,
         sailors.sid,
         sailors.sname
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE boats.color != 'red' AND boats.color != 'green'
     ) AS reserves;

-- (g)
-- Find the name of each boat that was reserved by a sailor who has reserved
-- a blue and a green boat.

SELECT DISTINCT bname
FROM reservations
  INNER JOIN boats ON reservations.bid = boats.bid
WHERE reservations.sid IN (
  SELECT reservations.sid
  FROM reservations
    INNER JOIN boats ON reservations.bid = boats.bid
  WHERE boats.color = 'blue' OR boats.color = 'green'
  GROUP BY
    reservations.sid
  HAVING count(reservations.sid) >= 2
);

-- (h)
SELECT bid
FROM boats
WHERE bid NOT IN (
  SELECT DISTINCT bid
  FROM reservations
);

-- (i)
SELECT DISTINCT bname
FROM (
       SELECT
         boats.bname,
         reservations.sid,
         sailors.sid
       FROM boats
         INNER JOIN reservations ON reservations.bid = boats.bid
         INNER JOIN sailors ON reservations.sid = sailors.sid
       WHERE sailors.sid IN (
         SELECT reservations.sid
         FROM
           reservations
         GROUP BY
           reservations.sid
         HAVING
           COUNT(reservations.sid) >= 2
       )
     ) AS reserves;

-- (j)
SELECT sid
FROM
  reservations
GROUP BY
  sid
HAVING
  COUNT(sid) = 1;
