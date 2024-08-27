const express = require('express')
const cors = require("cors")
const app = express()
const port = 3000

app.use(cors())
app.use(express.json())

app.get('/', (req, res) => {
  res.send('Hello World!now enjoy postgreSQL')
})

app.get("/books",async(req,res)=>{
    try{
        // res.status(200).send({message:"books are returned"})
        res.status(200).json({message:"books are returned"})
    }
    catch(err){
        // res.send({error:err.message})
        res.json({error:err.message})
    }
})

app.get("/books/:id",async(req,res)=>{
    try{
        const {id} = req.params
        res.status(200).json({message:`specific book is returned id : ${id}`})
    }
    catch(err){
        // res.send({error:err.message})
        res.json({error:err.message})
    }
})

app.post("/book",async(req,res)=>{
    try{
        const {id,name,description,price} = req.body
        res.status(200).json({message:`books id : ${id},name:${name},price:${price},description:${description}`})
    }
    catch(err){
        res.json({error:err.message})
    }
})

app.delete("/books/:id",async(req,res)=>{
    try{
        const {id} = req.params
        res.status(200).json({message:`specific book is deleted id : ${id}`})
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
        res.status(200).json({message:`updated book id : ${id},name:${name},price:${price},description:${description}`})
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
