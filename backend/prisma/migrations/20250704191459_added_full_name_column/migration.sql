/*
  Warnings:

  - Added the required column `fullName` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "bio" TEXT,
    "timezoneOffset" INTEGER NOT NULL,
    "latitude" REAL,
    "longitude" REAL,
    "zip" TEXT,
    "city" TEXT,
    "state" TEXT,
    "country" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Users" ("bio", "city", "country", "createdAt", "email", "guid", "id", "isActive", "latitude", "longitude", "password", "state", "timezoneOffset", "username", "zip") SELECT "bio", "city", "country", "createdAt", "email", "guid", "id", "isActive", "latitude", "longitude", "password", "state", "timezoneOffset", "username", "zip" FROM "Users";
DROP TABLE "Users";
ALTER TABLE "new_Users" RENAME TO "Users";
CREATE UNIQUE INDEX "Users_guid_key" ON "Users"("guid");
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");
CREATE UNIQUE INDEX "Users_username_key" ON "Users"("username");
CREATE INDEX "Users_latitude_longitude_idx" ON "Users"("latitude", "longitude");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
