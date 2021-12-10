var path = require('path');

module.exports = {
    entry: "./app.jsx",
    output: {
        path: path.resolve(__dirname, 'frontend'),
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