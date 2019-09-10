const express = require('express')
const app = express()
const url = require('url')
const bodyParser = require('body-parser')
const axios = require('axios')

let promiseAstros = new Promise(function (resolve, reject) {
	axios.get("http://api.open-notify.org/astros.json")
		.then(function (response) {
			resolve(response.data.people)
		})
		.catch(function(err) {
			reject(err)
		})
})

let promiseLoc = new Promise(function (resolve, reject) {
	axios.get("http://api.open-notify.org/iss-now.json")
		.then(function (response) {
			resolve(response.data.iss_position)
		})
		.catch(function(err) {
			reject(err)
		})
})

app.get('/', function (request, response) {
	Promise.all([promiseAstros, promiseLoc])
		.then(function (values) {
			let toSend = "<b>Liste des astronautes sur l\'ISS:</b><br><br>"
			values[0].forEach(element => {
				toSend += element.name + "<br>"
			});
			toSend += "<br><br><b>Position de l\'ISS:</b><br><br>"
			toSend += `<u>Longitude:</u> ${values[1].longitude}<br>`
			toSend += `<u>Latitude:</u> ${values[1].latitude}<br>`
			response.send(toSend)
		})
		.catch(function(err) {
			response.send("Une erreur s'est produite : " + err)
		})
})

app.listen(3001, function () {
	console.log("Server listening on port " + 3001)
})
