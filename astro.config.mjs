// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  // 网站最终网址（GitHub Pages 用户站，根路径）。换主机就改这里。
  site: 'https://justinzyc271828-sys.github.io',
  // 构建时自动生成 sitemap-index.xml（全站页面清单，交给搜索引擎）。
  integrations: [sitemap()],
});
