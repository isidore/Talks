# AGENTS.md

## Deterministic slides and PDFs

Before committing a `.pptx` or `.pdf`, run [Determinize](https://github.com/SimonCropp/Determinize) on it,
so saving the same content again produces the same bytes and git only records real changes.

1. Install once: `dotnet tool install -g Determinize`
1. Rewrite in place: `determinize "Slides/My Talk.pptx"`
1. Check without writing: `determinize "Slides/My Talk.pptx" --check` (exit code 1 means not deterministic)

Put the path before the options. Run it on each changed file, not on the whole `Slides/` folder,
so unrelated decks aren't rewritten.

Known problems with Determinize 1.2.0 ([issue #21](https://github.com/SimonCropp/Determinize/issues/21)):

1. `Cutting Code Quickly.pptx` and `Zero day bugs.pptx` fail with "Unable to read beyond the end of the stream".
   Each has a JPEG saved under a `.png` name; leave them as they are.
1. Large TIFF or MP4 entries get recompressed a few bytes differently on each run. Most decks settle after
   a few runs; `Pair Programming.pptx` flips between two versions forever, so its `--check` never passes.
   Run it once and commit.
