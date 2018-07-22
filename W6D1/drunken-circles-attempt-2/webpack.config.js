const path = require('path');

module.exports = {
  entry: './src/game.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  }
};

module.exports = {
  entry: './dist/main.js',
  output: {
    filename: 'bundle.js',
  }
};
