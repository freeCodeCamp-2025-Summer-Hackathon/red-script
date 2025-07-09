import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import tailwindcss from '@tailwindcss/vite';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const key = fs.readFileSync(
  path.resolve(__dirname, '../backend/certs/key.pem')
);
const cert = fs.readFileSync(
  path.resolve(__dirname, '../backend/certs/cert.pem')
);

export default defineConfig({
  plugins: [vue(), tailwindcss()],
  root: "./",
  server: {
    https: { key, cert },
    port: 3000,
  },
});
