# Jerome Desseaux - Resume

LaTeX sources for the French and English versions of my resume.

## Files

- `resume_fr.tex`: French resume
- `resume_en.tex`: English resume
- `moi.jpg`: profile picture used by both versions
- `cover_letter.template.tex`: public cover-letter template

The private working copy `cover_letter.tex` is ignored on purpose so it can
contain employer-specific details without being committed.

## Build

With a local LaTeX installation:

```sh
make
```

With Docker:

```sh
make docker-all
```

Both commands generate:

- `resume_fr.pdf`
- `resume_en.pdf`

To build a cover letter locally, copy `cover_letter.template.tex` to
`cover_letter.tex`, fill in your details, then run:

```sh
make docker-letter
```

## Releases

The GitHub Actions workflow publishes both PDFs when changes reach `main`:

- `CV_jerome_desseaux_fr.pdf`
- `CV_jerome_desseaux_en.pdf`
