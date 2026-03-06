const moduleName = require('../helpers/moduleName');
const { POST_COLLECTION_TAG_NAME, IS_PRODUCTION } = require('../constants');

module.exports = {
  name: moduleName(__filename),
  body: (collectionApi) =>
    collectionApi
      .getFilteredByTag(POST_COLLECTION_TAG_NAME)
      .reverse()
      .filter((item) => {
        if (IS_PRODUCTION) {
          return item.data.published;
        } 
          return true; // show all when developing content
      }),
};
