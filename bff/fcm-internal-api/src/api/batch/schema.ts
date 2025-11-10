import * as v from "valibot";

/**
 * FCM Notification スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.notification
 */
export const NotificationSchema = v.object({
	title: v.optional(v.string()),
	body: v.optional(v.string()),
	imageUrl: v.optional(v.string()),
});

/**
 * Android Notification スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.androidnotification
 */
export const AndroidNotificationSchema = v.object({
	title: v.optional(v.string()),
	body: v.optional(v.string()),
	icon: v.optional(v.string()),
	color: v.optional(v.string()),
	sound: v.optional(v.string()),
	tag: v.optional(v.string()),
	clickAction: v.optional(v.string()),
	bodyLocKey: v.optional(v.string()),
	bodyLocArgs: v.optional(v.array(v.string())),
	titleLocKey: v.optional(v.string()),
	titleLocArgs: v.optional(v.array(v.string())),
	channelId: v.optional(v.string()),
	ticker: v.optional(v.string()),
	sticky: v.optional(v.boolean()),
	eventTimestamp: v.optional(v.string()),
	localOnly: v.optional(v.boolean()),
	priority: v.optional(
		v.picklist([
			"PRIORITY_UNSPECIFIED",
			"PRIORITY_MIN",
			"PRIORITY_LOW",
			"PRIORITY_DEFAULT",
			"PRIORITY_HIGH",
			"PRIORITY_MAX",
		]),
	),
	vibrateTimingsMillis: v.optional(v.array(v.number())),
	defaultVibrateTimings: v.optional(v.boolean()),
	defaultSound: v.optional(v.boolean()),
	lightSettings: v.optional(
		v.object({
			color: v.object({
				red: v.number(),
				green: v.number(),
				blue: v.number(),
				alpha: v.number(),
			}),
			lightOnDurationMillis: v.number(),
			lightOffDurationMillis: v.number(),
		}),
	),
	defaultLightSettings: v.optional(v.boolean()),
	visibility: v.optional(
		v.picklist(["VISIBILITY_UNSPECIFIED", "PRIVATE", "PUBLIC", "SECRET"]),
	),
	notificationCount: v.optional(v.number()),
	image: v.optional(v.string()),
});

/**
 * Android FCM Options スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.androidfcmoptions
 */
export const AndroidFcmOptionsSchema = v.object({
	analyticsLabel: v.optional(v.string()),
});

/**
 * Android Config スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.androidconfig
 */
export const AndroidConfigSchema = v.object({
	collapseKey: v.optional(v.string()),
	priority: v.optional(v.picklist(["normal", "high"])),
	ttl: v.optional(v.number()),
	restrictedPackageName: v.optional(v.string()),
	data: v.optional(v.record(v.string(), v.string())),
	notification: v.optional(AndroidNotificationSchema),
	fcmOptions: v.optional(AndroidFcmOptionsSchema),
	directBootOk: v.optional(v.boolean()),
});

/**
 * APNS FCM Options スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.apnsfcmoptions
 */
export const ApnsFcmOptionsSchema = v.object({
	analyticsLabel: v.optional(v.string()),
	imageUrl: v.optional(v.string()),
});

/**
 * APNS Config スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.apnsconfig
 */
export const ApnsConfigSchema = v.object({
	headers: v.optional(v.record(v.string(), v.string())),
	payload: v.optional(v.record(v.string(), v.unknown())),
	fcmOptions: v.optional(ApnsFcmOptionsSchema),
});

/**
 * Webpush FCM Options スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.webpushfcmoptions
 */
export const WebpushFcmOptionsSchema = v.object({
	link: v.optional(v.string()),
	analyticsLabel: v.optional(v.string()),
});

/**
 * Webpush Notification スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.webpushnotification
 */
export const WebpushNotificationSchema = v.object({
	title: v.optional(v.string()),
	body: v.optional(v.string()),
	icon: v.optional(v.string()),
	badge: v.optional(v.string()),
	image: v.optional(v.string()),
	lang: v.optional(v.string()),
	tag: v.optional(v.string()),
	dir: v.optional(v.picklist(["auto", "ltr", "rtl"])),
	renotify: v.optional(v.boolean()),
	requireInteraction: v.optional(v.boolean()),
	silent: v.optional(v.boolean()),
	timestamp: v.optional(v.number()),
	vibrate: v.optional(v.array(v.number())),
	data: v.optional(v.unknown()),
	actions: v.optional(
		v.array(
			v.object({
				action: v.string(),
				title: v.string(),
				icon: v.optional(v.string()),
			}),
		),
	),
});

/**
 * Webpush Config スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.webpushconfig
 */
export const WebpushConfigSchema = v.object({
	headers: v.optional(v.record(v.string(), v.string())),
	data: v.optional(v.record(v.string(), v.string())),
	notification: v.optional(WebpushNotificationSchema),
	fcmOptions: v.optional(WebpushFcmOptionsSchema),
});

/**
 * FCM Options スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.fcmoptions
 */
export const FcmOptionsSchema = v.object({
	analyticsLabel: v.optional(v.string()),
});

/**
 * FCM Message スキーマ
 * https://firebase.google.com/docs/reference/admin/node/firebase-admin.messaging.message
 */
export const FcmMessageSchema = v.object({
	// Target (one of token, topic, or condition must be specified)
	token: v.optional(v.string()),
	topic: v.optional(v.string()),
	condition: v.optional(v.string()),

	// Payload
	notification: v.optional(NotificationSchema),
	data: v.optional(v.record(v.string(), v.string())),

	// Platform-specific configurations
	android: v.optional(AndroidConfigSchema),
	webpush: v.optional(WebpushConfigSchema),
	apns: v.optional(ApnsConfigSchema),

	// FCM options
	fcmOptions: v.optional(FcmOptionsSchema),
});

/**
 * Batch 送信リクエストのスキーマ
 */
export const BatchSendRequestSchema = v.object({
	messages: v.pipe(v.array(FcmMessageSchema), v.minLength(1), v.maxLength(500)),
	validateOnly: v.optional(v.boolean()),
});

export type BatchSendRequest = v.InferOutput<typeof BatchSendRequestSchema>;
export type FcmMessage = v.InferOutput<typeof FcmMessageSchema>;
export type Notification = v.InferOutput<typeof NotificationSchema>;
export type AndroidConfig = v.InferOutput<typeof AndroidConfigSchema>;
export type AndroidNotification = v.InferOutput<
	typeof AndroidNotificationSchema
>;
export type ApnsConfig = v.InferOutput<typeof ApnsConfigSchema>;
export type WebpushConfig = v.InferOutput<typeof WebpushConfigSchema>;
export type FcmOptions = v.InferOutput<typeof FcmOptionsSchema>;
