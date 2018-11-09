/* B+ trees are a good index structure for this project, as not only does it 
   scale well with an increase of data, unlike an hash index, but it also allows 
   for efficient search in range of values, due to its tree-like architecture. 
   This is useful in cases such as in query 2, where it searches for reference 
   values above 100.                                                             */

/*Indexing for query 1*/
CREATE INDEX people_names_idx
ON person(name)
USING BTREE

/*Indexing for query 2*/
CREATE INDEX units_idx
ON indicator(units, reference_value)
USING BTREE