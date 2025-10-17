import * as admin from "firebase-admin";

let firebaseApp: admin.app.App | undefined;

/**
 * Firebase Admin SDK を初期化する
 */
export function initializeFirebase(): admin.app.App {
	if (firebaseApp) {
		return firebaseApp;
	}

	const serviceAccountJson = process.env.FIREBASE_SERVICE_ACCOUNT_JSON;
	if (!serviceAccountJson) {
		throw new Error("FIREBASE_SERVICE_ACCOUNT_JSON environment variable is not set");
	}

	try {
		const serviceAccount = JSON.parse(serviceAccountJson);
		firebaseApp = admin.initializeApp({
			credential: admin.credential.cert(serviceAccount),
		});
		return firebaseApp;
	} catch (error) {
		console.error("Failed to initialize Firebase:", error);
		throw new Error("Failed to initialize Firebase Admin SDK");
	}
}

/**
 * Firebase Messaging インスタンスを取得する
 */
export function getMessaging(): admin.messaging.Messaging {
	if (!firebaseApp) {
		initializeFirebase();
	}
	return admin.messaging();
}
