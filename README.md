# Podcast Generator Action 🎙️

A GitHub Action that automatically generates an iTunes and RSS-compliant `podcast.xml` feed from a simple `feed.yaml` metadata file and pushes the changes back to your repository.

## Usage

Add the following workflow to your repository in `.github/workflows/podcast-feed.yml`:

```yaml
name: Generate Podcast Feed

on:
  push:
    branches:
      - main
    paths:
      - 'feed.yaml'

permissions:
  contents: write

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Generate Podcast Feed
        uses: tu-usuario/podcast-generator@v1
        with:
          email: '${{ github.actor }}@users.noreply.github.com'
          name: '${{ github.actor }}'
