---
title: A new stack for a new portfolio
date: 08-6-2024
description: I recently rebuilt my portfolio website. Here's how I personally did it.
---

Dozens of people in tech have a portfolio website, regardless of if it's a simple html file or a full stack Actix Web and Angular project. I recently rebuilt my own website. A simple Jekyll template would've done the trick, but I've relatively overengineered this website due to FOMO.

## Typescript

Probably the most obvious one on the list. Typescript for those who don't know is a JavaScript superset (meaning extends on it) that adds typing to it, so that there are less build errors. This one isn't really a problem.
[Link](https://www.typescriptlang.org/)

## Astro

Astro is a new framework that's perfect for content driven websites. It can do both SSR and SSG, or both! It can use components that use libraries like React, Vue, Svelte, Solid, etc. Unlike Next.JS (my 2nd choice) it ships little to no JavaScript to the browser using the Islands architecture. This results in insane performance. I also use it's content collection feature to manage my blog posts.
[Link](https://astro.build)

## React

This was entirely because this is the framework I am most familiar with, and because I used Shadcn UI. However, I do also love Vue and Svelte, but their implementations of Radix UI (the backbone of Shadcn UI) are clunky at best.
[Link](https://react.dev)

## Tailwind CSS + Shadcn UI

I love Tailwind CSS's approach with atomic styling, and it has become almost a default in many of my projects, however it's time consuming to create components manually and it's usually hard to find a component library with defaults I like, because changing them is too hard and boring. That's why I used Shadcn UI. though it is a set of re-usable components and not really a full-blown UI library like Daisy UI, it's more than enough for this project. [Tailwind CSS](https://tailwindcss.com/), [Shadcn UI](https://ui.shadcn.com/)
