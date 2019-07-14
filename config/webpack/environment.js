const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');

// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
// // Enabling native js bootstrap
// environment.loaders.append("bootstrap.native", {
//   test: /bootstrap\.native/,
//   use: {
//     loader: "bootstrap.native-loader",
//     options: {
//       // only: ["alert", "button", "dropdown", "modal", "tooltip"],
//       bsVersion: 4
//     }
//   }
// })
module.exports = environment
