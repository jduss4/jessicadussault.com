const dayjs = require('dayjs');
const yaml = require("js-yaml");

module.exports = function(eleventyConfig) {
  eleventyConfig.setBrowserSyncConfig({
    files: './_site/assets/css/**/*.css'
  });
  eleventyConfig.addPassthroughCopy(
    { "_assets/images/": "assets/images" }
  );
  eleventyConfig.addDataExtension("yml", contents =>
    yaml.load(contents)
  )

  const formatDate = (date, format) => dayjs(date).format(format);
  eleventyConfig.addFilter("formatDate", formatDate);

  return {
    dir: {
      includes: "_includes",
      layouts: "_layouts"
    }
  }
};
