# AGENTS.md

## Deterministic slides and PDFs

Before committing a `.pptx` or `.pdf`, run [Determinize](https://github.com/SimonCropp/Determinize) on it,
so saving the same content again produces the same bytes and git only records real changes.

1. Install once: `dotnet tool install -g Determinize`
1. Rewrite in place: `determinize "Slides/My Talk.pptx"`
1. Check without writing: `determinize "Slides/My Talk.pptx" --check` (exit code 1 means not deterministic)

Put the path before the options. Run it on each changed file, not on the whole `Slides/` folder,
so unrelated decks aren't rewritten.

Run it until `--check` passes: decks with large TIFF or MP4 files can take a few runs to settle.

Known problems with Determinize 1.2.0 ([issue #21](https://github.com/SimonCropp/Determinize/issues/21)), and the fixes used here:

1. "Unable to read beyond the end of the stream": a JPEG is saved under a `.png` name in `ppt/media/`.
   Convert it to a real PNG (`sips -s format png in.png --out out.png`) and put it back under the same name.
1. A deck that flips between two versions forever: a large uncompressed TIFF in `ppt/media/`.
   Re-encode it losslessly with LZW (`sips -s format tiff -s formatOptions lzw in.tiff --out out.tiff`)
   and put it back under the same name.
