/*
  Warnings:

  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - The required column `guid` was added to the `User` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `password` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timezoneOffset` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "UserPicture" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "pictureTypeId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "UserPicture_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "UserPicture_pictureTypeId_fkey" FOREIGN KEY ("pictureTypeId") REFERENCES "PictureType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PictureType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ContactMethod" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT true,
    "typeId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "ContactMethod_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "ContactMethod_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ContactMethodType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ContactMethodType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isTag" BOOLEAN NOT NULL DEFAULT false,
    "parentSkillId" INTEGER,
    CONSTRAINT "Skill_parentSkillId_fkey" FOREIGN KEY ("parentSkillId") REFERENCES "Skill" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "radius" REAL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedOn" DATETIME NOT NULL,
    "typeId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Post_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "PostType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PostType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PostOffer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,
    CONSTRAINT "PostOffer_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostOffer_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PostWant" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,
    CONSTRAINT "PostWant_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostWant_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "TradeRequest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "respondedOn" DATETIME,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "postId" INTEGER NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,
    CONSTRAINT "TradeRequest_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "TradeRequest_fromUserId_fkey" FOREIGN KEY ("fromUserId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "TradeRequest_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "TradeRequestStatus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "TradeRequestStatus" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Swap" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "startOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endOn" DATETIME,
    "tradeRequestId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,
    CONSTRAINT "Swap_tradeRequestId_fkey" FOREIGN KEY ("tradeRequestId") REFERENCES "TradeRequest" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Swap_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "SwapStatus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SwapStatus" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Review" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "swapId" INTEGER NOT NULL,
    "reviewerId" INTEGER NOT NULL,
    "revieweeId" INTEGER NOT NULL,
    "skillId" INTEGER,
    CONSTRAINT "Review_swapId_fkey" FOREIGN KEY ("swapId") REFERENCES "Swap" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Review_reviewerId_fkey" FOREIGN KEY ("reviewerId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Review_revieweeId_fkey" FOREIGN KEY ("revieweeId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Review_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Conversation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "tradeRequestId" INTEGER NOT NULL,
    CONSTRAINT "Conversation_tradeRequestId_fkey" FOREIGN KEY ("tradeRequestId") REFERENCES "TradeRequest" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Message" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "sentOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "readOn" DATETIME,
    "conversationId" INTEGER NOT NULL,
    "senderId" INTEGER NOT NULL,
    CONSTRAINT "Message_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "Conversation" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Message_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "bio" TEXT,
    "timezoneOffset" INTEGER NOT NULL,
    "latitude" REAL,
    "longitude" REAL,
    "zip" TEXT,
    "city" TEXT,
    "state" TEXT,
    "country" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_User" ("email", "id") SELECT "email", "id" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_guid_key" ON "User"("guid");
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE INDEX "User_latitude_longitude_idx" ON "User"("latitude", "longitude");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "UserPicture_guid_key" ON "UserPicture"("guid");

-- CreateIndex
CREATE INDEX "UserPicture_userId_idx" ON "UserPicture"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "PictureType_guid_key" ON "PictureType"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "PictureType_name_key" ON "PictureType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ContactMethod_guid_key" ON "ContactMethod"("guid");

-- CreateIndex
CREATE INDEX "ContactMethod_userId_idx" ON "ContactMethod"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ContactMethodType_guid_key" ON "ContactMethodType"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "ContactMethodType_name_key" ON "ContactMethodType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Skill_guid_key" ON "Skill"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Skill_name_key" ON "Skill"("name");

-- CreateIndex
CREATE INDEX "Skill_parentSkillId_idx" ON "Skill"("parentSkillId");

-- CreateIndex
CREATE UNIQUE INDEX "Post_guid_key" ON "Post"("guid");

-- CreateIndex
CREATE INDEX "Post_isActive_idx" ON "Post"("isActive");

-- CreateIndex
CREATE UNIQUE INDEX "PostType_guid_key" ON "PostType"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "PostType_name_key" ON "PostType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PostOffer_guid_key" ON "PostOffer"("guid");

-- CreateIndex
CREATE INDEX "PostOffer_skillId_idx" ON "PostOffer"("skillId");

-- CreateIndex
CREATE INDEX "PostOffer_postId_idx" ON "PostOffer"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "PostWant_guid_key" ON "PostWant"("guid");

-- CreateIndex
CREATE INDEX "PostWant_skillId_idx" ON "PostWant"("skillId");

-- CreateIndex
CREATE INDEX "PostWant_postId_idx" ON "PostWant"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "TradeRequest_guid_key" ON "TradeRequest"("guid");

-- CreateIndex
CREATE INDEX "TradeRequest_postId_idx" ON "TradeRequest"("postId");

-- CreateIndex
CREATE INDEX "TradeRequest_fromUserId_idx" ON "TradeRequest"("fromUserId");

-- CreateIndex
CREATE UNIQUE INDEX "TradeRequestStatus_guid_key" ON "TradeRequestStatus"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "TradeRequestStatus_name_key" ON "TradeRequestStatus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Swap_guid_key" ON "Swap"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Swap_tradeRequestId_key" ON "Swap"("tradeRequestId");

-- CreateIndex
CREATE INDEX "Swap_statusId_idx" ON "Swap"("statusId");

-- CreateIndex
CREATE UNIQUE INDEX "SwapStatus_guid_key" ON "SwapStatus"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "SwapStatus_name_key" ON "SwapStatus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Review_guid_key" ON "Review"("guid");

-- CreateIndex
CREATE INDEX "Review_skillId_idx" ON "Review"("skillId");

-- CreateIndex
CREATE INDEX "Review_revieweeId_idx" ON "Review"("revieweeId");

-- CreateIndex
CREATE UNIQUE INDEX "Conversation_guid_key" ON "Conversation"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Conversation_tradeRequestId_key" ON "Conversation"("tradeRequestId");

-- CreateIndex
CREATE UNIQUE INDEX "Message_guid_key" ON "Message"("guid");

-- CreateIndex
CREATE INDEX "Message_conversationId_idx" ON "Message"("conversationId");

-- CreateIndex
CREATE INDEX "Message_senderId_idx" ON "Message"("senderId");
