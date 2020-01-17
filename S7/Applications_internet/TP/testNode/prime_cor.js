#!/usr/bin/node

// Correction erathosthène
const N = 100
const sqrtN = Math.sqrt(N)
const primes = []

for (let nextPrime = 2; nextPrime < sqrtN; nextPrime++) {
    if (primes[nextPrime] !== undefined) continue
    // nextPrime is prime
    for (let multiple = nextPrime*2; multiple < N; multiple += nextPrime) {
        primes[multiple] = 0
    }
}

for (let i = 2; i < N; i++) {
    if (primes[i] !== undefined) continue
    console.log(i)
}
