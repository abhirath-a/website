---
title: How to add dark mode to Astro
date: 09-28-2024
description: How to build a small dark mode toggle in Astro.
---

Dark mode is a useful feature in any website. Most people may say that it's "an unnecessary extra feature", but they haven't ever been on a light mode only website in the dead of night trying to debug a random javascript error. Astro is a popular framework that can do both SSR and SSG, and it's perfect for content driven websites and specifically Jamstack (Javascript, APIs, Markup) websites. It can use components that use libraries like React, Vue, Svelte, Solid, etc. Of course, it can also use vanilla JavaScript. Right now, I'm going to show you a framework-agnostic way to add dark mode to your Astro website.

## Adding Toggler

I'm going to assume you have the classes and colors set up. First, create a new Astro file and call it whatever you want, I'm calling it `ModeToggle.astro` and add a interactive element (button, dropdown menu, etc.), with whatever styles you like. I'm going to use a button for this example.

```astro
<button id="themeToggle">Mode Toggle</button>
```

## Scripting

Now for the scripting it's plain and simple js, because it doesn't require to be a client component or to be a JSX/Vue/Svelte component and can be pre-rendered. For better UX, you should check the storage or the system theme for the initial value.

```astro
<script is:inline>
  //     ^ needed or else LSP will try and typecheck/validate this script

  const getTheme = () =>
    localStorage.getItem("theme") ??
    (window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light");
</script>
```

I'm going to now define a helper function to set the theme and another to handle changing the theme for ease of use, and actually set the original theme.

```astro
<script is:inline>
  //     ^ needed or else LSP will try and typecheck/validate this script

  const getTheme = () =>
    localStorage.getItem("theme") ??
    (window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light");

  const setTheme = (theme) => {
    document.documentElement.classList.toggle("dark", theme === "dark");
    localStorage.setItem("theme", theme);
  };

  const changeTheme = () => {
    theme = theme === "light" ? "dark" : "light";
    setTheme(theme);
  };

  let theme = getTheme();
  setTheme(theme);
</script>
```

Now you can add an event listener to your interaction element of choice. If you're using the View Transitions API, then it will be a bit different.

```astro
<script is:inline>
  //     ^ needed or else LSP will try and typecheck/validate this script

  const getTheme = () =>
    localStorage.getItem("theme") ??
    (window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light");

  const setTheme = (theme) => {
    document.documentElement.classList.toggle("dark", theme === "dark");
    localStorage.setItem("theme", theme);
  };

  const changeTheme = () => {
    theme = theme === "light" ? "dark" : "light";
    setTheme(theme);
  };

  let theme = getTheme();
  setTheme(theme);

  btn.addEventListener("click", changeTheme);
</script>
```

### View Transitions

For anyone using the view transitions API, the theme will revert to light on page switch, so instead you have to do:

```astro
<script>
  // ...
  document.addEventListener("DOMContentLoaded", () =>
    btn.addEventListener("click", handleClick),
  );
  document.addEventListener("astro:after-swap", () =>
    btn.addEventListener("click", handleClick),
  );
</script>
```

## Conclusion

With this, you now have a framework agnostic Astro theme switcher! Final code:

```astro
<button id="themeToggle">Mode Toggle</button>
<script>
  const getTheme = () =>
    localStorage.getItem("theme") ??
    (window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "dark"
      : "light");

  const setTheme = (theme) => {
    document.documentElement.classList.toggle("dark", theme === "dark");
    localStorage.setItem("theme", theme);
  };

  const changeTheme = () => {
    theme = theme === "light" ? "dark" : "light";
    setTheme(theme);
  };

  let theme = getTheme();
  setTheme(theme);

  document.addEventListener("DOMContentLoaded", () =>
    btn.addEventListener("click", handleClick),
  );
  document.addEventListener("astro:after-swap", () =>
    btn.addEventListener("click", handleClick),
  );
</script>
```
