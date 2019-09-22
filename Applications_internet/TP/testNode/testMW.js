const express = require('express')
const bodyParser = require('body-parser')

function logger1(request, response, next) {
	console.log('before', request.body)
	next()
}


function logger2(request, response, next) {
	console.log('after', request.body)
	next()
}

function myErrorHandler(request, response, next) {
	response.status(404).send(`<em>Error</em> verb = ${request.method}, url = ${request.url}`)
}

const app = express()

// On dit à l'application express d'utiliser le middleware logger
// Affiche avant undefined
app.use(logger1)
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
// Apparition du body
app.use(logger2)

app.use(myErrorHandler)

app.listen(3000, function () {
	console.log("Server listening on port 3000")
})

