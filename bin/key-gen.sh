ssh-keygen -t rsa -b 4096 -m RFC4716 -f keys/key -N ""
chmod 600 keys/key
ssh-to-jwk keys/key > keys/privkey.jwk.json
rasha keys/privkey.jwk.json > keys/key.pem
chmod 600 keys/key.pem


