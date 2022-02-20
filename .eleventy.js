module.exports = function(eleventyConfig) {
  eleventyConfig.setBrowserSyncConfig({
    files: './_site/css/**/*.css'
  });
  return {
    dir: {
      includes: "_includes",
      layouts: "_layouts"
    }
  }
};
