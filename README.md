# Francesco Massafra — Personal Website

Single-page personal site for Francesco Massafra, Research Engineer (RL, agentic planning, LLM evaluation, reproducible deep-learning experiments).

Built on the [ResearchEng-Portfolio](https://github.com/stevenplatt/ResearchEng-Portfolio) template; the original multi-page template is preserved under `examples/telecomsteve`.

## Structure

- `index.html` — single-page site (hero, research, experience, education, skills, contact)
- `css/stylesheet.css` — all styles
- `cv.pdf` — downloadable CV
- `img/` — favicon and images

## Development

Requires [pnpm](https://pnpm.io).

```sh
make install   # install dependencies
make demo      # serve on http://localhost:8080
```

## Deployment

```sh
make deploy-demo   # deploys to Google Cloud Storage demo bucket (requires GCP credentials)
```

## License

MIT — see [LICENSE](LICENSE).
