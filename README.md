# abhirath.net 

this is the repo for my website hosted on [abhirath.net](https://www.abhirath.net).

## Writing a blog post

Create a Markdown file in `src/content/blog/`, for example `my-first-post.md`:

```md
---
title: "My first post"
description: "A short summary for the blog listing and page metadata."
date: 2026-06-01
draft: true
---

Write your post here using Markdown.

## A heading

Paragraphs, links, images, lists, and fenced code blocks are supported.
```

Set `draft: false` (or omit it) to publish. Drafts are excluded from both the
listing and generated pages, including in development. Posts appear newest-first
at `/blog`; this example publishes at `/blog/my-first-post/`. Dates are displayed
in UTC. Future dates do not delay publication.

Use `pnpm dev` to preview locally and `pnpm build` to validate and generate the
site. Posts are included at build time, so deploy a new build after adding or
editing one. No posts are included in the repository yet.
