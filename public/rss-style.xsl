<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/rss/channel">
    <html lang="zh-CN">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="title"/> · RSS 订阅源</title>
        <style>
          :root{
            --bg:#eef0e3;--paper:#fbfcf6;--ink:#262b1f;--text:#2f3328;
            --muted:#6a7359;--muted2:#8a9379;--line:#dde2d0;
            --green-dark:#55704a;--green-dark2:#496341;--green-dark3:#3a4a2c;
          }
          *{box-sizing:border-box;}
          body{
            margin:0;background:var(--bg);
            background-image:radial-gradient(rgba(95,112,70,0.07) 1px,transparent 1px);
            background-size:22px 22px;color:var(--text);
            font-family:-apple-system,BlinkMacSystemFont,"Microsoft YaHei","PingFang SC",sans-serif;
            line-height:1.75;-webkit-font-smoothing:antialiased;
          }
          .wrap{max-width:720px;margin:0 auto;padding:52px 22px 72px;}
          .badge{
            display:inline-block;font-family:ui-monospace,Menlo,Consolas,monospace;
            font-size:11px;letter-spacing:.14em;color:#5a6e3f;border:1px solid #c9d4b5;
            background:#f3f6ea;border-radius:7px;padding:5px 11px;
          }
          h1{font-weight:700;font-size:34px;margin:18px 0 6px;color:var(--ink);letter-spacing:.01em;}
          .desc{font-style:italic;font-size:17px;color:var(--muted);margin:0 0 24px;}
          .howto{
            background:linear-gradient(155deg,var(--green-dark),var(--green-dark2));
            color:#eaf3dc;border-radius:18px;padding:22px 26px;font-size:14px;line-height:1.85;
            box-shadow:0 14px 34px rgba(60,84,52,.22);
          }
          .howto strong{color:#dff0cb;}
          .howto code{
            background:rgba(255,255,255,.14);padding:2px 7px;border-radius:5px;
            font-family:ui-monospace,Menlo,Consolas,monospace;font-size:12.5px;
          }
          h2{font-weight:600;font-size:17px;color:var(--ink);margin:42px 0 16px;letter-spacing:.02em;}
          .item{
            display:block;text-decoration:none;color:inherit;background:var(--paper);
            border:1px solid var(--line);border-radius:16px;padding:20px 22px;margin-bottom:14px;
            transition:transform .15s,box-shadow .15s;
          }
          .item:hover{transform:translateY(-2px);box-shadow:0 10px 26px rgba(80,100,60,.12);}
          .item .t{font-weight:600;font-size:19px;color:var(--ink);line-height:1.4;}
          .item .d{font-size:13.5px;color:var(--muted);margin-top:7px;}
          .item .m{font-family:ui-monospace,Menlo,Consolas,monospace;font-size:11px;color:var(--muted2);margin-top:11px;}
          .back{display:inline-block;margin-top:32px;font-size:14px;color:var(--green-dark3);text-decoration:none;}
          .back:hover{text-decoration:underline;}
        </style>
      </head>
      <body>
        <div class="wrap">
          <div class="badge">RSS · 订阅源</div>
          <h1><xsl:value-of select="title"/></h1>
          <p class="desc"><xsl:value-of select="description"/></p>

          <div class="howto">
            这是一个 <strong>RSS 订阅源</strong> —— 一份会自动更新的文章清单。<br/>
            复制本页网址（以 <code>/rss.xml</code> 结尾），粘贴进任意 RSS 阅读器
            （如 Feedly、Inoreader、NetNewsWire、Reeder），
            <xsl:value-of select="title"/> 一发新文你就会在阅读器里收到 —— 不依赖任何平台，也不被算法打乱。
          </div>

          <h2>最近更新</h2>
          <xsl:for-each select="item">
            <a class="item" href="{link}">
              <div class="t"><xsl:value-of select="title"/></div>
              <div class="d"><xsl:value-of select="description"/></div>
              <div class="m"><xsl:value-of select="substring(pubDate,6,11)"/></div>
            </a>
          </xsl:for-each>

          <a class="back" href="/">← 返回 Grenzgang</a>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
