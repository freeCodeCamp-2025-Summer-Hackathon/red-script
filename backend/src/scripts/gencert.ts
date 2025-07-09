import { execSync } from "child_process";
import { existsSync, mkdirSync } from "fs";
import { join, dirname } from "path";

const key  = join(__dirname, "../../certs/key.pem");
const cert = join(__dirname, "../../certs/cert.pem");

if (existsSync(key) && existsSync(cert)) process.exit(0);
mkdirSync(dirname(key), { recursive: true });

execSync(`mkcert -key-file "${key}" -cert-file "${cert}" localhost`, {
  stdio: "inherit",
});
console.log("mkcert generated trusted localhost cert");
