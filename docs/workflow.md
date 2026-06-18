# Workflow

This workflow documents what was actually used in a real 20-photo restoration pass. It is intentionally semi-automatic.

## 1. Inventory

- Keep original photos read-only.
- Assign stable IDs: `photo_01`, `photo_02`, etc.
- Track each image in `templates/restoration-log.csv`.
- Mark source type: black-and-white, sepia, or color.

## 2. Local Preprocessing

Before AI:

- Rotate to correct orientation.
- Crop away photographed table, cloth, album mat, frame, white border, title strip, date strip, and paper edges.
- Correct perspective only enough to look like a flat scan.
- Do not crop into people or important scene content.

This step is mandatory because AI restoration should operate on the photo content, not the phone-shot environment.

## 3. Conservative Baseline

Create a baseline with:

- mild contrast correction,
- mild dust/descreen cleanup,
- mild sharpening,
- original color mode preserved.

This is the fallback if AI changes identity.

## 4. AI Candidate

Generate one AI candidate per photo when useful.

Use the preprocessed image, not the raw phone image.

Avoid strong AI face restoration for:

- large group photos,
- very small faces,
- severely damaged faces,
- photos where identity is hard to verify.

## 5. Quality Gate

Compare source, baseline, and AI candidate.

Reject the AI candidate if:

- people count changes,
- a face looks newly generated,
- clothing or pose changes,
- the scene relationship changes,
- phone-shot borders remain,
- the result is clearer but less faithful.

## 6. Final Packaging

The final folder should contain only approved photos.

Do not include:

- AI candidates,
- rejected versions,
- compare sheets,
- scripts,
- model weights,
- temporary downloads,
- private originals.

Use:

```bash
scripts/pack-final-photos.sh final-photos restored-photos.zip
```
