-- PostgreSQL Create Table, PostgreSQL Insert Data

Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (16.4)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=#
postgres=# SELECT version();
                          version
------------------------------------------------------------
 PostgreSQL 16.4, compiled by Visual C++ build 1940, 64-bit
(1 row)


postgres=# CREATE TABLE cars (
postgres(#   brand VARCHAR(255),
postgres(#   model VARCHAR(255),
postgres(#   year INT
postgres(# );
CREATE TABLE
postgres=#

postgres=# SELECT * FROM cars;
 brand | model | year
-------+-------+------
(0 rows)

postgres=# INSERT INTO cars (brand, model, year)
postgres-# VALUES ('Ford', 'Mustang', 1964);
INSERT 0 1
postgres=# SELECT * FROM cars;
 brand |  model  | year
-------+---------+------
 Ford  | Mustang | 1964
(1 row)


postgres=# INSERT INTO cars (brand, model, year)
postgres-# VALUES
postgres-#   ('Volvo', 'p1800', 1968),
postgres-#   ('BMW', 'M1', 1978),
postgres-#   ('Toyota', 'Celica', 1975);
INSERT 0 3
postgres=#  SELECT * FROM cars;
 brand  |  model  | year
--------+---------+------
 Ford   | Mustang | 1964
 Volvo  | p1800   | 1968
 BMW    | M1      | 1978
 Toyota | Celica  | 1975
(4 rows)


postgres=#

postgres=# INSERT INTO cars(brand,model,year)
postgres-# VALUES
postgres-# ("ALLION","X",2007),
postgres-# ("PREMIO","Y",2012);
ERROR:  column "ALLION" does not exist
LINE 3: ("ALLION","X",2007),

-- double apostrophes / quotation "" use kora jabena-->use single quotation---''

postgres=# INSERT INTO cars
postgres-# VALUES
postgres-# ('ALLION','X',2007),
postgres-# ('PREMIO','Y',2012);
INSERT 0 2
postgres=# SELECT * FROM cars;
 brand  |  model  | year
--------+---------+------
 Ford   | Mustang | 1964
 Volvo  | p1800   | 1968
 BMW    | M1      | 1978
 Toyota | Celica  | 1975
 ALLION | X       | 2007
 PREMIO | Y       | 2012
(6 rows)


postgres=#
