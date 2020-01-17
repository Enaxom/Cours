const feathers = require('@feathersjs/feathers')
const express = require('@feathersjs/express')
const path = require('path')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')

const service = require('feathers-knex')
const knex = require('knex')

const db = knex({
	client: 'sqlite3',
	connection: {
		filename: './auth/auth'
	}
})

const app = express(feathers())

function myErrorHandler(request, response, next) {
	response.status(404).send(`<em>Error</em> verb = ${request.method}, url = ${request.url}`)
}

async function createAccountMiddleware(request, response, next) {
	const email = request.body.email
	let users = await db.from('users').select('id').where({ email: email })
	if (users.length === 0) {
		let insertedUserId = await db.insert({ email: email }).into('users')
		let userId = insertedUserId[0]
		let token = jwt.sign({ user_id: userId }, "secret")
		let emailContent = `<html>
		Confirm your inscription by clicking on this link: http://localhost:3000/confirm_registration?token=${token}
		</html>`

		console.log(emailContent)
		response.redirect('/account_created.html')
	} else {
		response.redirect('/register_error.html')
	}
}

function confirmRegistrationMiddleware(request, response, next) {
	let token = request.query.token
	response.send(`
		<form action="/activate_account" method="POST>
			<label for="password"><b>Password: </b></label><br><br>
			<input type="password" name="password" placeholder="Enter password" required><br>
			<input type="hidden" name="token" value="${token}"><br>
			<input type="submit" value="Activate your account">
		</form>`)
}

async function activateAccountMiddleware(request, response, next) {
	let token = request.body.token
	try {
		let decoded = jwt.verify(token, 'secret')
		let userId = jwt.decode(token).user_id
		let password = request.body.password
		let cryptedPassword = await bcrypt.hashSync(password, 10)
		await db.into('users').update({ activate: true, password: cryptedPassword }).where({ userId: userId })
		response.redirect('/account_activated.html')
	} catch (err) {
		response.redirect('/account_activation_error.html')
	}
}

// Turn on JSON parser for REST services
app.use(express.json())
// Turn on URL-encoded parser for REST services
app.use(express.urlencoded({ extended: true }))
// Enable REST services
app.configure(express.rest());

app.post('/create_account', createAccountMiddleware)
//app.post('/auth', authMiddleware)
app.get('/confirm_registration', confirmRegistrationMiddleware)
app.get('/activate_account', activateAccountMiddleware)

app.use('/api/users', service({
	Model: db,
	name: 'users'
}))

app.use(express.static(path.join(__dirname, 'static')))
app.use(myErrorHandler)

// Start the server.
const port = process.env.PORT || 3000

app.listen(port, () => {
	console.log(`Server listening on port ${port}`)
})
