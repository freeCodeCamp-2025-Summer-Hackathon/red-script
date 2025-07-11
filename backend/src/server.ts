import https from "https";
import fs from "fs";
import { env } from "./config/env";
import { createApp } from "./app";
import { ensureContainer } from "./services/azureBlob.service";

const app = createApp();

const key  = fs.readFileSync("certs/key.pem");
const cert = fs.readFileSync("certs/cert.pem");

https
  .createServer({ key, cert }, app)
  .listen(env.PORT, () =>
    console.log(`API running at https://localhost:${env.PORT}`)
  );



(async () => {

    await ensureContainer();
    const app = createApp();

    const key  = fs.readFileSync("certs/key.pem");
    const cert = fs.readFileSync("certs/cert.pem");

    https
    .createServer({ key, cert }, app)
    .listen(env.PORT, () =>
        console.log(`API running at https://localhost:${env.PORT}`)
    );

})();
