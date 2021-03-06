const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.loaders.delete('nodeModules');
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)

module.exports = environment
