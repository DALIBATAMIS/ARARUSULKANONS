require "kemal"
require "./env.cr"
require "./get_news_articles.cr"
require "./link_preview.cr"

PORT = ENV["PORT"] ||= "3000"

get "/" do |env|
  send_file env, "./public/index.html"
end

get "/donate" do |env|
  send_file env, "./public/donate.html"
end

Kemal.config.port = PORT.to_i
Kemal.run
