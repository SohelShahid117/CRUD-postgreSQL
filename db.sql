-- CREATE DATABASE bookDB;
postgres=# CREATE DATABASE bookDB;
-- create a bookdb database

CREATE DATABASE
-- database created

postgres=# \l
-- \l------>ki ki DB ache sob show korbe
postgres=# \c bookdb   
--  \c connect with bookdb Database


CREATE TABLE books (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(255),
    price INT
);


bookdb=# CREATE TABLE books (
bookdb(#     id INT PRIMARY KEY,
bookdb(#     name VARCHAR(20),
bookdb(#     description VARCHAR(255),
bookdb(#     price INT
bookdb(# );

-- create a books table with bookdb database

CREATE TABLE
bookdb=#

bookdb-# \d books
                         Table "public.books"
   Column    |          Type          | Collation | Nullable | Default
-------------+------------------------+-----------+----------+---------
 id          | integer                |           | not null |
 name        | character varying(20)  |           |          |
 description | character varying(255) |           |          |
 price       | integer                |           |          |
Indexes:
    "books_pkey" PRIMARY KEY, btree (id)

INSERT INTO books (id,name,description,price)
VALUES
()



