import { env } from "cloudflare:workers";
import { Hono } from "hono";
import { type Barcode, PKPass } from "passkit-generator";
import background from "../../assets/background.png";
import icon from "../../assets/icon.png";

const app = new Hono();

app.get("/pass.pkpass", async (c) => {
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
      serialNumber: "asdf",
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
    }
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

  let type: string;
  switch ("general") {
    case "general": {
      type = "ATTENDEE";
      break;
    }
  }

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
        value: "Temporary Name",
        label: "NAME",
      },
      {
        key: "section",
        value: "X-00",
        label: "ネームプレート 区画ID",
      },
    ]
  );
  pass.backFields.push(
    ...[
      {
        key: "section-id",
        label: "ネームプレート 区画ID",
        value: "X-00",
      },
      {
        key: "user-id",
        label: "ユーザID",
        value: "UnknownUserID",
      },
      {
        key: "ticket-id",
        label: "チケットID",
        value: "UnknownTicketID",
      },
      {
        key: "payment-id",
        label: "決済ID",
        value: "UnknownPaymentID",
      },
    ]
  );

  pass.setBarcodes(
    ...[
      {
        format: "PKBarcodeFormatQR",
        // Ticket ID
        message: "UnknownTicketID",
        altText: `T-UnknownTicketID`,
      } satisfies Barcode,
    ]
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
