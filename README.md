# red-script

Monorepo for a SkillSwap, using:

- Vue 3 (Vite, TypeScript) frontend
- Express (TypeScript) backend with Prisma
- SQLite database

---

## Prerequisites

- Node.js
- pnpm

Install pnpm globally if needed:

    npm install -g pnpm

---

## Clone the Repository

    git clone https://github.com/freeCodeCamp-2025-Summer-Hackathon/red-script.git
    cd red-script

---

## Install Dependencies

Run this from the repo root:

    pnpm install

This installs dependencies for both frontend and backend.

---

## Database Setup (SQLite)

Run migrations:

    cd backend
    npx prisma migrate dev --name init


Launch Prisma Studio to inspect & insert data whenever needed

    npx prisma studio

---

## Run the Backend

From the backend folder:

    cd backend
    pnpm dev

Backend runs at:

    http://localhost:4000

---

## Run the Frontend

In another terminal:

    cd frontend
    pnpm dev

Frontend runs at:

    http://localhost:3000