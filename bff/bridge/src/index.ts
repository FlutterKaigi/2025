import { Container, getRandom } from '@cloudflare/containers';

export class BffEngine extends Container<
  Env & {
    SUPABASE_URL: string;
    SUPABASE_SERVICE_ROLE_KEY: string;
  }
> {
  defaultPort = 8080;
  sleepAfter = '10s';
  envVars = {
    SUPABASE_URL: this.env.SUPABASE_URL,
    SUPABASE_SERVICE_ROLE_KEY: this.env.SUPABASE_SERVICE_ROLE_KEY,
    CF_VERSION_METADATA_ID: this.env.CF_VERSION_METADATA.id,
    CF_VERSION_METADATA_TAG: this.env.CF_VERSION_METADATA.tag,
    CF_VERSION_METADATA_TIMESTAMP: this.env.CF_VERSION_METADATA.timestamp,
    HYPERDRIVE: this.env.HYPERDRIVE.connectionString,
    HYPERDRIVE_NO_CACHE: this.env.HYPERDRIVE_NO_CACHE.connectionString,
  };
}

const INSTANCE_COUNT = 1;

export default {
  fetch: async (request: Request, env: Env) => {
    const containerInstance = await getRandom(env.bff_engine, INSTANCE_COUNT);
    const response = await containerInstance.fetch(request);
    return response;
  },
};
