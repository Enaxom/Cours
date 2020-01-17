const express = require('express')
const app = express()
const axios = require('axios')

app.get('/', async function(req, res) {
	let astroRes = await axios.get('http://api.open-notify.org/astros.json')
	let issPositionRes = await axios.get('http://api.open-notify.org/iss-now.json')

	let astronauts = astroRes.data.people
	let issPosition = issPositionRes.data.iss_position

	let tableContent = ""
	astronauts.forEach(astronaut => {
		tableContent += `<tr><td>${astronaut.name}</td><td>${astronaut.craft}</td></tr>`
	});

	/*
	let tableContent = astronauts.reduce((accu, astronaut) =>
		accu + `<tr><td>${astronaut.name}</td><td>${astronaut.craft}</td></tr>`
	, "")
	*/

	let html = `<table>${tableContent}</table><p>Position: ${issPosition.latitude}, ${issPosition.longitude}`
	res.send(html)
})

app.listen(3002, function () {
	console.log("Server listening on port " + 3002)
})
