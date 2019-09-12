const express = require('express')
const app = express()
const axios = require('axios')

app.get('/', function (request, response) {
	let promiseAstros = axios.get('http://api.open-notify.org/astros.json')
	let promiseLoc = axios.get('http://api.open-notify.org/iss-now.json')

	Promise.all([promiseAstros, promiseLoc])
		.then(function (values) {
			let people = values[0].data.people
			let location = values[1].data.iss_position

			let toSend = "<b>Liste des astronautes sur l\'ISS:</b><br><br>"
			toSend += '<table border="2">'

			people.forEach(element => {
				toSend += "<tr><td>" + element.name + "</td></tr>"
			});

			toSend += "</table><br><br><b>Position de l\'ISS:</b><br><br>"
			toSend += `<u>Longitude:</u> ${location.longitude}<br>`
			toSend += `<u>Latitude:</u> ${location.latitude}<br>`
			response.send(toSend)
		})
		.catch(function(err) {
			response.send("Une erreur s'est produite : " + err)
		})
})

app.listen(3001, function () {
	console.log("Server listening on port " + 3001)
})
