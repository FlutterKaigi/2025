import { generateKeyPairSync } from "node:crypto";
import { writeFile } from "node:fs/promises";

const { privateKey, publicKey } = generateKeyPairSync("ec", {
  namedCurve: "P-256",
  privateKeyEncoding: { format: "pem", type: "pkcs8" },
  publicKeyEncoding: { format: "pem", type: "spki" },
});

await writeFile("ecdsa_private_key.pem", privateKey);
await writeFile("ecdsa_public_key.pem", publicKey);
