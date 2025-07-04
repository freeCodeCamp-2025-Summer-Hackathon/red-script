import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import fs from 'fs';
import path from 'path';

const key  = fs.readFileSync(
  path.resolve(__dirname, '../backend/certs/key.pem')
);
const cert = fs.readFileSync(
  path.resolve(__dirname, '../backend/certs/cert.pem')
);

export default defineConfig({
  plugins: [vue()],
  root: './',
  server: {
    https: { key, cert },
    port: 3000,
  },
});
