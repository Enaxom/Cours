let axios = require('axios')

/*
let response1
axios.get("https://yesno.wtf/api")
    .then(function(response) {
        response1 = response
        console.log('response', response)
        return axios.get("https://yesno.wtf/api")
    })
    .then(function(response) {
        console.log('response', response)
    })
    .catch(function(err) {
        console.log('err', err)
    })
*/

// Fonction asynchrone
async function f() {
    try {
        let response = await axios.get("https://yesno.wtf/api")
        let response2 = await axios.get("https://yesno.wtf/api")
    } catch (err) {
        console.log('err', err)
    }
}

f()
