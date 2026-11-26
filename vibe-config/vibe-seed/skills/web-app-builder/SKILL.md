---
name: web-app-builder
description: Load this skill whenever the user asks to create, build, or rework
  a website or web app (landing page, portfolio, dashboard, blog, web UI),
  regardless of framework. Covers the intake questions for new sites and the
  mandatory German-law privacy/compliance pass (Impressum, Datenschutzerklärung,
  Cookie-Banner, external connections) that always runs after the work.
---
# Web App Builder

Two modes: **New** (new website/app) and **Rework** (rework existing). Determine the mode from the user's request; if genuinely ambiguous, ask once which mode applies.

## Mode 1: New (new website or web app)

Before writing any code, run a short intake. Ask the questions bundled via `ask_user_question` (max 4 per call, 2-4 short options each). Do not ask questions the user already answered. Cover:

1. Color scheme (e.g. light, dark, both with toggle, brand colors)
2. Layout structure (e.g. hero + sections, sidebar dashboard, one-pager, multi-page)
3. Responsive behavior (mobile-first, breakpoints, special mobile views)
4. Style/interactivity (animations, hover effects, interactive elements)

If the user just says "build something" without preferences, pick sensible dark-mode-capable defaults and state the assumptions in one line.

## Anti AI Design Principles (apply to both modes)

Follow these to avoid the generic AI-generated look. These are guidelines, not hard rules: the agent may deviate when justified, with the reason stated.

- Do not present features as three equal-sized boxes, icons, or list items. Instead, prioritize one feature and make it larger, weave features into flowing prose, or use another structure; if no good alternative exists, ask the user for direction.
- Avoid the classic AI phrasing pattern of "it's a, not b". Use one clear affirmative statement or one clear negation, but not that contrastive construction.
- No glowing or gradient effects. Use them only when justified and subtle, never the typical glowing/glassmorphism AI look.
- Do not render a single word in the header or body text in a different font.
- No "Claude eyebrow": no small pill in the header corner stating something like "online" or a status label.
- Use tags, pills, and badges sparingly and only strongly justified; tagging everything with pills reads as AI-generated.
- If the color choice lands on purple, violet, or similar, justify it strongly; these are typical AI colors.
- No excessive italics: single words italicized throughout the text reads as AI-generated.
- No Instrument Serif font; it is a telltale AI typeface. Use it only on explicit request.
- No negative kerning (tight letter-spacing) on headings.
- No over-the-top detailed UI: micro-decorations, ornaments, and visual over-engineering read as AI-generated. Add detail only where content demands it.
- Do not overuse dividers; a rule between every block reads as AI-generated.
- Do not stack multiple color shades and opacities within one paragraph or text block.
- No containers with borders around every block; use spacing instead of boxing everything.
- No overly detailed diagrams; keep diagrams reduced to what the content needs.
- No verbose, redundant text; do not restate the same point in different words.
- No code breadcrumbs (e.g. "Home / Blog / Post") unless a real navigation hierarchy needs them.
- No section numbering (e.g. "01 About", "1. Features") in headings.
- No eyebrows: no small labels floating above headings.
- No dithering effects on backgrounds or images.
- No ASCII images or ASCII-art illustrations.
- No squircles (superellipse/continuous corners) unless explicitly requested.
- No excessive mono fonts: mono is for code, not the dominant UI typeface.
- No all-caps subtitles.
- No periods at the end of titles and headlines (e.g. "Build faster.").
- Build a clear visual hierarchy: no flat, hierarchy-less layouts where every element carries the same visual weight. Establish clear levels via size, spacing, and contrast.
- No drop shadows on everything; shadows on every element read as AI-generated. Use them only where elevation is functionally needed.

All of the above are defaults, not absolute bans: any of these may be used when the user explicitly requests it or when a specific design strongly justifies it, with the reason stated.

## Mode 2: Rework (rework existing)

No intake about colors or layout. Read the existing project first (files, structure, current design system) and preserve the established style, framework, and patterns. Only ask when an edit is materially ambiguous and the answer changes the result.

## Compliance Pass (always, after every mode)

After finishing the build or the edits, always run a privacy and legal pass oriented on German law (GDPR/DSGVO, DDG, TDDDG). This pass is never skipped.

1. **Inventory external connections**: Scan the code for external resources and connections, e.g. Google Fonts, CDN scripts, analytics, maps, embeds, external images, APIs, tracking pixels. List the findings.
2. **Impressum (legal notice, § 5 DDG)**: If the site is business- or profession-related and none exists, create one (name, postal address, contact, VAT ID if applicable, liability/copyright notices). For purely private projects, point out whether the obligation applies.
3. **Privacy policy (Datenschutzerklärung)**: If none exists, create one based on the actual connection inventory: data processed, legal bases (Art. 6 GDPR), external services named explicitly, data subject rights (access, erasure, objection), no invented services. If one exists, adapt it to the new state (add new external connections, remove dropped services).
4. **Cookie banner**: Always include one if non-essential cookies or tracking exist. Essential cookies need no opt-in. Require an opt-in before any non-essential storage or connection (TDDDG). Rejecting must be as easy as accepting. Opt-out must remain reachable after the banner is closed.
5. **Prefer self-hosting external resources** (e.g. self-host Google Fonts) to reduce connections and thus obligations. If self-hosted, note this in the compliance pass.

Final report: which pages were created/adapted, which external connections were found, and open items the user must decide themselves (e.g. hosting address in the Impressum, deployed analytics).
