DROP TABLE E;
CREATE TABLE E (
  Source INTEGER,
  Target INTEGER
);
INSERT INTO E VALUES
  (1, 2),
  (2, 1),
  (1, 3),
  (3, 1);

DROP TABLE AC;
CREATE TABLE AC (
  vertex INTEGER
);
DROP TABLE E_COPY;
CREATE TABLE E_COPY (
  source INTEGER,
  target INTEGER
);

-- Transitive Closure function from the lectures

CREATE OR REPLACE FUNCTION new_TC_pairs()
  RETURNS TABLE(source INTEGER, target INTEGER) AS
$$
(SELECT
   TC.source,
   E_COPY.target
 FROM TC, E_COPY
 WHERE TC.target = E_COPY.source)
EXCEPT
(SELECT
   source,
   target
 FROM TC);
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION Transitive_Closure()
  RETURNS VOID AS $$
BEGIN
  DROP TABLE IF EXISTS TC;
  CREATE TABLE TC (
    source INTEGER,
    target INTEGER
  );
  INSERT INTO TC SELECT *
                 FROM E_COPY;
  WHILE exists(SELECT *
               FROM new_TC_pairs())
  LOOP
    INSERT INTO TC SELECT *
                   FROM new_TC_pairs();
  END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_not_connected()
  RETURNS BOOLEAN AS $$
-- i want to take all of the possible vertices from the graph E, and
-- create a cartesian product of edges (u,v) such that i have all of the vertices
-- then, create a transitive closure of E and subtract it from the cartesian product.
-- if any nodes are left over, then the graph E is *not* connected because the transitive closure
-- must contain all pairs (u,v) in order for a graph to be strongly connected.
SELECT EXISTS(
    SELECT DISTINCT
      E1.source,
      E2.target
    FROM E_COPY E1, E_COPY E2
    EXCEPT
    SELECT
      TC.source,
      TC.target
    FROM TC
);
$$ LANGUAGE SQL;

SELECT Transitive_Closure();

SELECT is_not_connected();


-- PLAN FOR ARTICULATION POINTS:
-- *Adapt transitive closure functions to work on E_COPY table created in articulation points
-- LOOP through all vertices. For each vertex:
-- Remove all edges associated with it from G.
-- If G is still connected, then the vertex is not an articulation point.
-- If G is not connected, then the vertex is an articulation point. Put it in the list of articulation points
CREATE OR REPLACE FUNCTION articulation_points()
  RETURNS VOID AS $$
DECLARE vertex        INTEGER := NULL;
        not_connected BOOLEAN := FALSE;
BEGIN
  FOR vertex IN SELECT DISTINCT source FROM E
  LOOP
    TRUNCATE TABLE E_COPY;
    INSERT INTO E_COPY SELECT *
                       FROM E
                       WHERE E.source <> vertex AND E.target <> vertex;
    -- now we need to update our transitive closure, but we just need this to be a side-effect
    PERFORM Transitive_Closure();
    -- if removing the vertex and its edges from E cause it to be disconnected, then
    -- it is an articulation point
    IF (select is_not_connected())
    THEN
      INSERT INTO AC VALUES (vertex);
    END IF;
  END LOOP;
END
$$ LANGUAGE plpgsql;

select * from TC;
SELECT articulation_points();

select * from AC;


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
    FOR i IN 0..array_length(ps, 1)
    LOOP
      RAISE NOTICE 'Entering FOR loop through arrays in powerset';
      RAISE NOTICE 'Array length of PS is %', array_length(ps, 1);
      --       RAISE NOTICE '{';
      --       FOREACH v IN ARRAY arr
      --       LOOP
      --         RAISE NOTICE '%',  v;
      --       END LOOP;
      --       RAISE NOTICE '}';

      tmp := array_append(tmp, ps [i]);
      tmp := array_append(tmp, array_append(ps [i], val));
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


CREATE TABLE test (
  mdarr INTEGER [] []
);

INSERT INTO test VALUES ('{{1,2,3}}')

SELECT array_length(mdarr, 1)
FROM test;
