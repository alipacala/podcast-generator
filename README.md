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
        uses: alipacala/podcast-generator@v1
        with:
          email: '${{ github.actor }}@users.noreply.github.com'
          name: '${{ github.actor }}'
```

## Inputs

| Input | Description | Required | Default |
| --- | --- | --- | --- |
| `name` | Git committer name | No | `${{ github.actor }}` |
| `email` | Git committer email | No | `${{ github.actor }}@users.noreply.github.com` |

## `feed.yaml` Specification

Ensure you have a `feed.yaml` file in the root of your repository with the following structure:

```yaml
title: "My Tech Podcast"
subtitle: "Discussions on modern software development"
author: "Your Name"
description: "A weekly dive into code, DevOps, and cloud systems."
image: "/images/artwork.jpg"
language: "en-us"
category: "Technology"
format: "audio/mpeg"
link: "[https://tu-usuario.github.io/tu-repo/](https://tu-usuario.github.io/tu-repo/)"
item:
  - title: "Episode 01 - Getting Started"
    description: "Overview of GitHub Actions and automation workflows."
    published: "Thu, 12 Jan 2026 18:00:00 GMT"
    file: "/audio/ep01.mp3"
    duration: "00:25:30"
    length: 24519630
```

## License

Distributed under the MIT License. See `LICENSE` for more information.
