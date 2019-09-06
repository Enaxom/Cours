let inquirer = require('inquirer')

inquirer.prompt([
    {
        type: 'number',
        name: 'Nombre max',
        message: 'Saisir un nombre maximum'
    }
]).then(answer => {
    let nb = answer["Nombre max"]
    let tab = [false, false]
    tab.length = nb
    let index = tab.findIndex(e => e === undefined)

    while (index !== -1) {
        tab[index] = true

        for (let i = 2 * index; i < nb; i += index) {
            tab[i] = false
        }

        index = tab.findIndex(e => e === undefined)
    }

    tab.forEach(function (e, i) {
        if (e == true) console.log(i)
    })
})
