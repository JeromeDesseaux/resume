# Jerome Desseaux - Resume

LaTeX sources for the French and English versions of my resume.

## Files

- `resume_fr.tex`: French resume
- `resume_en.tex`: English resume
- `moi.jpg`: profile picture used by both versions

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

## Releases

The GitHub Actions workflow publishes both PDFs when changes reach `main`:

- `CV_jerome_desseaux_fr.pdf`
- `CV_jerome_desseaux_en.pdf`
