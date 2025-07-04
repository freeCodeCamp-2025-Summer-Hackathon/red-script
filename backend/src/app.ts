import express from "express";
import cors from "cors";
import routes from "./routes";
import { env } from "./config/env";
import { errorHandler } from "./middlewares/errorHandler";

export function createApp() {
  const app = express();

  app.set("trust proxy", true);

  // force HTTPS 
  app.use((req, res, next) => {
    if (!req.secure) {
      return res.redirect(301, "https://" + req.headers.host + req.originalUrl);
    }
    next();
  });

  app.use(cors({ origin: `https://localhost:${env.FRONTEND_PORT}`, credentials: true }));

  app.use(express.json());
  app.use("/api", routes);
  app.use(errorHandler);

  return app;
}
