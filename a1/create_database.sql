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
    day varchar(10)
);
