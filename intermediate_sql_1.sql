masonholland=# CREATE DATABASE intermediate_sql;

CREATE DATABASE

masonholland=# \c intermediate_sql;
You are now connected to database "intermediate_sql" as user "masonholland".

intermediate_sql=# CREATE TABLE items(id SERIAL, name TEXT, revenue INT, course TEXT);

CREATE TABLE

intermediate_sql=# SELECT * FROM items;
 id | name | revenue | course
----+------+---------+--------
(0 rows)

intermediate_sql=# INSERT INTO items (name, revenue, course)
intermediate_sql-# VALUES ('lobster mac n cheese', 1200 , 'side'),
intermediate_sql-# ('veggie lasagna', 1000, 'main'),
intermediate_sql-# ('arugula salad', 1100, 'salad');

INSERT 0 3

intermediate_sql=# SELECT * FROM items;
 id |         name         | revenue | course
----+----------------------+---------+--------
  1 | lobster mac n cheese |    1200 | side
  2 | veggie lasagna       |    1000 | main
  3 | arugula salad        |    1100 | salad
(3 rows)

intermediate_sql=# SELECT sum(revenue) FROM items;
 sum
------
 3300
(1 row)

intermediate_sql=# SELECT min(revenue) FROM items;
 min
------
 1000
(1 row)

intermediate_sql=# SELECT max(revenue) FROM items;
 max
------
 1200
(1 row)

intermediate_sql=# SELECT avg(revenue) FROM items;
          avg
-----------------------
 1100.0000000000000000
(1 row)

intermediate_sql=# SELECT count(name) FROM items;
 count
-------
     3
(1 row)

intermediate_sql=# INSERT INTO items (name, revenue, course) VALUES (NULL, NULL, NULL);

INSERT 0 1

intermediate_sql=# SELECT * FROM items;
 id |         name         | revenue | course
----+----------------------+---------+--------
  1 | lobster mac n cheese |    1200 | side
  2 | veggie lasagna       |    1000 | main
  3 | arugula salad        |    1100 | salad
  4 |                      |         |
(4 rows)

intermediate_sql=# INSERT INTO items (name, revenue, course) VALUES ('striped bass', 500, 'main');

INSERT 0 1

intermediate_sql=# SELECT * FROM items;
 id |         name         | revenue | course
----+----------------------+---------+--------
  1 | lobster mac n cheese |    1200 | side
  2 | veggie lasagna       |    1000 | main
  3 | arugula salad        |    1100 | salad
  4 |                      |         |
  5 | striped bass         |     500 | main
(5 rows)

intermediate_sql=# SELECT count(course) FROM items;
 count
-------
     4
(1 row)

intermediate_sql=# SELECT count(id) FROM items;
 count
-------
     5
(1 row)

intermediate_sql=# SELECT count(revenue) FROM items;
 count
-------
     4
(1 row)

intermediate_sql=# SELECT count(name) FROM items;
 count
-------
     4
(1 row)

intermediate_sql=# SELECT max(revenue), min(revenue) FROM items;
 max  | min
------+-----
 1200 | 500
(1 row)

intermediate_sql=# SELECT course, sum(revenue) FROM items GROUP BY course;
 course | sum
--------+------
        |
 salad  | 1100
 side   | 1200
 main   | 1500
(4 rows)

intermediate_sql=# SELECT course FROM items;
 course
--------
 side
 main
 salad

 main
(5 rows)

intermediate_sql=# SELECT name FROM items WHERE course='main';
      name
----------------
 veggie lasagna
 striped bass
(2 rows)

intermediate_sql=# SELECT * FROM items WHERE course='main';
 id |      name      | revenue | course
----+----------------+---------+--------
  2 | veggie lasagna |    1000 | main
  5 | striped bass   |     500 | main
(2 rows)

intermediate_sql=# SELECT max(revenue), min(revenue) FROM items WHERE course='main';
 max  | min
------+-----
 1000 | 500
(1 row)

intermediate_sql=# SELECT sum(revenue) FROM items WHERE course='main';
 sum
------
 1500
(1 row)

intermediate_sql=# DROP TABLE items;

DROP TABLE

intermediate_sql=# CREATE TABLE seasons(id SERIAL, name TEXT);

