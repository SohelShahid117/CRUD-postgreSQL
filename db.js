const {Pool} = require("pg")
//https://node-postgres.com/apis/pool
// const x = require("pg")
// console.log(x)
const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    port:5432,
    database:"bookDB"
  })

  module.exports = pool