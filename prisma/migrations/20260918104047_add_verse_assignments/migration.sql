-- CreateTable
CREATE TABLE "VerseAssignment" (
    "id" TEXT NOT NULL,
    "automationId" TEXT NOT NULL,
    "commenterId" TEXT NOT NULL,
    "commentId" TEXT NOT NULL,
    "verseReference" TEXT NOT NULL,
    "verseText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'reserved',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sentAt" TIMESTAMP(3),

    CONSTRAINT "VerseAssignment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "VerseAssignment_automationId_commenterId_idx" ON "VerseAssignment"("automationId", "commenterId");

-- CreateIndex
CREATE UNIQUE INDEX "VerseAssignment_automationId_verseReference_key" ON "VerseAssignment"("automationId", "verseReference");

-- CreateIndex
CREATE UNIQUE INDEX "VerseAssignment_automationId_commentId_key" ON "VerseAssignment"("automationId", "commentId");

-- AddForeignKey
ALTER TABLE "VerseAssignment" ADD CONSTRAINT "VerseAssignment_automationId_fkey" FOREIGN KEY ("automationId") REFERENCES "Automation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
