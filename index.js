const express = require('express')
const cors = require("cors")
const { v4: uuidv4 } = require('uuid');
// uuidv4();

const pool = require('./db')

const app = express()
const port = 3000

app.use(cors())
app.use(express.json())

app.get('/', (req, res) => {
  res.send('Hello World!now enjoy postgreSQL')
})

app.get("/books",async(req,res)=>{
    try{
        const books = await pool.query("SELECT * FROM books")
        // res.status(200).send({message:"books are returned"})
        res.status(200).json({message:"books are returned",data:books.rows})
    }
    catch(err){
        // res.send({error:err.message})
        res.json({error:err.message})
    }
})

app.get("/books/:id",async(req,res)=>{
    try{
        const {id} = req.params
        const book = await pool.query("SELECT * FROM books WHERE id = $1",[id])
        res.status(200).json({message:`specific book is returned id : ${id}`,data:book.rows})
    }
    catch(err){
        // res.send({error:err.message})
        res.json({error:err.message})
    }
})

app.post("/book",async(req,res)=>{
    try{
        const {id,name,description,price} = req.body
        const _id = uuidv4();

        //inserting book data into database
        const newBook = await pool.query("INSERT INTO books (id,name,description,price) VALUES($1,$2,$3,$4) RETURNING * ",[id,name,description,price]);

        // const newBook = await pool.query("INSERT INTO books (id,name,description,price) VALUES($1,$2,$3,$4) RETURNING * ",[_id,name,description,price]);


        // const newBook = await pool.query(`INSERT INTO books (id,name,description,price) VALUES ('${id}','${name}','${description}','${price}');`);

        // res.status(200).json({message:`books id : ${id},unique id : ${_id},name:${name},price:${price},description:${description}`})

        res.status(200).json({message:`book was created`,data:newBook.rows})
    }
    catch(err){
        res.json({error:err.message})
    }
})

app.delete("/books/:id",async(req,res)=>{
    try{
        const {id} = req.params
        const deletedBook = await pool.query("DELETE FROM books WHERE id = $1",[id])
        res.status(200).json({message:`specific book is deleted id : ${id}`,data:deletedBook.rows})
    }
    catch(err){
        // res.send({error:err.message})
        res.json({error:err.message})
    }
})

app.put("/books/:id",async(req,res)=>{
    try{
        const {id} = req.params
        // res.status(200).json({message:`specific book is update id : ${id}`})
        const {name,description,price} = req.body
        const updatedBook = await pool.query("UPDATE books SET name = $1, description = $2, price = $3 WHERE id = $4 RETURNING *",[name,description,price,id])

        res.status(200).json({message:`book data updated`,data:updatedBook.rows})
    }
    catch(err){
        // res.send({error:err.message})
        res.json({error:err.message})
    }
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
  console.log(`server is running at http://localhost:${port}`)
})

//lec-8:https://youtu.be/a0NaaIwl3w0?si=dskgq0yHh2JUPP1G

/*
{
  "id":102,
  "name":"book2",
  "description":"this is mathematical book",
  "price":400
},
{
  "id":103,
  "name":"book3",
  "description":"this is historical book",
  "price":405
}
*/
