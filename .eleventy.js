module.exports = function(eleventyConfig) {
  eleventyConfig.setBrowserSyncConfig({
    files: './_site/assets/css/**/*.css'
  });
  eleventyConfig.addPassthroughCopy(
    { "_assets/images/": "assets/images" }
  );
  return {
    dir: {
      includes: "_includes",
      layouts: "_layouts"
    }
  }
};
