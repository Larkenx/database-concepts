DROP TABLE IF EXISTS E;
CREATE TABLE E (
  Source INTEGER,
  Target INTEGER
);
-- data from expected output
INSERT INTO E VALUES
  (1, 2),
  (2, 1),
  (1, 3),
  (3, 1),
  (2, 3),
  (3, 2),
  (2, 4),
  (4, 2),
  (2, 5),
  (5, 2),
  (4, 5),
  (5, 4);

DROP TABLE IF EXISTS AC;
CREATE TABLE AC (
  vertex INTEGER
);
DROP TABLE IF EXISTS E_COPY;
CREATE TABLE E_COPY (
  source INTEGER,
  target INTEGER
);
DROP TABLE IF EXISTS TC;
CREATE TABLE TC (
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

-- Problem 1
-- PLAN FOR ARTICULATION POINTS:
-- *Adapt transitive closure functions to work on E_COPY table created in articulation points
-- LOOP through all vertices. For each vertex:
-- Remove all edges associated with it from G.
-- If G is still connected, then the vertex is not an articulation point.
-- If G is not connected, then the vertex is an articulation point. Put it in the list of articulation points
DROP FUNCTION IF EXISTS articulation_points();
CREATE OR REPLACE FUNCTION articulation_points()
  RETURNS TABLE(vertex INTEGER) AS $$
DECLARE vertex  INTEGER := NULL;
        vertex2 INTEGER := NULL;
BEGIN
  TRUNCATE TABLE AC;
  FOR vertex IN (SELECT DISTINCT source
                 FROM E)
  LOOP

    FOR vertex2 IN (SELECT DISTINCT source
                    FROM E)
    LOOP
      INSERT INTO E_COPY VALUES (vertex2, vertex2);
    END LOOP;

    TRUNCATE TABLE E_COPY;
    INSERT INTO E_COPY SELECT *
                       FROM E
                       WHERE E.source <> vertex AND E.target <> vertex;
    --- I want to put self-referential edges into the copy of the graph because
    -- the transitive closure includes self-referential points as well. If there is a graph like
    -- (1,1) and (2,2), then we have two connected components (the graph isn't connected).

    -- now we need to update our transitive closure, but we just need this to be a side-effect
    PERFORM Transitive_Closure();
    -- if removing the vertex and its edges from E cause it to be disconnected, then
    -- it is an articulation point
    -- this if statement checks to see if the graph in E_Copy is connected or not
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

  RETURN QUERY (SELECT *
                FROM AC);
END
$$ LANGUAGE plpgsql;

SELECT *
FROM articulation_points();

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

DROP TABLE IF EXISTS generations;
CREATE TABLE generations (
  person     INTEGER,
  generation INTEGER
);

DROP TABLE IF EXISTS ANC;
CREATE TABLE ANC (
  A INTEGER,
  D INTEGER
);
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
  INSERT INTO powerset VALUES ('{}'); -- initialize with the empty set
  FOREACH val IN ARRAY $1 -- we go through each value in the input array and combine it with everything in the powerset so far
  LOOP
    FOR set IN (SELECT *
                FROM powerset)
    LOOP
      INSERT INTO tmp VALUES (val || set); -- to avoid concurrency problems, we have to use a tmp table
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
DROP TABLE IF EXISTS Weighted_Graph CASCADE;
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

-- PLAN:
-- I want to have a collection of already connected nodes
-- visited = {0,1,2, ...}
-- And a collection of all the nodes I need to visit
-- not_visited := (select source from weighted_graph where source not in visited)
-- Then, I want to take nodes from not_visited, and find the *cheapest* connection from visited to one of the not_visited nodes, and connect it.
-- Rinse and repeat
CREATE OR REPLACE FUNCTION MST()
  RETURNS TABLE(source INTEGER, target INTEGER) AS $$
DECLARE v        INTEGER;
        u        INTEGER;
        min_edge RECORD;
BEGIN
  DROP TABLE IF EXISTS visited CASCADE;
  CREATE TABLE visited (
    vertex INTEGER
  );
  DROP TABLE IF EXISTS MST;
  CREATE TABLE MST (
    source INTEGER,
    target INTEGER
  );

  -- initialize the tree with a single vertex
  v := (SELECT DISTINCT g.source
        FROM Weighted_Graph g
        LIMIT 1); --- select a vertex
  INSERT INTO visited VALUES (v); -- mark it as visited
  -- while there are some nodes we haven't connected to the tree
  WHILE (exists(SELECT g.source
                FROM Weighted_Graph g
                WHERE g.source NOT IN (SELECT *
                                       FROM visited)))
  LOOP
    -- need to select an edge u,v from the nodes that:
    --  1) We haven't visited u yet (u not exists in visited)
    --  2) u shares an edge with with a vertex from visited (call this vertex v)
    --  3) the edge shared with v is the minimum of the ones we have to choose from
    DROP VIEW IF EXISTS candidates;
    CREATE OR REPLACE VIEW candidates AS
      SELECT *
      FROM Weighted_Graph g
      WHERE g.source NOT IN (SELECT *
                             FROM visited) AND -- requirement 1
            g.target IN (SELECT *
                         FROM visited); -- requirement 2

    SELECT
      c.source,
      c.target
    INTO min_edge -- requirement 3
    FROM candidates c
    WHERE c.weight <= ALL (SELECT weight
                           FROM candidates)
    LIMIT 1;

    u := min_edge.source;
    v := min_edge.target;
    INSERT INTO MST VALUES (u, v); -- put the new edge in our MST
    INSERT INTO MST VALUES (v, u); -- since it's undirected, we go both directions

    INSERT INTO visited VALUES (u); -- record that we visited the new node
  END LOOP;
  RETURN QUERY (SELECT *
                FROM MST
                ORDER BY 1, 2);
