const express = require('express')
const app = express()
const url = require('url')
const bodyParser = require('body-parser')
const path = require('path')

function logger (req, res, next) {
    console.log('verb', req.method, 'url', req.url)
    next()
}

function error404Handler (req, res, next) {
    res.status(404).send('Page inconnue')
}

app.use(logger)

app.get('/', function (request, response) {
    // query parameters are got after url is parsed
    let port = request.headers.host.split(":")[1]
    let parsedURL = url.parse(request.url, true)
    let queryParams = parsedURL.query
    console.log('queryParams', queryParams)

    response.send(`<b>Port:</b> ${port} <br><b>Param:</b> ${queryParams.name}`)
})

/*
Tapper la commande quand le programme est lancé :
sudo curl -v -X POST localhost:3000/user -H "Content-type: application/json" -d '{"lastname":"Cadeau","firstname":"Morgane"}'
Met l'objet json dans request, body
*/
app.use(bodyParser.json())
app.post('/user', function (request, response) {
    response.status(201).send('done')
})

app.use(error404Handler)

for (let i = 3000; i < 4001; i++) {
    app.listen(i, function () {
        console.log("Server listening on port " + i)
    })
}
