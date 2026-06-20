// ============================================================
// 内容集合的「登记表」。三个板块 = 三个"专柜",结构完全一样。
// 以后想再加板块(比如"摄影"),照样在这里再开一个专柜即可(可扩展)。
// ============================================================
import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// 三个专柜共用同一张「登记表」：每篇必须有 title / date，summary 可选。
const baseSchema = z.object({
  title: z.string(),
  date: z.coerce.date(),
  summary: z.string().optional(),
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
