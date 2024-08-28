//https://youtu.be/cnzka7kF5Zk?si=Q5FXkZK0uDZpxMo4
-- CREATE DATABASE bookDB;
postgres=# CREATE DATABASE bookDB;
-- create a bookdb database

CREATE DATABASE
-- database created

postgres=# \l
-- \l------>ki ki DB ache sob show korbe
postgres=# \c bookdb   
--  \c connect with bookdb Database

const {Pool} = require("pg")
//https://node-postgres.com/apis/pool
// const x = require("pg")
// console.log(x)
const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    port:5432,
    database:"bookdb",
    password:"1234"
  })

  module.exports = pool


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



postgres=# SELECT datname FROM pg_database;
   datname
-------------
 postgres
 template1
 template0
 bookdb
 carsdb
 test2
 instagramdb
(7 rows)

postgres=# CREATE DATABASE usersDB;
CREATE DATABASE
postgres=# \c instagramdb
You are now connected to database "instagramdb" as user "postgres".
instagramdb=#



const books = await pool.query("SELECT * FROM books")
// res.status(200).send({message:"books are returned"})
res.status(200).json({message:"books are returned",data:books.rows})

SELECT * FROM books
"SELECT * FROM books WHERE id = $1",[id]

 const {id,name,description,price} = req.body
 //inserting book data into database

 const newBook = await pool.query("INSERT INTO books (id,name,description,price) VALUES($1,$2,$3,$4) RETURNING * ",[id,name,description,price]);

 const {id} = req.params
 const deletedBook = await pool.query("DELETE FROM books WHERE id = $1",[id])
 res.status(200).json({message:`specific book is deleted id : ${id}`,data:deletedBook.rows})

 const {id} = req.params
 // res.status(200).json({message:`specific book is update id : ${id}`})
 const {name,description,price} = req.body
 const updatedBook = await pool.query("UPDATE books SET name = $1, description = $2, price = $3 WHERE id = $4 RETURNING *",[name,description,price,id])



 //CRUD
 CREATE DATABASE persondb;
 \c persondb

 CREATE TABLE person(
    id INT,
    name VARCHAR(100),
    city VARCHAR(50)
 )

//CREATE
 INSERT INTO person(id,name,city)
VALUES
(101,'SOHEL','CTG'),
(102,'Sumi','CTG'),
(103,'Sanjid','CTG'),
(104,'Sojib','Dhaka')
;

INSERT INTO person
VALUES
(105,'Shahid','Dhaaka'),
(106,'Sharmin','Rajshahi');

//READ
SELECT * FROM person;
SELECT * FROM person WHERE id = 105;
SELECT name,city FROM person;

//update
UPDATE person SET city = 'London' WHERE id = 105;
UPDATE person SET city = 'Chattogram' WHERE city = 'ctg';//error
UPDATE person SET city = 'Chattogram' WHERE city = 'CTG';

UPDATE person SET city = 'Ctg' WHERE id = 101;
UPDATE person SET city = 'Ctg' WHERE id IN (102,104);
//102 & 104 both er city update hobe

UPDATE person SET city = 'Barishal' WHERE id=102 OR id = 104;
//102 & 104 both er city update hobe

//DELETE
DELETE FROM person WHERE id = 101;
DELETE FROM person WHERE id IN (102,103,104);
