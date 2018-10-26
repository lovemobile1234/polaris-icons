// rollup.config.js
import typescript from 'rollup-plugin-typescript2';
import svgo from 'rollup-plugin-svgo';
import {svgOptions} from '@shopify/images/optimize';

export default {
  input: 'js/index.ts',
  output: {
    file: 'index.js',
    format: 'cjs'
  },
  plugins: [
    typescript({
      module: 'ESNext',
      useTsconfigDeclarationDir: true,
    }),
    svgo(svgOptions()),
  ],
};