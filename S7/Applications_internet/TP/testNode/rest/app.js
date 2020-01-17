const feathers = require('@feathersjs/feathers')
const express = require('@feathersjs/express')

const service = require('feathers-knex')
const knex = require('knex')

const db = knex({
  client: 'sqlite3',
  connection: {
    filename: './rest/dev.sqlite3'
  }
})

// sudo curl -X POST -H "Content-Type: application/json" http://localhost:3000/api/users -d '{"fullname": "Morgane", "email": "bloup@blip.com"}'  create user
// curl -X PATCH http://localhost:3000/api/users/1 -H "Content-Type: application/json" -d '{"email": "newaddress@gmail.com"}'  edit user

// Create a feathers instance.
const app = express(feathers())
// Turn on JSON parser for REST services
app.use(express.json())
// Turn on URL-encoded parser for REST services
app.use(express.urlencoded({ extended: true }))
// Enable REST services
app.configure(express.rest());

app.use('/api/users', service({
  Model: db,
  name: 'users'
}))

// app.use('/api/pictures', service({
//   Model: db,
//   name: 'pictures'
// }))

app.use(express.errorHandler())

// Start the server.
const port = process.env.PORT || 3000

app.listen(port, () => {
  console.log(`Server listening on port ${port}`)
})