CREATE TABLE

intermediate_sql=# CREATE TABLE items(id SERIAL, name TEXT, revenue INT, season_id INT);

CREATE TABLE

intermediate_sql=# CREATE TABLE categories(id SERIAL, name TEXT);

CREATE TABLE

intermediate_sql=# CREATE TABLE item_categories(item_id INT, category_id INT);

CREATE TABLE

intermediate_sql=# INSERT INTO seasons(name)
intermediate_sql-# VALUES ('summer'),
intermediate_sql-# ('autumn'),
intermediate_sql-# ('winter'),
intermediate_sql-# ('spring');

INSERT 0 4

intermediate_sql=# INSERT INTO items(name, revenue, season_id)
                   VALUES ('lobster mac n cheese', 1200, 3),
                          ('veggie lasagna', 1000, 1),
                          ('striped bass', 500, 1),
                          ('burger', 2000, 1),
                          ('grilled cheese', 800, 4),
                          ('hot dog', 1000, 1),
                          ('arugula salad', 1100, 2);

INSERT 0 7

intermediate_sql=# INSERT INTO categories(name)
                   VALUES ('side'),
                          ('dinner'),
                          ('lunch'),
                          ('vegetarian');
INSERT 0 4

intermediate_sql=# INSERT INTO item_categories(item_id, category_id)
intermediate_sql-# VALUES (1,1),
intermediate_sql-# (2,2),
intermediate_sql-# (2,4),
intermediate_sql-# (3,2),
intermediate_sql-# (4,3),
intermediate_sql-# (5,4)
intermediate_sql-# (5,3),
intermediate_sql-# (7,1),
intermediate_sql-# (7,2),
intermediate_sql-# (7,3),
intermediate_sql-# (7,4);
INSERT 0 11

intermediate_sql=# SELECT * FROM items
intermediate_sql-# INNER JOIN seasons
intermediate_sql-# ON items.season_id = season_id;
 id |         name         | revenue | season_id | id |  name
----+----------------------+---------+-----------+----+--------
  1 | lobster mac n cheese |    1200 |         3 |  1 | summer
  2 | veggie lasagna       |    1000 |         1 |  1 | summer
  3 | striped bass         |     500 |         1 |  1 | summer
  4 | burger               |    2000 |         1 |  1 | summer
  5 | grilled cheese       |     800 |         4 |  1 | summer
  6 | hot dog              |    1000 |         1 |  1 | summer
  7 | arugula salad        |    1100 |         2 |  1 | summer
  1 | lobster mac n cheese |    1200 |         3 |  2 | autumn
  2 | veggie lasagna       |    1000 |         1 |  2 | autumn
  3 | striped bass         |     500 |         1 |  2 | autumn
  4 | burger               |    2000 |         1 |  2 | autumn
  5 | grilled cheese       |     800 |         4 |  2 | autumn
  6 | hot dog              |    1000 |         1 |  2 | autumn
  7 | arugula salad        |    1100 |         2 |  2 | autumn
  1 | lobster mac n cheese |    1200 |         3 |  3 | winter
  2 | veggie lasagna       |    1000 |         1 |  3 | winter
  3 | striped bass         |     500 |         1 |  3 | winter
  4 | burger               |    2000 |         1 |  3 | winter
  5 | grilled cheese       |     800 |         4 |  3 | winter
  6 | hot dog              |    1000 |         1 |  3 | winter
  7 | arugula salad        |    1100 |         2 |  3 | winter
  1 | lobster mac n cheese |    1200 |         3 |  4 | spring
  2 | veggie lasagna       |    1000 |         1 |  4 | spring
  3 | striped bass         |     500 |         1 |  4 | spring
  4 | burger               |    2000 |         1 |  4 | spring
  5 | grilled cheese       |     800 |         4 |  4 | spring
  6 | hot dog              |    1000 |         1 |  4 | spring
  7 | arugula salad        |    1100 |         2 |  4 | spring
(28 rows)

intermediate_sql=# SELECT * FROM items;
 id |         name         | revenue | season_id
----+----------------------+---------+-----------
  1 | lobster mac n cheese |    1200 |         3
  2 | veggie lasagna       |    1000 |         1
  3 | striped bass         |     500 |         1
  4 | burger               |    2000 |         1
  5 | grilled cheese       |     800 |         4
  6 | hot dog              |    1000 |         1
  7 | arugula salad        |    1100 |         2
