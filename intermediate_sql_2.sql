masonholland : psql
psql (9.6.2)
Type "help" for help.

masonholland=# \c intermediate_sql;

You are now connected to database "intermediate_sql" as user "masonholland".

intermediate_sql=# CREATE TABLE students(id SERIAL, name TEXT);

CREATE TABLE

intermediate_sql=# CREATE TABLE classes(id SERIAL, name TEXT, teacher_id INT);

CREATE TABLE

intermediate_sql=# CREATE TABLE teachers(id SERIAL, name TEXT, room_number INT);

CREATE TABLE

intermediate_sql=# CREATE TABLE enrollments(id SERIAL, student_id INT, class_id INT, grade INT);

CREATE TABLE

intermediate_sql=# INSERT INTO students(name)
intermediate_sql-# VALUES('Penelope'),
intermediate_sql-#        ('Peter'),
intermediate_sql-#        ('Pepe'),
intermediate_sql-#        ('Parth'),
intermediate_sql-#        ('Priscilla'),
intermediate_sql-#        ('Pablo'),
intermediate_sql-#        ('Puja'),
intermediate_sql-#        ('Patricia'),
intermediate_sql-#        ('Piper'),
intermediate_sql-#        ('Paula'),
intermediate_sql-#        ('Pamela'),
intermediate_sql-#        ('Paige'),
intermediate_sql-#        ('Peggy'),
intermediate_sql-#        ('Pedro'),
intermediate_sql-#        ('Phoebe'),
intermediate_sql-#        ('Pajak'),
intermediate_sql-#        ('Parker'),
intermediate_sql-#        ('Priyal'),
intermediate_sql-#        ('Paxton'),
intermediate_sql-#        ('Patrick');

INSERT 0 20

intermediate_sql=# INSERT INTO teachers (name, room_number)
intermediate_sql-# VALUES ('Phillips', 456),
intermediate_sql-#        ('Vandergrift', 120),
intermediate_sql-#        ('Mauch', 101),
intermediate_sql-#        ('Patel', 320),
intermediate_sql-#        ('Marquez', 560),
intermediate_sql-#        ('Boykin', 200),
intermediate_sql-#        ('Phlop', 333),
intermediate_sql-#        ('Pendergrass', 222),
intermediate_sql-#        ('Palomo', 323),
intermediate_sql-#        ('Altshuler', 543),
intermediate_sql-#        ('Aleman', 187),
intermediate_sql-#        ('Ashley', 432),
intermediate_sql-#        ('Bonacci', 399),
intermediate_sql-#        ('Brazukas', 287),
intermediate_sql-#        ('Brockington', 299),
intermediate_sql-#        ('Brizuela', 376),
intermediate_sql-#        ('Burkhart', 199),
intermediate_sql-#        ('Choi', 463),
intermediate_sql-#        ('Shah', 354),
intermediate_sql-#        ('Dimaggio', 251);

INSERT 0 20

intermediate_sql=# INSERT INTO classes (name, teacher_id)
intermediate_sql-# VALUES ('Cooking Pasta', 1),
intermediate_sql-#        ('Yoga', 1),
intermediate_sql-#        ('How to Guitar', 2),
intermediate_sql-#        ('Gym', 3),
intermediate_sql-#        ('Football', 4),
intermediate_sql-#        ('Calculus', 5),
intermediate_sql-#        ('Fruit', 6),
intermediate_sql-#        ('Social Studies', 7),
intermediate_sql-#        ('English', 8),
intermediate_sql-#        ('Programming', 9),
intermediate_sql-#        ('Singing', 10),
intermediate_sql-#        ('Fashion', 11);

INSERT 0 12

intermediate_sql=# INSERT INTO enrollments (student_id, class_id, grade)
intermediate_sql-# VALUES (1, 1, 60),
intermediate_sql-#        (2, 2, 70),
intermediate_sql-#        (2, 4, 100),
intermediate_sql-#        (3, 2, 74),
intermediate_sql-#        (4, 3, 82),
intermediate_sql-#        (5, 3, 45),
intermediate_sql-#        (5, 4, 50),
intermediate_sql-#        (7, 11, 62),
intermediate_sql-#        (7, 10, 76),
intermediate_sql-#        (7, 9, 81),
intermediate_sql-#        (7, 8, 91),
intermediate_sql-#        (8, 8, 84),
intermediate_sql-#        (9, 8, 88),
intermediate_sql-#        (9, 7, 83),
intermediate_sql-#        (10, 7, 93),
intermediate_sql-#        (10, 5, 95),
intermediate_sql-#        (11, 5, 95),
intermediate_sql-#        (11, 11, 80),
intermediate_sql-#        (11, 6, 95),
intermediate_sql-#        (11, 1, 94),
intermediate_sql-#        (11, 2, 60),
intermediate_sql-#        (12, 6, 55),
intermediate_sql-#        (13, 7, 97),
intermediate_sql-#        (14, 10, 86),
intermediate_sql-#        (15, 9, 77),
intermediate_sql-#        (15, 4, 93),
intermediate_sql-#        (15, 1, 73),
intermediate_sql-#        (16, 2, 79),
intermediate_sql-#        (16, 6, 73),
intermediate_sql-#        (17, 7, 86),
intermediate_sql-#        (17, 8, 91),
intermediate_sql-#        (17, 9, 93),
intermediate_sql-#        (18, 10, 94),
intermediate_sql-#        (19, 4, 84),
intermediate_sql-#        (20, 1, 85),
intermediate_sql-#        (20, 11, 89),
intermediate_sql-#        (20, 3, 98);

