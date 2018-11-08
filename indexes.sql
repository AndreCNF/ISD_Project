/* Nonclustered index should be creating a B+ tree indexing based on the atributes that 
   we indicate, without changing the physical order of the data in the database.
   B+ trees are a good index structure for this project, as not only does it scale well
   with an increase of data, but it also allows for efficient search in range of values, 
   such as in query 2 where it searches for reference values above 100.
   For the second query, we're using multiple indexes in a way that it searches first
   for the units name and then looks for the right interval of reference values.        */

/*Indexing for query 1*/
-- CREATE NONCLUSTERED INDEX people_names_idx
-- ON person(name)

CREATE INDEX people_names_idx
ON person(name)
USING BTREE

/*Indexing for query 2*/
-- CREATE NONCLUSTERED INDEX units_idx
-- ON indicator(units, reference_value)

CREATE INDEX units_idx
ON indicator(units, reference_value)
USING BTREE