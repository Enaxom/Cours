let inquirer = require('inquirer')

inquirer.prompt([
    {
        // Saisie d'un nombre max pour l'utilisateur
        type: 'number',
        name: 'Nombre max',
        message: 'Saisir un nombre maximum'
    }
]).then(answer => {
    let nb = answer["Nombre max"]
    // Initialisation de 0 et 1
    let tab = [false, false]
    tab.length = nb
    // Recherche de la prochaine case vide
    let index = tab.findIndex(e => e === undefined)

    while (index !== -1) {
        // La prochaine case vide est un nombre premier
        tab[index] = true

        // Tous les multiples de tab[index] ne sont pas premiers
        for (let i = 2 * index; i < nb; i += index) {
            tab[i] = false
        }

        // Recherche prochaine case vide
        index = tab.findIndex(e => e === undefined)
    }

    tab.forEach(function (e, i) {
        // Affichage des nombres premiers
        if (e == true) console.log(i)
    })
})
