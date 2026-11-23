# jobreacher

> Drop in a job post. Get back a cold email, a LinkedIn DM, and a CV made for that exact role.

**jobreacher** is a [Claude skill](https://support.claude.com/en/articles/12512180-using-skills-in-claude). A skill is a small folder of instructions that Claude loads when it needs them. This one turns a job posting into a ready-to-send application kit.

## What you get

Give Claude a **screenshot** or **pasted text** of any job, internship, or hiring post. It returns:

| # | Output | Details |
|---|--------|---------|
| 1 | **Cold email** | Subject line + 90-130 word body. One clear ask. |
| 2 | **LinkedIn DM** | A short connection note (under 280 characters) and a longer follow-up. |
| 3 | **Tailored CV** | One page, compiled to **PDF**, built for that role. |
| 4 | **Gaps note** | What the job wants that your profile does not show, so you can frame it honestly. |

## How to use it

1. Install the skill (see below).
2. Open a Claude chat.
3. Upload a job screenshot or paste the JD.
4. Say something like:
   - `apply to this`
   - `draft outreach for this role`
   - `make a CV for this`

Claude reads the post, picks your best-fit projects, writes the drafts, and builds the PDF.

## Install

**Option A: upload the file**
1. Zip the `jobreacher/` folder (or use `jobreacher.skill` if you have it).
2. In Claude, go to **Settings > Capabilities > Skills** and upload it.

**Option B: from this repo**
```bash
git clone https://github.com/Athul-n-air/jobreacher.git
cd jobreacher
zip -r jobreacher.skill jobreacher
```
Then upload `jobreacher.skill` as in Option A.

> The PDF step needs Claude's code environment to be on, because the CV is built with XeLaTeX.

## How it works

```
job image / JD text
        |
        v
 1. Read the post        -> company, role, must-haves, recruiter, special rules
 2. Pick the angle       -> match top 3 needs to your best proof
 3. Write the drafts     -> cold email + LinkedIn DM
 4. Build the CV         -> edit the LaTeX template, compile to PDF, check it is 1 page
 5. Reply                -> drafts, CV notes, gaps, PDF
```

## Folder map

```
jobreacher-repo/
├── README.md
├── LICENSE
├── .gitignore
└── jobreacher/
    ├── SKILL.md                    # the instructions Claude follows
    ├── references/
    │   └── master-profile.md       # your facts: the only source of truth
    ├── assets/
    │   └── cv-template.tex         # one-page CV (XeLaTeX, Liberation Sans)
    └── scripts/
        └── build_cv.sh             # compiles the CV and checks the page count
```

## Make it yours

- **Your facts:** edit `jobreacher/references/master-profile.md`. Add real projects, numbers, and links. Claude may only use what is written here, so better facts mean a better CV.
- **CV look:** edit `jobreacher/assets/cv-template.tex`. The accent colour and font are set at the top.
- **Tone and length:** edit the email and DM rules in `jobreacher/SKILL.md`.

## Rules the skill follows

- **Truth first.** No made-up numbers, employers, titles, or certificates.
- **One page.** The CV is checked after every build.
- **Honest gaps.** If a must-have skill is missing, it is listed, not faked.
- **Job's rules win.** If the post asks for a subject format or a form, the skill follows it.

## Privacy

`master-profile.md` holds personal contact details. **Keep this repo private**, or remove your phone number and email before you make it public.

## Requirements

- A Claude plan with Skills and the code environment enabled
- Nothing to install locally. The CV is built inside Claude.

If you want to build locally too: XeLaTeX and the Liberation Sans font.

## License

MIT. See [LICENSE](LICENSE).
