// RSS 订阅源：访问 /rss.xml 时，把三个板块的文章聚合成一份标准「更新流」，
// 读者用任意 RSS 阅读器订阅即可，发新文自动收到——不依赖任何平台。
import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';

export async function GET(context) {
  const [ai, de, fiction] = await Promise.all([
    getCollection('ai'),
    getCollection('de'),
    getCollection('fiction'),
  ]);

  const items = [...ai, ...de, ...fiction]
    .sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf())
    .map((post) => ({
      title: post.data.title,
      pubDate: post.data.date,
      description: post.data.summary ?? '',
      link: `/${post.collection}/${post.id}/`,
    }));

  return rss({
    title: 'Grenzgang',
    description: 'Grenzgang —— 边界行走。德语语法、小说写作，与 AI 使用体验。',
    site: context.site,
    items,
    customData: `<language>zh-CN</language>`,
  });
}
