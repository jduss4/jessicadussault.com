# Jessica's super cool website

## Local development

Serve:

```
npm start
```

Build

```
npm run build
```

### Sass

For SCSS setup see [Using SASS with Eleventy](https://jkc.codes/blog/using-sass-with-eleventy/). When using `npm start`, any changes you make to scss files will be automatically applied.

## Content

### Add a new post

Create post from template:

```bash
npm run new
```

Resize images:

```bash
gm convert -resize 800x800 from_path to_path.jpg
```

### Add a new year of books

Change the date in `sidequests/books.njk` to display a new year of books in `_data/books.yml`. Alternatively, figure out how to do it with Nunjucks or within the `.eleventy.js` file. But you're lazy, I kinda doubt you're going to.
