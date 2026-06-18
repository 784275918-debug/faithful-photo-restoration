---
name: faithful-photo-restoration
description: Faithful old-photo restoration workflow for scanned or phone-shot family photos. Use when asked to repair old photos, remove photographed desk/frame borders, straighten perspective, preserve original faces, avoid AI face rewriting, create print-ready outputs, or build a repeatable photo-restoration quality gate.
---

# Faithful Photo Restoration

## Goal

Restore old family photos to a saleable, print-ready standard while preserving the original people. Prefer a conservative faithful result over a visually impressive image that changes faces, adds people, removes people, changes clothing, or invents details.

## Core Rule

Treat AI output as a candidate, not the final answer. A candidate is accepted only after visual review against the source. If it changes identity, face structure, people count, clothing, pose, scene relationship, text, or important objects, reject it and use a conservative local restoration.

## Workflow

1. Inventory every source image.
   - Keep original files read-only.
   - Assign stable IDs: `photo_01`, `photo_02`, etc.
   - Record whether each image is black-and-white, sepia, or color.

2. Preprocess locally before any AI work.
   - Rotate to correct orientation.
   - Crop away phone-shot desk/table/background, album mats, photo frames, white borders, title/date strips, and paper edges unless the user explicitly asks to retain them.
   - Correct perspective only enough to make verticals/horizontals feel like a flat scan.
   - Do not crop into people or important scene content.

3. Produce a conservative local baseline.
   - Use autocontrast, mild denoise/descreen, dust cleanup, and light sharpening.
   - Keep black-and-white photos black-and-white and color photos color unless the user asks for colorization.
   - Use this baseline as the fallback when AI is unsafe.

4. Generate one AI candidate per photo when useful.
   - Use the preprocessed image, not the raw phone photo.
   - Prompt for faithful restoration, not beautification.
   - For large group photos, avoid face enhancement unless the source faces are large enough to compare. Group photos often require conservative local repair.
   - Use prompt templates from `references/prompt-templates.md`.

5. Review every photo manually.
   - Compare source/preprocessed baseline/AI candidate side by side.
   - Verify people count, face identity, pose, clothing, background relation, and edges.
   - Reject over-clean, plasticky, beautified, or newly generated faces.
   - Read `references/quality-gates.md` before making accept/reject decisions.

6. Export final deliverables.
   - Final folder: only finished photos, no candidates, no comparison sheets, no scripts, no model cache.
   - Zip: only final photos.
   - Use stable names such as `photo_01_7in_300dpi.jpg`.
   - If the user wants no border, do not pad to a fixed aspect ratio. Use a 7-inch long edge at 300DPI or another explicit print requirement.

## Acceptance Standard

A final image must satisfy all of these:

- Correct orientation; not visibly tilted or phone-shot.
- No desk/table/background/album edge/frame/paper border remains.
- No extra or missing people.
- Faces are clearer but still recognizably the same people.
- No AI glamour, beauty retouching, modernized clothing, or invented texture.
- Damage, haze, scratches, fold marks, and stains are visibly reduced where safe.
- B/W remains B/W; color remains color unless asked otherwise.
- Final package contains only finished photos.

## Red Flags

Immediately reject an AI candidate if:

- It makes a small face look like a new person.
- It changes eye shape, hairline, jaw, teeth, beard, wrinkles, or age.
- It makes old paper texture look like a modern studio portrait when the source does not support that detail.
- It sharpens a large group by inventing faces.
- It leaves phone-shot border/background visible.
- It creates a photo that did not exist in the source.

## Notes For Agents

- Be explicit when a photo is downgraded to local-conservative because AI changed identity.
- When the user compares two versions, identify which source entered the zip before changing anything.
- Do not delete original source photos. Only clean generated process artifacts after the final zip is verified.
- Zip files do not reduce image quality; if a zip result looks worse, the wrong source image likely entered the zip.
