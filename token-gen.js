#!/usr/bin/env node

const jwt = require('jsonwebtoken');
const fs = require('fs');

if (process.argv.length < 4) {
    console.error('arguments required: username time_in_minutes')
    process.exit(1)
}

const user = process.argv[2]
const minutes = process.argv[3]

const privateKey = fs.readFileSync('./keys/key.pem', 'utf8');

const payload = {
    user: user,
};

const signOptions = {
    algorithm: 'RS256',
    expiresIn: minutes + 'm'
};

const token = jwt.sign(payload, privateKey, signOptions);

console.log(token);

