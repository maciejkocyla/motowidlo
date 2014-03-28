task :fetch_blogs => :environment do

  require 'nokogiri'
  require 'open-uri'

  url = "http://retoryczny.blogspot.com"
  site = Nokogiri::HTML(open(url))
  title = site.at_css(".post .post-title a").text
  content = site.at_css(".post .post-body").text
  previous_article = BlogArticle.where(blog_url: url).last
  if previous_article.nil? || title != previous_article.title || content != previous_article.content
    BlogArticle.new(title: title, content: content, blog_url: url).save
  end
end
