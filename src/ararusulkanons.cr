require "kemal"
require "./get_news_articles.cr"
require "./link_preview.cr"

get "/" do |env|
  send_file env, "./public/index.html"
end

get "/donate" do |env|
  send_file env, "./public/donate.html"
end

Kemal.run
