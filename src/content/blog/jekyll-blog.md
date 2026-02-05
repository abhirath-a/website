---
title: How to not overengineer a blog
date: 08-29-2024
description: How to build a blog with Jekyll, and not overengineer it.
---

In my last article, I said that a "simple Jekyll template would've [been perfect for my portfolio and the smart choice], but I've relatively overengineered this website". Well I am going to show you how to not overengineer your own personal blog website and be smart about it.

## Creating the Jekyll project.

Yes we're using Jekyll, and you'll understand why later. There's a [useful guide on the Jekyll website](https://jekyllrb.com/docs/installation/#requirements) for setting up the requirements. Once you've done that, you can create a new Jekyll project with the following command:

```bash
jekyll new my-awesome-blog
cd my-awesome-blog
bundle add webrick
code . # or your preferred code editor
bundle exec jekyll serve --livereload
```

And you can now open it in your browser at `http://localhost:4000`.

## Customization

You can customize the blog in the \_config.yml file, it's self expalantory. You can also add new posts in the \_posts folder, and they will be automatically added to the blog. Sometimes it doesn't reload the config file on change so you may have to restart the server.

## Deployment

You can deploy this website for free, without any (real) vendor lock in. First create a Github account (if you haven't already). Then, create a github repo and call it `YOUR_GITHUB_USERNAME`.github.io. Now we need to initialize a git repo inside of the jekyll project. First run

```bash
git init && git add . && git commit -m "init" && git branch -M main
git remote add origin YOUR_GITHUB_LINK.git && git push -u origin main
```

Wait a few minutes, and then go to `https://YOUR_GITHUB_USERNAME.github.io` and you should see your blog.