(7 rows)


intermediate_sql=# SELECT * FROM items
                   INNER JOIN seasons
                   ON items.season_id = seasons.id
;
 id |         name         | revenue | season_id | id |  name
----+----------------------+---------+-----------+----+--------
  4 | burger               |    2000 |         1 |  1 | summer
  2 | veggie lasagna       |    1000 |         1 |  1 | summer
  3 | striped bass         |     500 |         1 |  1 | summer
  6 | hot dog              |    1000 |         1 |  1 | summer
  7 | arugula salad        |    1100 |         2 |  2 | autumn
  1 | lobster mac n cheese |    1200 |         3 |  3 | winter
  5 | grilled cheese       |     800 |         4 |  4 | spring
(7 rows)

intermediate_sql=# SELECT items.name FROM items
intermediate_sql-# INNER JOIN seasons
intermediate_sql-# ON items.season_id = seasons.id;
         name
----------------------
 burger
 veggie lasagna
 striped bass
 hot dog
 arugula salad
 lobster mac n cheese
 grilled cheese
(7 rows)

intermediate_sql=# SELECT items.name, seasons.name FROM items
intermediate_sql-# INNER JOIN seasons
intermediate_sql-# ON items.season_id = seasons.id;
         name         |  name
----------------------+--------
 burger               | summer
 veggie lasagna       | summer
 striped bass         | summer
 hot dog              | summer
 arugula salad        | autumn
 lobster mac n cheese | winter
 grilled cheese       | spring
(7 rows)

intermediate_sql=# SELECT items.name AS item_name, seasons.name AS season_name FROM items
intermediate_sql-# INNER JOIN seasons
intermediate_sql-# ON items.season_id = seasons.id;
      item_name       | season_name
----------------------+-------------
 burger               | summer
 veggie lasagna       | summer
 striped bass         | summer
 hot dog              | summer
 arugula salad        | autumn
 lobster mac n cheese | winter
 grilled cheese       | spring
(7 rows)

intermediate_sql=# SELECT * FROM categories;
 id |    name
----+------------
  1 | side
  2 | dinner
  3 | lunch
  4 | vegetarian
(4 rows)

intermediate_sql=# SELECT * FROM items;
 id |         name         | revenue | season_id
----+----------------------+---------+-----------
  1 | lobster mac n cheese |    1200 |         3
  2 | veggie lasagna       |    1000 |         1
  3 | striped bass         |     500 |         1
  4 | burger               |    2000 |         1
  5 | grilled cheese       |     800 |         4
  6 | hot dog              |    1000 |         1
  7 | arugula salad        |    1100 |         2
(7 rows)

intermediate_sql=# SELECT items.name, categories.name FROM items
INNER JOIN item_categories
ON items.id = item_categories.item_id
INNER JOIN categories
ON categories.id = item_categories.category_id
WHERE items.name='arugula salad';
     name      |    name
---------------+------------
 arugula salad | side
 arugula salad | dinner
 arugula salad | lunch
 arugula salad | vegetarian
(4 rows)

intermediate_sql=# SELECT items.name AS item_name, categories.name AS category_name FROM items
INNER JOIN item_categories
ON items.id = item_categories.item_id
INNER JOIN categories
ON categories.id = item_categories.category_id
WHERE items.name='arugula salad';
   item_name   | category_name
---------------+---------------
 arugula salad | side
 arugula salad | dinner
 arugula salad | lunch
 arugula salad | vegetarian
(4 rows)

intermediate_sql=# INSERT INTO items(name, revenue, season_id)
VALUES ('italian beef', 600, NULL),
('cole slaw', 150, NULL),
('ice cream sandwich', 700, NULL);

INSERT 0 3

intermediate_sql=# SELECT i.name items, s.name seasons
intermediate_sql-# FROM items i
intermediate_sql-# INNER JOIN seasons s
intermediate_sql-# ON i.season_id = s.id;
        items         | seasons
----------------------+---------
 hot dog              | summer
 veggie lasagna       | summer
 striped bass         | summer
 burger               | summer
 arugula salad        | autumn
 lobster mac n cheese | winter
 grilled cheese       | spring
