const express = require('express')
const app = express()
const url = require('url')
const bodyParser = require('body-parser')
const axios = require('axios')
let astros
let location

app.get('/', function (request, response) {
	axios.get("http://api.open-notify.org/astros.json")
	.then(function(resAstros) {
		astros = resAstros.data.people
		return axios.get("http://api.open-notify.org/iss-now.json")
	})
	.then(function(resLoc) {
		location = resLoc.data.iss_position
		let toSend = "<b>Liste des astronautes sur l\'ISS:</b><br><br>"
		astros.forEach(element => {
			toSend += element.name + "<br>"
		});
		toSend += "<br><br><b>Position de l\'ISS:</b><br><br>"
		toSend += `<u>Longitude:</u> ${location.longitude}<br>`
		toSend += `<u>Latitude:</u> ${location.latitude}<br>`
		response.send(toSend)
	})
})

app.listen(3000, function () {
	console.log("Server listening on port " + 3000)
})
