# Prompt Templates

These prompts are copied from the Codex skill and are designed for faithful restoration, not beautification.

## General Single Photo

```text
Restore this old family photo faithfully. Keep the same person/people, face identity, age, expression, clothing, pose, and background relationship. Remove dust, scratches, haze, stains, and mild fold damage. Improve clarity and contrast naturally. Do not beautify, do not modernize, do not add or remove people, do not change facial features, and do not invent details. Keep black-and-white photos black-and-white and color photos color.
```

## Phone-Shot Photo With Desk Or Border

```text
First treat the image like a photographed physical print: make it upright and flat, crop away all desk/table/background, album frame, paper edge, white border, date/title strip, and phone-shot margin. Keep only the actual photo content. Then restore faithfully with light cleanup and natural clarity. Do not change people, faces, clothes, pose, or scene.
```

## Large Group Photo

```text
Restore this group photo conservatively. Improve overall contrast, haze, dust, color, and minor damage, but do not redraw or invent individual faces. Preserve the number of people, relative positions, clothing, body shapes, and background. If a face is too small or blurry in the source, leave it naturally soft rather than generating a new face.
```

## Strong Damage Across Face

```text
Repair visible scratches, folds, stains, and cracks only where the source supports it. Preserve the original facial structure, expression, age, hairstyle, clothing, and photo style. If the damage cannot be safely reconstructed, reduce the damage conservatively rather than inventing a new face.
```

## Retry After Face Redraw

```text
The previous result changed the face too much. Redo it more conservatively: preserve the exact identity, eye shape, mouth, nose, jaw, hairline, wrinkles, clothing, and original photographic softness. Do not beautify or generate new facial details. Only clean damage and improve contrast/clarity lightly.
```