INSERT 0 37



######  List all the students and their classes

intermediate_sql=# SELECT s.name, c.name FROM students s
                   INNER JOIN enrollments e
                   ON s.id = e.student_id
                   INNER JOIN classes c
                   ON c.id = e.class_id;
   name    |      name
-----------+----------------
 Penelope  | Cooking Pasta
 Peter     | Yoga
 Peter     | Gym
 Pepe      | Yoga
 Parth     | How to Guitar
 Priscilla | How to Guitar
 Priscilla | Gym
 Puja      | Singing
 Puja      | Programming
 Puja      | English
 Puja      | Social Studies
 Patricia  | Social Studies
 Piper     | Social Studies
 Piper     | Fruit
 Paula     | Fruit
 Paula     | Football
 Pamela    | Cooking Pasta
 Pamela    | Yoga
 Pamela    | Football
 Pamela    | Calculus
 Pamela    | Singing
 Paige     | Calculus
 Peggy     | Fruit
 Pedro     | Programming
 Phoebe    | English
 Phoebe    | Gym
 Phoebe    | Cooking Pasta
 Phoebe    | Cooking Pasta
 Pajak     | Yoga
 Pajak     | Calculus
 Parker    | Social Studies
 Parker    | English
 Parker    | Fruit
 Priyal    | Programming
 Paxton    | Gym
 Patrick   | Cooking Pasta
 Patrick   | Singing
 Patrick   | How to Guitar
(37 rows)

##### List all the students and their classes and rename the columns to "student" and "class"

intermediate_sql=# SELECT s.name AS student, c.name AS class FROM students s
intermediate_sql-# INNER JOIN enrollments e
intermediate_sql-# ON s.id = e.student_id
intermediate_sql-# INNER JOIN classes c
intermediate_sql-# ON c.id = e.class_id;
  student  |     class
-----------+----------------
 Penelope  | Cooking Pasta
 Peter     | Yoga
 Peter     | Gym
 Pepe      | Yoga
 Parth     | How to Guitar
 Priscilla | How to Guitar
 Priscilla | Gym
 Puja      | Singing
 Puja      | Programming
 Puja      | English
 Puja      | Social Studies
 Patricia  | Social Studies
 Piper     | Social Studies
 Piper     | Fruit
 Paula     | Fruit
 Paula     | Football
 Pamela    | Cooking Pasta
 Pamela    | Yoga
 Pamela    | Football
 Pamela    | Calculus
 Pamela    | Singing
 Paige     | Calculus
 Peggy     | Fruit
 Pedro     | Programming
 Phoebe    | English
 Phoebe    | Gym
 Phoebe    | Cooking Pasta
 Pajak     | Yoga
 Pajak     | Calculus
 Parker    | Social Studies
 Parker    | English
 Parker    | Fruit
 Priyal    | Programming
 Paxton    | Gym
 Patrick   | Cooking Pasta
 Patrick   | Singing
 Patrick   | How to Guitar
(37 rows)



##### List all the students and their average grade

intermediate_sql=# SELECT s.name AS student, avg(e.grade) AS grade FROM students s
                   INNER JOIN enrollments e
                   ON s.id = e.student_id
                   GROUP BY s.name;
  student  |        grade
-----------+---------------------
 Piper     | 85.5000000000000000
 Paige     | 55.0000000000000000
 Pedro     | 86.0000000000000000
 Peter     | 85.0000000000000000
 Peggy     | 97.0000000000000000
 Patricia  | 84.0000000000000000
 Paula     | 94.0000000000000000
 Phoebe    | 81.0000000000000000
 Pamela    | 84.8000000000000000
 Parker    | 90.0000000000000000
 Priscilla | 47.5000000000000000
 Priyal    | 94.0000000000000000
 Patrick   | 90.6666666666666667
 Puja      | 77.5000000000000000
 Paxton    | 84.0000000000000000
 Pepe      | 74.0000000000000000
 Penelope  | 60.0000000000000000
 Pajak     | 76.0000000000000000
 Parth     | 82.0000000000000000
(19 rows)

##### List all the students and a count of how many classes they are currently enrolled in
