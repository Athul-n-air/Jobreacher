---
name: jobreacher
description: Turn a job posting (screenshot/image or pasted JD text) into a ready-to-send application kit for Athul - a cold email, a LinkedIn DM, and a new tailored one-page CV as a PDF. Use this whenever Athul shares a job image, JD, job link text, internship post, or hiring tweet/LinkedIn post, or says things like "apply to this", "draft outreach", "make a CV for this role", "cold email for this", "tailor my resume", even if he does not list all three outputs.
---

# jobreacher - job outreach kit

Input: a job image or JD text. Output, every time:
1. Cold email (subject + body)
2. LinkedIn DM (short connection note + longer follow-up)
3. New tailored CV, one page, delivered as a PDF

Read `references/master-profile.md` first. It is the only source of truth about Athul. Never add a fact that is not in it or in the current chat.

## Step 1 - Read the posting

If it is an image, read all the text in it. Pull out:
- Company, role, location, on-site/remote, stipend or CTC if shown
- Must-have skills and nice-to-have skills
- Name and title of the poster or recruiter, and any email shown
- Special instructions (subject line format, "attach CV", portfolio link, deadline)
- Company type (startup, MNC, research lab) - this sets the tone

If something key is unreadable or missing (company name, role), ask one short question. Otherwise just go.

Give a 3-line "JD read" first: role, top 3 things they want, tone to use.

## Step 2 - Pick the angle

Match the top 3 JD needs to Athul's strongest proof from the master profile:
- Pick the 2-3 projects/experiences that fit best. Lead with the best one.
- Drop what does not fit. A tailored CV is shorter on the wrong stuff, not longer.
- Mirror JD keywords only where they are true. If a must-have is missing, do not fake it. List it under "Gaps" in the reply.

## Step 3 - Cold email

- Subject: specific and short. Follow the JD's format if it gives one. Else: `<Role> - Athul Nair (Final-year CSE, LPU)`
- Body: 90-130 words. Plain, human, not a template voice.
  - Line 1: why this company/role, one concrete detail (not flattery)
  - Lines 2-3: one or two proofs with numbers (e.g. 100,000+ files, ~5 s per file)
  - Close: one clear ask, mention CV attached, links to GitHub and LinkedIn
- Sign off with name, phone, LinkedIn.
- Never write that Athul owns a cafe. Never claim skills or titles he does not have.

## Step 4 - LinkedIn DM

Give two versions:
- Connection note: under 280 characters (LinkedIn limit is 300). One hook, one proof, one ask.
- Follow-up DM: 60-90 words, for after they accept. Adds a second proof and a light ask (15 minutes, or "can I send my CV?").

If a name is known, use it. If not, use a neutral opener.

## Step 5 - New CV (PDF)

1. Copy `assets/cv-template.tex` to a working folder.
2. Edit it for this role: reorder sections, pick projects, rewrite bullets with JD keywords that are true. Keep it to ONE page.
3. Build with `bash scripts/build_cv.sh <file.tex>` (uses XeLaTeX, Liberation Sans, accent RGB(72,58,146)).
4. Check it is one page and looks right: `pdfinfo <file>.pdf | grep Pages`, then render page 1 to an image and look at it. Fix overflow or ugly gaps and rebuild.
5. Name it `Athul_Nair_<Company>_<Role>.pdf`.
6. Copy the PDF to `/mnt/user-data/outputs/` and call `present_files`.

Bullet rules: start with a strong verb, say what was built, add a number if one exists in the master profile, name the tech. No filler like "responsible for". If a number is not in the master profile, leave it out - do not invent one.

## Step 6 - Reply format

Keep the chat reply short and in this order:
1. JD read (3 lines)
2. Cold email
3. LinkedIn DM (both versions)
4. CV note: which projects were chosen and why, plus any Gaps
5. The PDF via `present_files`

Use simple, plain English in your own notes. Keep the drafts themselves polished and professional.

## Guardrails

- Truth first. Everything on the CV must be defensible in an interview.
- No made-up metrics, employers, degrees, or certifications.
- Do not describe Athul as owner of Cafe 18o'5. It belongs to a friend.
- If the role needs something he lacks (for example a 3-year experience requirement), say so in Gaps and suggest how to frame it honestly.
- If the JD says send by a platform form only, still give the DM and CV, and say the email is optional.
