# Websocket API

## JWT Secret

Using ES256 Algorithm

```bash
openssl ecparam -name prime256v1 -genkey -noout -out ecdsa_private_key.pem
openssl ec -in ecdsa_private_key.pem -pubout -out ecdsa_public_key.pem

base64 -w0 ecdsa_private_key.pem # JWT_PRIVATE_KEY
base64 -w0 ecdsa_public_key.pem # JWT_PUBLIC_KEY_KEY
```
