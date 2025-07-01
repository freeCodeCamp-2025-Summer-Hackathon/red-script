import express from "express";
import cors from "cors";
import { PrismaClient } from "../generated/prisma";

const app = express();
const db = new PrismaClient();

app.use(cors({ origin: "http://localhost:3000" }));
app.use(express.json());

app.get("/api/users", async (req, res) => {
  const users = await db.user.findMany();
  res.json(users);
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Backend listening on http://localhost:${PORT}`);
});