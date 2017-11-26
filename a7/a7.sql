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


CREATE OR REPLACE FUNCTION test()
  RETURNS VOID AS $$
BEGIN
  TRUNCATE TABLE AC;
  TRUNCATE TABLE E_COPY;
  INSERT INTO e_Copy SELECT *
                     FROM e
                     WHERE e.source <> 1 AND e.target <> 1;
  INSERT INTO e_copy VALUES (2, 2), (3, 3);
  PERFORM Transitive_Closure();
  IF (SELECT EXISTS(
      SELECT DISTINCT
        E1.source,
        E2.target
      FROM E_COPY E1, E_COPY E2
      EXCEPT
      SELECT
        TC.source,
        TC.target
      FROM TC
  ))
  THEN
    INSERT INTO AC VALUES (1);
  END IF;
END
$$ LANGUAGE PLPGSQL;

SELECT test();
-- Problem 1
SELECT *
FROM ac;
-- PLAN FOR ARTICULATION POINTS:
-- *Adapt transitive closure functions to work on E_COPY table created in articulation points
-- LOOP through all vertices. For each vertex:
-- Remove all edges associated with it from G.
-- If G is still connected, then the vertex is not an articulation point.
-- If G is not connected, then the vertex is an articulation point. Put it in the list of articulation points
CREATE OR REPLACE FUNCTION articulation_points()
  RETURNS VOID AS $$
DECLARE vertex  INTEGER := NULL;
        vertex2 INTEGER := NULL;
