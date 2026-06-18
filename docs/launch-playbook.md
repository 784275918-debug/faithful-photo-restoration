# Launch Playbook

This project can get attention if it is positioned as a QA workflow, not another model.

## Positioning

Use:

> The missing QA layer for AI old photo restoration.

Avoid:

> One-click AI old photo restoration.

## GitHub Description

```text
Faithful AI old photo restoration workflow focused on identity preservation, border removal, and preventing AI face rewriting.
```

## Topics

- old-photo-restoration
- photo-restoration
- ai-image-editing
- image-restoration
- family-photos
- codex-skill
- prompt-engineering
- quality-control

## Launch Post

```text
AI old-photo restoration has a weird failure mode:

The result looks sharper, but your grandfather becomes someone else.

I open-sourced Faithful Photo Restoration: a workflow + Codex skill for restoring phone-shot family photos while preserving identity.

It focuses on:
- crop desk/frame borders first
- AI output is only a candidate
- reject face redraws
- use conservative repair for group photos
- package only approved finals

Repo: <link>
```

## Star Drivers

- Show failure cases, not just success cases.
- Include before/after examples using public-domain or synthetic photos.
- Make the README clear in the first 10 seconds.
- Explain that zip files do not reduce quality; wrong source selection does.
- Emphasize privacy: no family photos committed.

## What To Add Later

- Public-domain before/after examples.
- A small local preprocessing script.
- A ComfyUI workflow variant.
- A checklist UI for manual QA.
