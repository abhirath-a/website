import rss, { type RSSFeedItem } from "@astrojs/rss";
import { getCollection } from "astro:content";

export async function GET() {
  const blog = await getCollection("blog");

  return rss({
    title: "Abhirath Agasanakoppa",
    description: "Programming related essays",
    site: "https://abhirath.net",
    items: blog.map((post) => {
      return {
        title: post.data.title,
        pubDate: post.data.date,
        description: post.data.description,
        link: `/blog/${post.id}/`,
        content: post.body,
      };
    }) as RSSFeedItem[],
    customData: `<language>en-us</language>`,
  });
}
