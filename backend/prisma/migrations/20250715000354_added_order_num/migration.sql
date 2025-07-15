/*
  Warnings:

  - Added the required column `orderNum` to the `PostWants` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_PostWants" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "guid" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,
    "skillId" INTEGER NOT NULL,
    "orderNum" INTEGER NOT NULL,
    CONSTRAINT "PostWants_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "PostWants_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_PostWants" ("guid", "id", "postId", "skillId") SELECT "guid", "id", "postId", "skillId" FROM "PostWants";
DROP TABLE "PostWants";
ALTER TABLE "new_PostWants" RENAME TO "PostWants";
CREATE UNIQUE INDEX "PostWants_guid_key" ON "PostWants"("guid");
CREATE INDEX "PostWants_skillId_idx" ON "PostWants"("skillId");
CREATE INDEX "PostWants_postId_idx" ON "PostWants"("postId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
