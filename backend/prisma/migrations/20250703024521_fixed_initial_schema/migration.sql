/*
  Warnings:

  - You are about to drop the `ContactMethod` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ContactMethodType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Conversation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PictureType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostOffer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostType` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PostWant` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Review` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Skill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Swap` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SwapStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TradeRequest` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TradeRequestStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserPicture` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ContactMethod";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ContactMethodType";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Conversation";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Message";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "PictureType";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Post";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "PostOffer";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "PostType";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "PostWant";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Review";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Skill";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Swap";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "SwapStatus";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "TradeRequest";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "TradeRequestStatus";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "UserPicture";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
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

-- CreateTable
CREATE TABLE "UserPictures" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "pictureTypeId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "UserPictures_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "UserPictures_pictureTypeId_fkey" FOREIGN KEY ("pictureTypeId") REFERENCES "PictureTypes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PictureTypes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ContactMethods" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT true,
    "typeId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "ContactMethods_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "ContactMethods_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "ContactMethodTypes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ContactMethodTypes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parentSkillId" INTEGER,
    CONSTRAINT "Skills_parentSkillId_fkey" FOREIGN KEY ("parentSkillId") REFERENCES "Skills" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Tags" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parentTagId" INTEGER,
    CONSTRAINT "Tags_parentTagId_fkey" FOREIGN KEY ("parentTagId") REFERENCES "Tags" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Posts" (
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
    CONSTRAINT "Posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Posts_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "PostTypes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PostTypes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PostOffers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,
    CONSTRAINT "PostOffers_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostOffers_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PostWants" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,
    CONSTRAINT "PostWants_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostWants_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PostTags" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "postId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    CONSTRAINT "PostTags_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostTags_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tags" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "TradeRequests" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "respondedOn" DATETIME,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "postId" INTEGER NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,
    CONSTRAINT "TradeRequests_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "TradeRequests_fromUserId_fkey" FOREIGN KEY ("fromUserId") REFERENCES "Users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "TradeRequests_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "TradeRequestStatuses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "TradeRequestStatuses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Swaps" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "startOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endOn" DATETIME,
    "tradeRequestId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,
    CONSTRAINT "Swaps_tradeRequestId_fkey" FOREIGN KEY ("tradeRequestId") REFERENCES "TradeRequests" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Swaps_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "SwapStatuses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SwapStatuses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Reviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "swapId" INTEGER NOT NULL,
    "reviewerId" INTEGER NOT NULL,
    "revieweeId" INTEGER NOT NULL,
    "skillId" INTEGER,
    CONSTRAINT "Reviews_swapId_fkey" FOREIGN KEY ("swapId") REFERENCES "Swaps" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Reviews_reviewerId_fkey" FOREIGN KEY ("reviewerId") REFERENCES "Users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Reviews_revieweeId_fkey" FOREIGN KEY ("revieweeId") REFERENCES "Users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Reviews_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Conversations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "createdOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "tradeRequestId" INTEGER NOT NULL,
    CONSTRAINT "Conversations_tradeRequestId_fkey" FOREIGN KEY ("tradeRequestId") REFERENCES "TradeRequests" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Messages" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "sentOn" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "readOn" DATETIME,
    "conversationId" INTEGER NOT NULL,
    "senderId" INTEGER NOT NULL,
    CONSTRAINT "Messages_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "Conversations" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Messages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "Users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_guid_key" ON "Users"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Users_username_key" ON "Users"("username");

-- CreateIndex
CREATE INDEX "Users_latitude_longitude_idx" ON "Users"("latitude", "longitude");

-- CreateIndex
CREATE UNIQUE INDEX "UserPictures_guid_key" ON "UserPictures"("guid");

-- CreateIndex
CREATE INDEX "UserPictures_userId_idx" ON "UserPictures"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "PictureTypes_guid_key" ON "PictureTypes"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "PictureTypes_name_key" ON "PictureTypes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ContactMethods_guid_key" ON "ContactMethods"("guid");

-- CreateIndex
CREATE INDEX "ContactMethods_userId_idx" ON "ContactMethods"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ContactMethodTypes_guid_key" ON "ContactMethodTypes"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "ContactMethodTypes_name_key" ON "ContactMethodTypes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Skills_guid_key" ON "Skills"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Skills_name_key" ON "Skills"("name");

-- CreateIndex
CREATE INDEX "Skills_parentSkillId_idx" ON "Skills"("parentSkillId");

-- CreateIndex
CREATE UNIQUE INDEX "Tags_guid_key" ON "Tags"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Tags_name_key" ON "Tags"("name");

-- CreateIndex
CREATE INDEX "Tags_parentTagId_idx" ON "Tags"("parentTagId");

-- CreateIndex
CREATE UNIQUE INDEX "Posts_guid_key" ON "Posts"("guid");

-- CreateIndex
CREATE INDEX "Posts_isActive_idx" ON "Posts"("isActive");

-- CreateIndex
CREATE UNIQUE INDEX "PostTypes_guid_key" ON "PostTypes"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "PostTypes_name_key" ON "PostTypes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PostOffers_guid_key" ON "PostOffers"("guid");

-- CreateIndex
CREATE INDEX "PostOffers_skillId_idx" ON "PostOffers"("skillId");

-- CreateIndex
CREATE INDEX "PostOffers_postId_idx" ON "PostOffers"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "PostWants_guid_key" ON "PostWants"("guid");

-- CreateIndex
CREATE INDEX "PostWants_skillId_idx" ON "PostWants"("skillId");

-- CreateIndex
CREATE INDEX "PostWants_postId_idx" ON "PostWants"("postId");

-- CreateIndex
CREATE INDEX "PostTags_tagId_idx" ON "PostTags"("tagId");

-- CreateIndex
CREATE UNIQUE INDEX "PostTags_postId_tagId_key" ON "PostTags"("postId", "tagId");

-- CreateIndex
CREATE UNIQUE INDEX "TradeRequests_guid_key" ON "TradeRequests"("guid");

-- CreateIndex
CREATE INDEX "TradeRequests_postId_idx" ON "TradeRequests"("postId");

-- CreateIndex
CREATE INDEX "TradeRequests_fromUserId_idx" ON "TradeRequests"("fromUserId");

-- CreateIndex
CREATE UNIQUE INDEX "TradeRequestStatuses_guid_key" ON "TradeRequestStatuses"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "TradeRequestStatuses_name_key" ON "TradeRequestStatuses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Swaps_guid_key" ON "Swaps"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Swaps_tradeRequestId_key" ON "Swaps"("tradeRequestId");

-- CreateIndex
CREATE INDEX "Swaps_statusId_idx" ON "Swaps"("statusId");

-- CreateIndex
CREATE UNIQUE INDEX "SwapStatuses_guid_key" ON "SwapStatuses"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "SwapStatuses_name_key" ON "SwapStatuses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Reviews_guid_key" ON "Reviews"("guid");

-- CreateIndex
CREATE INDEX "Reviews_skillId_idx" ON "Reviews"("skillId");

-- CreateIndex
CREATE INDEX "Reviews_revieweeId_idx" ON "Reviews"("revieweeId");

-- CreateIndex
CREATE UNIQUE INDEX "Conversations_guid_key" ON "Conversations"("guid");

-- CreateIndex
CREATE UNIQUE INDEX "Conversations_tradeRequestId_key" ON "Conversations"("tradeRequestId");

-- CreateIndex
CREATE UNIQUE INDEX "Messages_guid_key" ON "Messages"("guid");

-- CreateIndex
CREATE INDEX "Messages_conversationId_idx" ON "Messages"("conversationId");

-- CreateIndex
CREATE INDEX "Messages_senderId_idx" ON "Messages"("senderId");
