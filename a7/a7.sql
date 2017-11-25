DROP TABLE Graph;
CREATE TABLE Graph (
  Source INTEGER,
  Target INTEGER
);
INSERT INTO GRAPH VALUES
  (1, 2),
  (1, 3),
  (2, 3),
  (3, 4),
  (4, 1);

CREATE OR REPLACE FUNCTION get_nodes()
  RETURNS ANYARRAY AS
$$
WITH src AS (SELECT source
             FROM graph),
    tgt AS (SELECT target
            FROM graph)
SELECT array((SELECT *
              FROM src)
             UNION
             (SELECT *
              FROM tgt))
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION get_edges(node INTEGER)
  RETURNS INTEGER [] AS
$$
SELECT array(SELECT target
             FROM graph
             WHERE source = node)
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION articulation_points()
  RETURNS BOOLEAN AS
$$

$$ LANGUAGE plpgsql;

SELECT get_edges(1);


CREATE TABLE A (
  n INTEGER
);
INSERT INTO A VALUES
  (1),
  (2),
  (3);

CREATE OR REPLACE FUNCTION powerset(INTEGER [])
  RETURNS TABLE(subset INTEGER []) AS $$
DECLARE i   INTEGER := 0;
        j   INTEGER := 0;
        v   INTEGER;
        val INTEGER;
        arr INTEGER [];
        ps  INTEGER [] [];
        tmp INTEGER [] [];
BEGIN
  ps  := '{ {} }';
  DROP TABLE IF EXISTS powersetA;
  CREATE TABLE powersetA (
    subset INTEGER []
  );

  -- for every item in our array
  FOREACH val IN ARRAY $1
  LOOP
    RAISE NOTICE 'working with val: (%)', (val);
    tmp := '{}';

    -- for every powerset we've already added to the powerset
    for i in 0..array_length(ps, 1)
    LOOP
      RAISE NOTICE 'Entering FOR loop through arrays in powerset';
      RAISE NOTICE 'Array length of PS is %', array_length(ps, 1);
--       RAISE NOTICE '{';
--       FOREACH v IN ARRAY arr
--       LOOP
--         RAISE NOTICE '%',  v;
--       END LOOP;
--       RAISE NOTICE '}';

      tmp := array_append(tmp, ps[i]);
      tmp := array_append(tmp, array_append(ps[i], val));
    END LOOP;
    ps := tmp;

  END LOOP;

  FOREACH arr IN ARRAY ps
  LOOP
    RAISE NOTICE 'array value: (%)', (arr);
    INSERT INTO powersetA VALUES (arr);
  END LOOP;

  RETURN QUERY (SELECT *
                FROM powersetA);

END;
$$ LANGUAGE plpgsql;

SELECT powerset('{1,2,3}');

SELECT *
FROM powersetA;


create table test (
  mdarr integer[][]
);

insert into test values ('{{1,2,3}}')

select array_length(mdarr, 1) from test;
