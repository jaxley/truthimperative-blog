const { eleventyImageTransformPlugin } = require("@11ty/eleventy-img");

module.exports = {
  initArguments: {},
  configFunction: function (eleventyConfig) {
	console.log("Loading image transform plugin...");
	eleventyConfig.addPlugin(eleventyImageTransformPlugin, {
		// which file extensions to process
		extensions: "html",

		// Add any other Image utility options here:

		// optional, output image formats
		formats: ["webp", "jpeg"],
		// formats: ["auto"],

		// optional, output image widths
		// widths: ["auto"],

		// optional, attributes assigned on <img> override these values.
		defaultAttributes: {
			loading: "lazy",
			decoding: "async",
		},
	});

        // Watch content images for the image pipeline.
        eleventyConfig.addWatchTarget("content/**/*.{svg,webp,png,jpeg,jpg,JPG,tiff,gif}");
    };
};
