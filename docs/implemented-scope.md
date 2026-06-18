# Implemented Scope

This project is intentionally honest about what has and has not been implemented.

## Implemented

- A Codex skill for faithful old-photo restoration.
- Quality gates for accepting/rejecting AI restoration candidates.
- Prompt templates for:
  - general single photos,
  - phone-shot photos with borders,
  - large group photos,
  - strong damage across faces,
  - retrying after face redraw.
- A final-photo packaging script.
- A restoration log template.
- Case notes from a real 20-photo workflow.
- Privacy-first repository layout that ignores private outputs.

## Proven In A Real Workflow

The following workflow was used in practice:

1. Start from original family photos photographed by phone.
2. Crop away table/background/frame/border.
3. Use AI restoration candidates for some photos.
4. Reject AI candidates that redraw faces.
5. Use conservative local repair for risky photos.
6. Package only final approved photos.
7. Correct a packaging mistake where a less clear source entered the zip.

## Not Implemented

- No new restoration model.
- No end-to-end one-click app.
- No automatic face-identity similarity scoring.
- No ComfyUI workflow yet.
- No web UI.
- No public before/after demo images yet.

## Future Work

These are useful extensions, but they should not be described as current capabilities:

- Add a local preprocessing script for rotation/crop/contact-sheet generation.
- Add public-domain before/after examples.
- Add a ComfyUI workflow.
- Add an optional checklist UI for manual QA.
- Add automatic final-folder vs zip verification.
