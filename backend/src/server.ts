import https from "https";
import fs from "fs";
import { env } from "./config/env";
import { createApp } from "./app";
import { PrismaClient } from "../generated/prisma";
import express, { Request, Response } from "express";

const app = createApp();
const key = fs.readFileSync("certs/key.pem");
const cert = fs.readFileSync("certs/cert.pem");
const prisma = new PrismaClient();

// ************************************************************************

app.get('/getskills', async (req: Request, res: Response) => {
  const allSkills = await prisma.skills.findMany({
    select: {
      guid: true,
      name: true,
    },
  });
  res.json(allSkills)
})

// ************************************************************************



app.post('/postSkill', async (req: Request, res: Response) => {
  const { name } = req.body
  const postSkill = await prisma.skills.create({
    data: {
      name: name
    },
  })
  res.status(201).json(postSkill)
})

app.delete('/deleteAll', async(req: Request, res: Response) =>{
  const deleteAll = await prisma.skills.deleteMany({})
  res.status(201)
})


https
  .createServer({ key, cert }, app)
  .listen(env.PORT, () =>
    console.log(`API running at https://localhost:${env.PORT}`)
  );
