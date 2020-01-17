#!/usr/bin/node

// let math = require('./mathModule.js')
// let x = math.square(4 * math.pi);

let {pi, e} = require('./mathModule')


let arguments = process.argv
arguments.splice(0, 2) // Supprimer les deux éléments du début

// /!\ reduce, map, all, find, filter, foreach /!\
/*
let sum = 0
arguments.forEach(function(argument) {
	let arg = parseInt(argument)
	sum += arg
})
*/

let sum = arguments.reduce(function(accu, argument) {
	return accu + parseInt(argument)
}, 0)

console.log('sum', sum)
