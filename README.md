# JWT

## Run
* `make bootstrap` 
* `. venv\bin\activate`
* generate token `./token-gen.js user1 60` - time in minutes
* verify/decode token `./token-verify.py <token>`

## Notes

https://security.stackexchange.com/questions/32768/converting-keys-between-openssl-and-openssh
### Key conversion
```bash
npm install -g rasha eckles ssh-to-jwk jwk-to-ssh
```

#### PEM to OpenSSH
RSA
```bash
asha privkey.pem > privkey.jwk.json

jwk-to-ssh privkey.jwk.json root@localhost > id_rsa

jwk-to-ssh privkey.jwk.json root@localhost public > id_rsa.pub
```
ECDSA
```bash
eckles privkey.pem > privkey.jwk.json

jwk-to-ssh privkey.jwk.json root@localhost > id_ecdsa

jwk-to-ssh privkey.jwk.json root@localhost public > id_ecdsa.pub
```

#### OpenSSH to PEM
RSA
```bash
ssh-to-jwk id_rsa > privkey.jwk.json

rasha privkey.jwk.json > privkey.pem

rasha privkey.jwk.json public > pubkey.pem
```
ECDSA
```bash
ssh-to-jwk id_ecdsa > privkey.jwk.json

eckles privkey.jwk.json > privkey.pem

eckles privkey.jwk.json public > pubkey.pem
```