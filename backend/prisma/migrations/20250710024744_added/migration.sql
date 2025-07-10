/*
  Warnings:

  - Added the required column `orderNum` to the `PostOffers` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_PostOffers" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,
    "orderNum" INTEGER NOT NULL,
    CONSTRAINT "PostOffers_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostOffers_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_PostOffers" ("guid", "id", "postId", "skillId") SELECT "guid", "id", "postId", "skillId" FROM "PostOffers";
DROP TABLE "PostOffers";
ALTER TABLE "new_PostOffers" RENAME TO "PostOffers";
CREATE UNIQUE INDEX "PostOffers_guid_key" ON "PostOffers"("guid");
CREATE INDEX "PostOffers_skillId_idx" ON "PostOffers"("skillId");
CREATE INDEX "PostOffers_postId_idx" ON "PostOffers"("postId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
