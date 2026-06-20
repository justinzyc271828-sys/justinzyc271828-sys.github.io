// ============================================================
// 三个板块（专柜）的视觉主题 + 一些小工具。
// 想加新板块：这里加一条即可（数据驱动、可扩展）。
// ============================================================
export const THEMES = {
  de:      { key: 'de',      label: '德语', dot: '#86c46c', tagText: '#5a7e3f', tagBg: 'rgba(134,196,108,0.16)' },
  fiction: { key: 'fiction', label: '写作', dot: '#cbb072', tagText: '#9a7e3f', tagBg: 'rgba(203,176,114,0.18)' },
  ai:      { key: 'ai',      label: 'AI',   dot: '#5fae9c', tagText: '#3f7e70', tagBg: 'rgba(108,191,176,0.16)' },
};

export function theme(key) {
  return THEMES[key] || THEMES.ai;
}

// 粗略估算阅读时长（分钟）：中文约每分钟 400 字。
export function readingTime(text = '') {
  const chars = (text || '').replace(/\s+/g, '').length;
  return Math.max(1, Math.round(chars / 400));
}

// 日期 -> 2026.06
export function ym(date) {
  const d = new Date(date);
  return `${d.getFullYear()}.${String(d.getMonth() + 1).padStart(2, '0')}`;
}
// 日期 -> 2026.06.14
export function ymd(date) {
  const d = new Date(date);
  return `${d.getFullYear()}.${String(d.getMonth() + 1).padStart(2, '0')}.${String(d.getDate()).padStart(2, '0')}`;
}