END
$$ LANGUAGE PLPGSQL;

SELECT *
FROM MST();

-- Problem 5
-- NOTE: I created a min-heap as opposed to a max-heap.
DROP TABLE IF EXISTS data;
CREATE TABLE data (
  index INTEGER,
  value INTEGER
);
CREATE OR REPLACE FUNCTION get(i INTEGER) -- returns data at index
  RETURNS INTEGER AS $$
BEGIN
  RETURN (SELECT d.value
          FROM data d
          WHERE d.index = i);
END;
$$ LANGUAGE PLPGSQL;
CREATE OR REPLACE FUNCTION heap_swap(i INTEGER, j INTEGER)
  RETURNS VOID AS $$
DECLARE tmp  INTEGER;
        tmp2 INTEGER;
BEGIN
  tmp := (get(i));
  tmp2 := (get(j));
  UPDATE data
  SET value = tmp
  WHERE index = j;
  UPDATE data
  SET value = tmp2
  WHERE index = i;
END;

$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_left(index INTEGER)
  RETURNS INTEGER AS $$
BEGIN
  RETURN 2 * index + 1;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_right(index INTEGER)
  RETURNS INTEGER AS $$
BEGIN
  RETURN 2 * (index + 1);
END
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_parent(index INTEGER)
  RETURNS INTEGER AS $$
BEGIN
  RETURN floor((index - 1) / 2);
END
$$ LANGUAGE PLPGSQL;
CREATE OR REPLACE FUNCTION heap_increase_key(index INTEGER)
  RETURNS VOID AS $$
DECLARE parent_index INTEGER;
        i            INTEGER;
BEGIN
  i := index;
  WHILE ((index <> 0) AND (get(heap_parent(i)) > get(i)))
  LOOP
    parent_index := heap_parent(i);
    PERFORM heap_swap(i, parent_index);
    i := parent_index;
  END LOOP;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_insert(n INTEGER) -- index starts at zero
  RETURNS VOID AS $$
DECLARE new_index INTEGER;
BEGIN
  IF ((SELECT count(*)
       FROM data) = 0)
  THEN
    new_index := 0;
  ELSE
    new_index := (SELECT max(index)
                  FROM data) + 1;
  END IF;

  INSERT INTO data VALUES (new_index, n);
  PERFORM heap_increase_key(new_index);
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_heapify(index INTEGER)
  RETURNS VOID AS $$
DECLARE l        INTEGER;
        r        INTEGER;
        smallest INTEGER;
        heapSize INTEGER;
BEGIN
  l := heap_left(index);
  r := heap_right(index);
  heapSize := (SELECT count(*)
               FROM data);
  IF ((l < heapSize) AND (get(index) > get(l)))
  THEN
    smallest := l;
  ELSE
    smallest := index;
  END IF;

  IF ((r < heapSize) AND (get(smallest) > get(r)))
  THEN
    smallest := r;
  END IF;

  IF (smallest <> index)
  THEN
    PERFORM heap_swap(index, smallest);
    PERFORM heap_heapify(smallest);
  END IF;

END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_extractMin()
  RETURNS INTEGER AS $$
DECLARE min      INTEGER;
        tmp      INTEGER;
        heapSize INTEGER;
BEGIN
  min := get(0);
  heapSize := (SELECT count(*)
               FROM data);
  IF (heapSize > 1)
  THEN
    tmp := get(heapSize - 1); -- the very last element in the heap
    DELETE FROM data
    WHERE index = (heapSize - 1);
    UPDATE data
    SET value = tmp
    WHERE index = 0;
  ELSE
    DELETE FROM data
    WHERE index = (heapSize - 1);
  END IF;

  PERFORM heap_heapify(0);
  RETURN min;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION heap_sort()
  RETURNS TABLE(index INTEGER, value INTEGER) AS $$
DECLARE heapSize INTEGER;
        i        INTEGER;
BEGIN
  DROP TABLE IF EXISTS sorted;
  CREATE TABLE sorted (
    index INTEGER,
    value INTEGER
  );
  heapSize := (SELECT count(*)
               FROM data) - 1;
  FOR i IN 0..heapSize
  LOOP
    INSERT INTO sorted VALUES (i, heap_extractMin());
  END LOOP;

  RETURN QUERY (SELECT *
                FROM sorted
                ORDER BY sorted.index);
END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION init_heap()
  RETURNS VOID AS $$
BEGIN
  PERFORM heap_insert(3);
  PERFORM heap_insert(1);
  PERFORM heap_insert(2);
  PERFORM heap_insert(0);
  PERFORM heap_insert(7);
  PERFORM heap_insert(8);
  PERFORM heap_insert(9);
  PERFORM heap_insert(11);
  PERFORM heap_insert(1); -- notice duplicate values
  PERFORM heap_insert(3); -- notice duplicate values
END;
$$ LANGUAGE PLPGSQL;

SELECT init_heap();

SELECT DISTINCT *
FROM heap_sort()
ORDER BY 1;
