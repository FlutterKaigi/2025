import { env } from "cloudflare:workers";
import { Jwt } from "hono/utils/jwt";
import * as v from "valibot";

export const WebsocketTicketSchema = v.object({
	iss: v.pipe(v.string(), v.literal("https://github.com/FlutterKaigi/2025")),
	sub: v.string(),
	type: v.literal("USER"),
	iat: v.pipe(v.number(), v.integer()),
	exp: v.pipe(v.number(), v.integer()),
});

function removePemBoundary(pem: string) {
	const beginPrivateKey = "-----BEGIN PRIVATE KEY-----";
	const endPrivateKey = "-----END PRIVATE KEY-----";
	const beginPublicKey = "-----BEGIN PUBLIC KEY-----";
	const endPublicKey = "-----END PUBLIC KEY-----";
	return pem
		.trim()
		.replace(beginPrivateKey, "")
		.replace(endPrivateKey, "")
		.replace(beginPublicKey, "")
		.replace(endPublicKey, "");
}

export async function verifyTicket(ticket: string) {
	const publicKey = await crypto.subtle.importKey(
		"spki",
		Buffer.from(
			removePemBoundary(
				Buffer.from(env.JWT_PUBLIC_KEY, "base64").toString("utf-8"),
			),
			"base64",
		),
		{ name: "ECDSA", namedCurve: "P-256" },
		false,
		["verify"],
	);

	const token = await Jwt.verify(ticket, publicKey, "ES256");
	return v.parse(WebsocketTicketSchema, token);
}

export async function generateTicket(userId: string) {
	const privateKey = await crypto.subtle.importKey(
		"pkcs8",
		Buffer.from(
			removePemBoundary(
				Buffer.from(env.JWT_PRIVATE_KEY, "base64").toString("utf-8"),
			),
			"base64",
		),
		{ name: "ECDSA", namedCurve: "P-256" },
		false,
		["sign"],
	);

	const expiration = 60 * 5; // 5 minutes
	const payload = {
		iss: "https://github.com/FlutterKaigi/2025",
		type: "USER",
		sub: userId,
		iat: Math.floor(Date.now() / 1000),
		exp: Math.floor(Date.now() / 1000) + expiration,
	} satisfies v.InferOutput<typeof WebsocketTicketSchema>;
	const token = await Jwt.sign(payload, privateKey, "ES256");
	return token;
}
