# AGENTS.md

## Deterministic slides and PDFs

Before committing a `.pptx` or `.pdf`, run [Determinize](https://github.com/SimonCropp/Determinize) on it,
so saving the same content again produces the same bytes and git only records real changes.

1. Install once: `dotnet tool install -g Determinize`
1. Rewrite in place: `determinize "Slides/My Talk.pptx"`
1. Check without writing: `determinize "Slides/My Talk.pptx" --check` (exit code 1 means not deterministic)

Put the path before the options. Run it on each changed file, not on the whole `Slides/` folder,
so unrelated decks aren't rewritten.

Known problems with Determinize 1.2.0:

1. `Cutting Code Quickly.pptx` and `Zero day bugs.pptx` fail with "Unable to read beyond the end of the stream"; leave them as they are.
1. `Pair Programming.pptx`, `Remote Mob Programming.pptx`, `ROI on Learning Hour.pptx` and
   `Lessons learned from The Phoenix Project and The Goal.pptx` flip between two versions on every run,
   so `--check` never passes. Run it once and commit.
