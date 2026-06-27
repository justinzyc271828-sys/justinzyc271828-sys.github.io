// ============================================================
// 内容集合的「登记表」。三个板块 = 三个"专柜",结构完全一样。
// 以后想再加板块(比如"摄影"),照样在这里再开一个专柜即可(可扩展)。
// ============================================================
import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// 三个专柜共用同一张「登记表」：每篇必须有 title / date，summary 可选。
const baseSchema = z.object({
  title: z.string(),
  date: z.coerce.date().default(() => new Date()),  // 不写日期就自动用今天
  summary: z.string().optional(),
  // —— 连载用(可选)：同一 series 的文章按 order 串成「上一节 / 下一节」。
  //    不写这两项的文章(如 AI / 德语)完全不受影响。
  series: z.string().optional(),
  order: z.number().optional(),
  // —— 封面插图(可选)：小说页用它替换默认的占位封面。
  cover: z.string().optional(),
});

const ai = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/ai' }),
  schema: baseSchema,
});

const de = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/de' }),
  schema: baseSchema,
});

const fiction = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/fiction' }),
  schema: baseSchema,
});

export const collections = { ai, de, fiction };