BEGIN
  TRUNCATE TABLE AC;
  FOR vertex IN (SELECT DISTINCT source
                 FROM E)
  LOOP
    TRUNCATE TABLE E_COPY;
    INSERT INTO E_COPY SELECT *
                       FROM E
                       WHERE E.source <> vertex AND E.target <> vertex;
    --- I want to put self-referential edges into the copy of the graph because
    -- the transitive closure includes self-referential points as well. If there is a graph like
    -- (1,1) and (2,2), then we have two connected components (the graph isn't connected).
    FOR vertex2 IN (SELECT DISTINCT source
                    FROM E_COPY)
    LOOP
      INSERT INTO E_COPY VALUES (vertex2, vertex2);
    END LOOP;
    -- now we need to update our transitive closure, but we just need this to be a side-effect
    PERFORM Transitive_Closure();
    -- if removing the vertex and its edges from E cause it to be disconnected, then
    -- it is an articulation point
    IF (SELECT EXISTS(
        SELECT DISTINCT
          E1.source,
          E2.target
        FROM E_COPY E1, E_COPY E2
        EXCEPT
        SELECT
          TC.source,
          TC.target
        FROM TC
    ))
    THEN
      INSERT INTO AC VALUES (vertex);
    END IF;
  END LOOP;
END
$$ LANGUAGE plpgsql;

SELECT articulation_points();
SELECT *
FROM AC;

-- Problem 2
DROP TABLE IF EXISTS PC;
CREATE TABLE PC (
  p INTEGER,
  c INTEGER
);
-- values from the expected output
INSERT INTO PC VALUES
  (1, 2),
  (1, 3),
  (2, 4),
  (3, 6),
  (6, 8),
  (1, 5),
  (5, 9);

-- Ancestor relationships from lecture

CREATE OR REPLACE FUNCTION new_ANC_pairs()
  RETURNS TABLE(A INTEGER, D INTEGER) AS
$$
(SELECT
   A,
   C
 FROM ANC, PC
 WHERE D = P)
EXCEPT
(SELECT
   A,
   D
 FROM ANC);
$$ LANGUAGE SQL;
CREATE OR REPLACE FUNCTION Ancestor_Descendant()
  RETURNS TABLE(person INTEGER, descendant INTEGER) AS $$
BEGIN
  DROP TABLE IF EXISTS ANC;
  CREATE TABLE ANC (
    A INTEGER,
    D INTEGER
  );
  INSERT INTO ANC SELECT *
                  FROM PC;
  WHILE exists(SELECT *
               FROM new_ANC_pairs())
  LOOP
    INSERT INTO ANC SELECT *
                    FROM new_ANC_pairs();
  END LOOP;

  RETURN QUERY (SELECT *
                FROM ANC);
END;
$$ LANGUAGE plpgsql;


-- produces a relation of (person, generation) where the generation is the person's depth in the family tree
CREATE OR REPLACE FUNCTION generations()
  RETURNS TABLE(person INTEGER, generation INTEGER) AS $$
DECLARE p     INTEGER; -- current person we want to calculate generation
        depth INTEGER;
BEGIN
  DROP TABLE IF EXISTS generations;
  CREATE TABLE generations (
    person     INTEGER,
    generation INTEGER
  );

  -- for each person, their depth is the number of times they appear as a descendant in the ANC relation
  FOR p IN ((SELECT DISTINCT pc.p
             FROM pc)
            UNION (SELECT DISTINCT pc.c
                   FROM pc)) -- all persons
  LOOP
    depth := (SELECT count(anc.d)
              FROM ANC
              WHERE anc.d = p);
    INSERT INTO generations VALUES (p, depth);
  END LOOP;

  RETURN QUERY (SELECT *
                FROM generations);
END;
$$ LANGUAGE PLPGSQL;

SELECT *
FROM generations();

CREATE OR REPLACE FUNCTION same_gen_pairs()
  RETURNS TABLE(id1 INTEGER, id2 INTEGER) AS $$
SELECT
  g1.person,
  g2.person
FROM generations g1, generations g2
WHERE g1.generation = g2.generation
ORDER BY 1, 2
$$ LANGUAGE SQL;

SELECT *
FROM same_gen_pairs();

-- Problem 3

CREATE OR REPLACE FUNCTION powerset(INTEGER [])
  RETURNS TABLE(subset INTEGER []) AS $$
DECLARE set INTEGER [];
        val INTEGER;
BEGIN
  DROP TABLE IF EXISTS powerset;
  DROP TABLE IF EXISTS tmp;
  CREATE TABLE powerset (
    subset INTEGER []
  );
  CREATE TABLE tmp (
    subset INTEGER []
  );
  INSERT INTO powerset VALUES ('{}');
  FOREACH val IN ARRAY $1
  LOOP
    FOR set IN (SELECT *
                FROM powerset)
    LOOP
      INSERT INTO tmp VALUES (val || set);
    END LOOP;
    INSERT INTO powerset (SELECT *
                          FROM tmp);
    TRUNCATE tmp;
  END LOOP;

  RETURN QUERY (SELECT *
                FROM powerset);
END;
$$ LANGUAGE plpgsql;

SELECT powerset('{5,6,7}');

-- Problem 4
DROP TABLE IF EXISTS Weighted_Graph;
CREATE TABLE Weighted_Graph (
  source INTEGER,
  target INTEGER,
  weight INTEGER
);

INSERT INTO Weighted_Graph VALUES
  (1, 2, 5),
  (2, 1, 5),
  (1, 3, 3),
  (3, 1, 3),
  (2, 3, 2),
  (3, 2, 2),
  (2, 5, 2),
  (5, 2, 2),
  (3, 5, 4),
  (5, 3, 4),
  (2, 4, 8),
  (4, 2, 8);


(SELECT Weighted_Graph.target
 FROM Weighted_Graph
 WHERE weight = (SELECT min(weight)
                 FROM Weighted_Graph
                 WHERE source = 1) AND Weighted_Graph.source = 1)
CREATE OR REPLACE FUNCTION MST()
  RETURNS TABLE(source INTEGER, target INTEGER) AS $$
DECLARE v INTEGER;
        u INTEGER;
BEGIN
  DROP TABLE IF EXISTS visited;
  CREATE TABLE visited (
    vertex INTEGER,
  );
  DROP TABLE IF EXISTS cheapest_connections;
  CREATE TABLE cheapest_connections (
    vertex INTEGER,
    target INTEGER,
    cost   INTEGER
  );
  DROP TABLE IF EXISTS MST;
  CREATE TABLE MST (
    source INTEGER,
    target INTEGER
  );


  v := (SELECT 1
        FROM (SELECT DISTINCT source
              FROM Weighted_Graph) AS random_vertex); --- select a vertex

  INSERT INTO visited VALUES (v); -- this node has been visited

  -- while not all nodes are in the MST
  WHILE (NOT exists(((SELECT DISTINCT source
                      FROM Weighted_Graph) EXCEPT (SELECT source
                                                   FROM visited))
                    UNION ((SELECT DISTINCT source
                            FROM visited) EXCEPT (SELECT DISTINCT source
                                              FROM Weighted_Graph))))
  LOOP
    -- select the node with a connection to v with the min weight
    u := (SELECT Weighted_Graph.target
        FROM Weighted_Graph
        WHERE weight = (SELECT MIN(weight)
                        FROM Weighted_Graph
                        WHERE source = v) AND Weighted_Graph.source = v); -- find the vertex with

    insert into MST values (v,u);
    insert into visited values (u);

  END LOOP;



  INSERT INTO MST VALUES (v, );


END;
$$ LANGUAGE PLPGSQL;
