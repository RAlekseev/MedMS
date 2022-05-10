require = require('esm')(module);
const {routes} = require('./resources/js/core/router.js');
module.exports = {
    pluginOptions: {
        sitemap: {
            baseURL: process.env.APP_URL,
            routes,
        }
    }
}