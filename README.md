# Faithful Photo Restoration

AI old photo restoration is easy to demo and hard to deliver.

Most tools can make an old photo look sharper. The hard part is making sure the restored photo still shows the same people, has no phone-shot desk border, and does not accidentally replace a family member with an AI-generated face.

**Faithful Photo Restoration** is a practical workflow and Codex skill for restoring scanned or phone-shot family photos with identity preservation as the first priority.

It is not another restoration model. It is the QA layer around AI restoration.

## What This Project Does

- Straightens phone-shot old photos so they feel like flat scans.
- Removes desk/table background, album mats, paper borders, photo frames, date strips, and title edges.
- Keeps black-and-white photos black-and-white and color photos color.
- Uses AI restoration as a candidate, not an automatic final answer.
- Rejects AI outputs that redraw faces, add/remove people, change clothes, or invent details.
- Falls back to conservative local repair when AI is unsafe.
- Packages only final approved photos, avoiding candidate/source mix-ups.

## What This Project Does Not Do

- It does not provide a new neural network model.
- It does not promise one-click fully automatic restoration.
- It does not guarantee true facial reconstruction from extremely blurry or damaged sources.
- It does not colorize by default.
- It does not include private family-photo examples.

## Why It Exists

During a real 20-photo family restoration workflow, three failure modes showed up immediately:

1. **The photo was not actually scanned.** It was photographed on a table, so the desk, frame, paper edge, and skew had to be removed first.
2. **AI made some photos look better but less faithful.** Large group photos were especially risky because small faces could be redrawn.
3. **The wrong file can enter the final zip.** A zip file does not reduce image quality; if a zipped photo looks worse, the wrong source image probably entered the package.

This project turns those lessons into a repeatable workflow.

## The Core Principle

> AI output is a candidate, not the final answer.

Every candidate must pass quality gates:

- Same people count.
- Same faces and age impression.
- Same clothing, pose, and scene relationship.
- No desk/table/frame/paper border.
- No glamour retouching or modernized details.
- Final package contains only approved finished images.

If a candidate fails, use a conservative local version.

## Repository Contents

```text
.
├── README.md
├── docs/implemented-scope.md
├── skills/
│   └── faithful-photo-restoration/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       └── references/
│           ├── prompt-templates.md
│           └── quality-gates.md
├── docs/
│   ├── workflow.md
│   ├── quality-gates.md
│   ├── prompts.md
│   ├── implemented-scope.md
│   ├── case-notes.md
│   └── launch-playbook.md
├── scripts/
│   └── pack-final-photos.sh
├── templates/
│   └── restoration-log.csv
└── articles/
    └── old-photo-restoration-skill-effect-and-logic.md
```

## Quick Start

1. Put your original photos in a private folder outside the repo.
2. Create a working folder for processed images.
3. For each photo, make a local baseline first:
   - rotate,
   - crop photographed borders,
   - lightly correct contrast,
   - lightly sharpen.
4. Send only the preprocessed photo to an AI image editor if needed.
5. Compare the AI candidate against the source using `docs/quality-gates.md`.
6. Accept the AI candidate only if it preserves identity.
7. Put approved finals in one folder.
8. Package them:

```bash
scripts/pack-final-photos.sh /path/to/final-photos /path/to/restored-photos.zip
```

## Current Scope

This repo implements the workflow, Codex skill, quality gates, prompt templates, and final packaging guardrail.

It does not yet include a one-click restoration app or a new model.

See [`docs/implemented-scope.md`](docs/implemented-scope.md) for the exact implemented scope.

## Use With Codex

The included skill can be copied to your Codex skills directory:

```bash
cp -R skills/faithful-photo-restoration ~/.codex/skills/
```

Then invoke it with:

```text
Use $faithful-photo-restoration to restore these old family photos faithfully.
```

## Suggested AI Prompt

For a typical old family photo:

```text
Restore this old family photo faithfully. Keep the same person/people, face identity, age, expression, clothing, pose, and background relationship. Remove dust, scratches, haze, stains, and mild fold damage. Improve clarity and contrast naturally. Do not beautify, do not modernize, do not add or remove people, do not change facial features, and do not invent details. Keep black-and-white photos black-and-white and color photos color.
```

More templates: [`docs/prompts.md`](docs/prompts.md)

## When To Use Conservative Repair

Use conservative local repair instead of AI restoration when:

- The image is a large group photo.
- Faces are too small to verify.
- The AI result makes faces look newly generated.
- A fold or scratch crosses a face and the model guesses too much.
- The restored photo looks impressive but no longer looks like the original person.

## Privacy

Do not commit family photos, restored private outputs, or model cache directories.

This repo intentionally ignores `outputs/`, `work/`, and common image-export folders by default. Use public-domain photos, synthetic examples, or redacted crops for open-source demos.

## Star-Worthy Positioning

Most old-photo projects answer:

> How do I make this old photo sharper?

This project answers:

> How do I make this old photo better without changing who is in it?

That is the missing QA layer for AI photo restoration.

## License

MIT. See [`LICENSE`](LICENSE).
