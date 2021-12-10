var path = require('path');

module.exports = {
    entry: "./frontend/index.js",
    output: {
        path: path.resolve(__dirname, 'skeleton', 'frontend'),
        filename: "bundle.js"
    },
    devtool: 'source-map',
    resolve: {
        extensions: ['.js', '.jsx', '*']
    },
    module: {
        rules: [
            {
              test: [/\.jsx?$/, /\.js?$/],
              exclude: /(node_modules)/,
              loader: 'babel-loader',
              options: {
                  presets: ['@babel/env', '@babel/react']
              }  
            }
        ]
    }
};