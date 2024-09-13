#!/usr/bin/env python
import jwt
import sys
from cryptography.hazmat.primitives import serialization


public_key = open('./keys/key.pub', 'rb').read()
public_secret = serialization.load_ssh_public_key(public_key)

try:
    token = sys.argv[1]
except:
    print('argument required jwt_token')
    exit(1)

try:
    decoded_jwt = jwt.decode(token, public_secret, algorithms=["RS256"])
    print(decoded_jwt)
except jwt.ExpiredSignatureError:
    print("Token has expired")
except jwt.InvalidTokenError:
    print("Invalid token")