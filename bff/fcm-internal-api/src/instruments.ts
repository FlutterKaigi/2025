import { getNodeAutoInstrumentations } from "@opentelemetry/auto-instrumentations-node";
import { OTLPMetricExporter } from "@opentelemetry/exporter-metrics-otlp-proto";
import { OTLPTraceExporter } from "@opentelemetry/exporter-trace-otlp-proto";
import { PeriodicExportingMetricReader } from "@opentelemetry/sdk-metrics";
import * as opentelemetry from "@opentelemetry/sdk-node";

export const sdk = new opentelemetry.NodeSDK({
	traceExporter: new OTLPTraceExporter({
		url: "https://otlp.flutterkaigi.jp/v1/traces",
		headers: {
			"x-flutterkaigi-service-name": "fcm-internal-api",
		},
	}),
	metricReader: new PeriodicExportingMetricReader({
		exporter: new OTLPMetricExporter({
			url: "https://otlp.flutterkaigi.jp/v1/metrics",
			headers: {
				"x-flutterkaigi-service-name": "fcm-internal-api",
			},
		}),
	}),
	instrumentations: [getNodeAutoInstrumentations()],
	serviceName: "fcm-internal-api",
	autoDetectResources: true,
});
