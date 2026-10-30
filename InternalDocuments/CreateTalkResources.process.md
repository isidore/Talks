# Create a talk resources page

Each talk has a resources page in the root of this repo, e.g. `AiInLegacyCode.md`.
The last slide of the deck shows a QR code that links to it.

## Steps

1. Name the page after the talk in PascalCase: `MyTalk.md`.
1. Copy the layout of a recent page, such as `AiInLegacyCode.md` or `Analyzers.Net.md`:
   1. `# Talk title`, then an optional one-line tagline.
   1. `## Talk Resources`: the slides first, then the links mentioned in the talk.
   1. Other sections if needed, e.g. `## Code` or `## Example Repos`.
   1. `## About Llewellyn`, ending the page like the section at the bottom of this file.
1. Link the slides with `/raw/` so they download:
   1. Slides in this repo: `https://github.com/isidore/Talks/raw/master/Slides/<file>.pptx` (spaces as `%20`).
   1. Slides in the talk's own repo: `https://github.com/LearnWithLlew/<Repo>/raw/main/slides/<file>.pptx`.
1. Commit the page.
1. Make the QR code: `./make_qr_code.sh MyTalk.md`.
   It writes `qrcodes/qr-my-talk.svg` and `.png`, linking to `github.com/isidore/Talks/blob/master/MyTalk.md`.
   Needs `brew install qrencode`. Commit both files.
1. Put the QR code on the deck's last slide, with the page's URL as text under it.
1. Run Determinize on the deck (see `AGENTS.md`), then commit it.
1. Push. The QR code only works once the page is on GitHub.

## The About Llewellyn section

Every page ends with an `## About Llewellyn` heading followed by an include of `llewellyn.md` on its own line, like this.
The build (mdsnippets) fills in the rest, so edit `llewellyn.md`, not the filled-in copy.

## About Llewellyn

include: llewellyn.md
