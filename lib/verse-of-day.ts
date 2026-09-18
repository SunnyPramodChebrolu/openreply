export type Verse = {
  reference: string;
  text: string;
};

export type VerseHistoryEntry = {
  commenterId: string;
  verseReference: string;
};

export function chooseVerse(
  verses: Verse[],
  commenterHistory: string[],
  globallyUsedReferences: string[],
): Verse | null {
  if (verses.length === 0) return null;

  const commenterUsed = new Set(commenterHistory);
  const globallyUsed = new Set(globallyUsedReferences);

  // First: choose a verse nobody in this campaign has received yet.
  const globallyUnused = verses.filter(
    (verse) => !globallyUsed.has(verse.reference),
  );

  if (globallyUnused.length > 0) {
    return globallyUnused[
      Math.floor(Math.random() * globallyUnused.length)
    ];
  }

  // Once the whole library has been used, choose one this commenter
  // has not received yet.
  const commenterUnused = verses.filter(
    (verse) => !commenterUsed.has(verse.reference),
  );

  if (commenterUnused.length > 0) {
    return commenterUnused[
      Math.floor(Math.random() * commenterUnused.length)
    ];
  }

  // This commenter has exhausted the entire library.
  return verses[Math.floor(Math.random() * verses.length)];
}
 