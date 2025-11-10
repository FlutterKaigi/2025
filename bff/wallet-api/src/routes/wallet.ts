import { env } from "cloudflare:workers";
import { eq, getDatabase } from "@2025/database";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import { type Barcode, PKPass } from "passkit-generator";
import * as v from "valibot";
import {
	profiles,
	ticketPurchases,
	usersInAuth,
} from "../../../database/drizzle/schema";
import background from "../../assets/background.png";
import icon from "../../assets/icon.png";

const app = new Hono();
const PassQuerySchema = v.object({
	id: v.pipe(v.string(), v.uuid()),
});

app.get("/pass.pkpass", vValidator("query", PassQuerySchema), async (c) => {
	const { id } = c.req.valid("query");

	const connectingIp = c.req.header("cf-connecting-ip");
	if (connectingIp === undefined) {
		return c.json({ code: "UNAUTHORIZED", message: "Unauthorized" }, 401);
	}
	const { success: isAccepted } = await env.RATE_LIMITER.limit({
		key: connectingIp,
	});
	if (!isAccepted) {
		return c.json(
			{ code: "RATE_LIMIT_EXCEEDED", message: "Rate limit exceeded" },
			429,
		);
	}

	const db = await getDatabase(env.HYPERDRIVE.connectionString);
	const ticketPurchasesResponse = await db.query.ticketPurchases.findFirst({
		where: eq(ticketPurchases.id, id),
		with: {
			ticketPurchaseOptions: true,
			ticketType: true,
			user: true,
		},
	});
	if (
		ticketPurchasesResponse === undefined ||
		ticketPurchasesResponse.ticketType.isEntryAllowed === false
	) {
		return c.json(
			{ code: "NOT_FOUND", message: "Ticket Purchase Not found" },
			404,
		);
	}

	const user = await db.query.usersInAuth.findFirst({
		where: eq(usersInAuth.id, ticketPurchasesResponse.userId),
	});
	if (user === undefined) {
		return c.json({ code: "NOT_FOUND", message: "User Not found" }, 404);
	}
	const profile = await db.query.profiles.findFirst({
		where: eq(profiles.id, user.id),
	});

	const pass = new PKPass(
		{
			"strip@3x.png": Buffer.from(background),
			"logo@3x.png": Buffer.from(icon),
			"icon@3x.png": Buffer.from(icon),
		},
		{
			wwdr: atob(env.WWDR),
			signerCert: atob(env.SIGNER_CERTIFICATE),
			signerKey: atob(env.SIGNER_KEY),
			signerKeyPassphrase: env.SIGNER_KEY_PASS,
		},
		{
			description: "FlutterKaigi 2025 Ticket",
			organizationName: "FlutterKaigi 2025",
			passTypeIdentifier: "pass.jp.flutterkaigi.conf2025",
			teamIdentifier: "6JT949BA2M",
			serialNumber: ticketPurchasesResponse.id,
			contactVenueWebsite: "https://flutterkaigi.jp",
			backgroundColor: "rgb(255,255,255)",
			foregroundColor: "rgb(0,0,0)",
			labelColor: "rgb(0,0,0)",
			associatedStoreIdentifiers: [6753943930],
			// チケットの共有は禁止
			sharingProhibited: true,
			semantics: {
				eventName: "FlutterKaigi 2025",
				eventStartDate: "2025-11-13T09:30+09:00",
				eventEndDate: "2024-11-13T18:00+09:00",
				venueRegionName: "東京都千代田区",
				venueName: "大手町プレイス ホール&カンファレンス",
				venueLocation: {
					latitude: 35.6864688,
					longitude: 139.7649102,
				},
				eventType: "PKEventTypeConference",
			},
		},
	);
	pass.type = "eventTicket";

	// 2025/11/13 9:30 JST: 入場開始
	pass.setRelevantDate(new Date("2025-11-13T09:30+09:00"));
	// 2025/11/13 18:00 JST: 閉会
	pass.setExpirationDate(new Date("2025-11-13T18:00+09:00"));

	pass.setLocations({
		latitude: 35.6864688,
		longitude: 139.7649102,
		relevantText: "大手町プレイス ホール&カンファレンス",
	});

	const type: string = ticketPurchasesResponse.ticketTypeId.toUpperCase();

	pass.headerFields.push({
		key: "type",
		label: "TYPE",
		value: type,
	});
	pass.secondaryFields.push({
		key: "location",
		label: "LOCATION",
		value: "大手町プレイス ホール&カンファレンス",
		attributedValue:
			"<a href='https://flutterkaigi.jp'>https://flutterkaigi.jp</a>",
	});
	pass.auxiliaryFields.push({
		key: "starts-at",
		value: "2025-11-13T10:00+09:00",
		label: "STARTS-AT",
		timeStyle: "PKDateStyleShort",
		dateStyle: "PKDateStyleShort",
	});
	pass.auxiliaryFields.push(
		...[
			{
				key: "name",
				value: profile?.name ?? "N/A",
				label: "NAME",
			},
			{
				key: "section",
				value: ticketPurchasesResponse.nameplateId ?? "Z-00",
				label: "ネームプレート 区画ID",
			},
		],
	);
	pass.backFields.push(
		...[
			{
				key: "section-id",
				label: "ネームプレート 区画ID",
				value: ticketPurchasesResponse.nameplateId ?? "Z-00",
			},
			{
				key: "user-id",
				label: "ユーザID",
				value: user.id,
			},
			{
				key: "ticket-id",
				label: "チケットID",
				value: ticketPurchasesResponse.id,
			},
			{
				key: "payment-id",
				label: "決済ID",
				value:
					ticketPurchasesResponse.stripePaymentIntentId === ""
						? "N/A"
						: (ticketPurchasesResponse.stripePaymentIntentId ?? "N/A"),
			},
		],
	);

	pass.setBarcodes(
		...[
			{
				format: "PKBarcodeFormatQR",
				// Ticket ID
				message: ticketPurchasesResponse.id,
				altText: `T-${ticketPurchasesResponse.id}`,
			} satisfies Barcode,
		],
	);
	pass.preferredStyleSchemes = ["posterEventTicket", "eventTicket"];

	return new Response(pass.getAsBuffer(), {
		headers: {
			"Content-type": pass.mimeType,
			"Content-disposition": "attachment; filename=pass.pkpass",
		},
	});
});

export default app;
