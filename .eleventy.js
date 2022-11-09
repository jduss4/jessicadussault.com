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
  return {
    dir: {
      includes: "_includes",
      layouts: "_layouts"
    }
  }
};