(7 rows)

#### This query uses aliases for items (i) and seasons (s) to make it cleaner. Also it is not necessary to use AS to name the column headings.

intermediate_sql=# SELECT * FROM items i
intermediate_sql-# LEFT OUTER JOIN seasons s
intermediate_sql-# ON i.season_id = s.id;
 id |         name         | revenue | season_id | id |  name
----+----------------------+---------+-----------+----+--------
  6 | hot dog              |    1000 |         1 |  1 | summer
  2 | veggie lasagna       |    1000 |         1 |  1 | summer
  3 | striped bass         |     500 |         1 |  1 | summer
  4 | burger               |    2000 |         1 |  1 | summer
  7 | arugula salad        |    1100 |         2 |  2 | autumn
  1 | lobster mac n cheese |    1200 |         3 |  3 | winter
  5 | grilled cheese       |     800 |         4 |  4 | spring
  8 | italian beef         |     600 |           |    |
  9 | cole slaw            |     150 |           |    |
 10 | ice cream sandwich   |     700 |           |    |
(10 rows)

intermediate_sql=# SELECT * FROM items
intermediate_sql-# LEFT OUTER JOIN seasons
intermediate_sql-# ON items.season_id = seasons.id;
 id |         name         | revenue | season_id | id |  name
----+----------------------+---------+-----------+----+--------
  6 | hot dog              |    1000 |         1 |  1 | summer
  2 | veggie lasagna       |    1000 |         1 |  1 | summer
  3 | striped bass         |     500 |         1 |  1 | summer
  4 | burger               |    2000 |         1 |  1 | summer
  7 | arugula salad        |    1100 |         2 |  2 | autumn
  1 | lobster mac n cheese |    1200 |         3 |  3 | winter
  5 | grilled cheese       |     800 |         4 |  4 | spring
  8 | italian beef         |     600 |           |    |
  9 | cole slaw            |     150 |           |    |
 10 | ice cream sandwich   |     700 |           |    |
(10 rows)

##### A left outer join will return all records from the left table(items) and return matching records from the right table(seasons).

intermediate_sql=# SELECT * FROM seasons s
intermediate_sql-# RIGHT OUTER JOIN items i
intermediate_sql-# ON i.id = s.id
intermediate_sql-# ;
 id |  name  | id |         name         | revenue | season_id
----+--------+----+----------------------+---------+-----------
  1 | summer |  1 | lobster mac n cheese |    1200 |         3
  2 | autumn |  2 | veggie lasagna       |    1000 |         1
  3 | winter |  3 | striped bass         |     500 |         1
  4 | spring |  4 | burger               |    2000 |         1
    |        |  5 | grilled cheese       |     800 |         4
    |        |  6 | hot dog              |    1000 |         1
    |        |  7 | arugula salad        |    1100 |         2
    |        |  8 | italian beef         |     600 |
    |        |  9 | cole slaw            |     150 |
    |        | 10 | ice cream sandwich   |     700 |
(10 rows)

intermediate_sql=# SELECT * FROM items
intermediate_sql-# WHERE revenue > (SELECT AVG(revenue) FROM items);
 id |         name         | revenue | season_id
----+----------------------+---------+-----------
  1 | lobster mac n cheese |    1200 |         3
  2 | veggie lasagna       |    1000 |         1
  4 | burger               |    2000 |         1
  6 | hot dog              |    1000 |         1
  7 | arugula salad        |    1100 |         2
(5 rows)

intermediate_sql=# SELECT * FROM items
WHERE revenue < (SELECT avg(revenue) FROM items);
 id |        name        | revenue | season_id
----+--------------------+---------+-----------
  3 | striped bass       |     500 |         1
  5 | grilled cheese     |     800 |         4
  8 | italian beef       |     600 |
  9 | cole slaw          |     150 |
 10 | ice cream sandwich |     700 |
(5 rows)


### Write a query that returns the sum of all items that have a category of dinner.

intermediate_sql=# SELECT sum(revenue) FROM items i
intermediate_sql-# INNER JOIN item_categories
intermediate_sql-# ON i.id = item_categories.item_id;
  sum
-------
 11700
(1 row)
