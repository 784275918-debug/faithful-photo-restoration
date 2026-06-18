# Case Notes

These notes are based on a real 20-photo restoration pass. Private family photos are not included.

## Lesson 1: The First Problem Is Often Scanning, Not Restoration

Many old photos are photographed on a phone. The raw image contains desk cloth, frame edges, white borders, printed date/title strips, and perspective distortion.

The first deliverable is therefore a clean flat-photo crop. AI restoration should happen after this step.

## Lesson 2: Large Group Photos Should Default Conservative

In a large group photo, AI restoration can make the overall image look sharper while subtly redrawing small faces. This is a failure even if the image looks better at first glance.

The safer strategy:

- improve color and contrast,
- remove photographed borders,
- reduce haze,
- avoid per-face hallucination.

## Lesson 3: Zip Does Not Reduce Quality

A zip archive stores files losslessly. If a photo from the zip looks worse than an earlier preview, the wrong source file entered the zip.

Add a final source check before packaging:

- Is this the clearest approved version?
- Is it the accepted AI candidate or the conservative fallback?
- Did the final package use the same file the user approved?

## Lesson 4: Strong Repair Needs Disclosure

Some AI outputs are visually excellent but heavily reconstructed. They can be useful if the user accepts the likeness, but they should be labeled as strong AI repair instead of conservative restoration.
