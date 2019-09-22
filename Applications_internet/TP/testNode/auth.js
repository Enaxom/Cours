/*
/login : formulaire username/password submit -> POST /auth
/auth : vérifier que username='admin' & password='eureka'
	true -> GET /home "Hello admin"
	false -> GET /error "Erreur login"

utiliser app.get(/login)
app.post(/auth)
app.get(/error)
*/

const express = require('express')
const bodyParser = require('body-parser')

function myErrorHandler(request, response, next) {
	response.status(404).send(`<em>Error</em> verb = ${request.method}, url = ${request.url}`)
}

const app = express()

app.get('/login', function (request, response) {
	response.send(`
	<form action="/auth" method="post">
		<label for="uname"><b>Username</b></label>
		<input name="uname" type="text" placeholder="Enter Username" required>
		<br>
		<br>
		<label for="psw"><b>Password</b></label>
		<input name="psw" type="password" placeholder="Enter Password" required>
		<br>
		<br>
		<button type="submit">Submit</button>
	</form>`)
})

app.use(bodyParser.urlencoded({extended: false}))

app.post('/auth', function (request, response) {
	let username = request.body.uname
	let password = request.body.psw
	if (username === 'admin' && password === 'eureka') {
		response.redirect('/home')
	} else {
		response.redirect('/error')
	}
})

app.get('/home', function (request, response) {
	response.send(`Hello
				<br><br><a href="/login">Login page</a>`)
})

app.get('/error', function (request, response) {
	response.send(`Authentification error
				<br><br><a href="/login">Login page</a>`)
})

app.use(myErrorHandler)

app.listen(3000, function () {
	console.log("Server listening on port 3000")
})
