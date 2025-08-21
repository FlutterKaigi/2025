import { env } from "cloudflare:workers";
import { Container, getRandom } from "@cloudflare/containers";

export class BffEngine extends Container<Cloudflare.Env> {
	defaultPort = 8080;
	sleepAfter = "30s";
	envVars = {
		SUPABASE_URL: env.SUPABASE_URL,
		SUPABASE_SERVICE_ROLE_KEY: env.SUPABASE_SERVICE_ROLE_KEY,
		CF_VERSION_METADATA_ID: env.CF_VERSION_METADATA.id,
		CF_VERSION_METADATA_TAG: env.CF_VERSION_METADATA.tag,
		CF_VERSION_METADATA_TIMESTAMP: env.CF_VERSION_METADATA.timestamp,
		POSTGRES_URL: env.POSTGRES_URL,
		X_API_KEY: env.X_API_KEY,
		INTERNAL_API_URL: env.INTERNAL_API_URL,
	};
}

const INSTANCE_COUNT = 1;

export default {
	fetch: async (request: Request, env: Cloudflare.Env) => {
		const containerInstance = await getRandom(env.bff_engine, INSTANCE_COUNT);
		const response = await containerInstance.fetch(request);
		return response;
	},
};
