require "kemal"
require "./get_news_articles.cr"
require "./link_preview.cr"

get "/" do |env|
  send_file env, "./public/index.html"
end

get "/donate" do |env|
  send_file env, "./public/todo.html"
end

get "/about-us" do |env|
  send_file env, "./public/todo.html"
end

Kemal.run
