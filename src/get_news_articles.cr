require "time"
require "kemal"
require "http/client"
require "./env.cr"

DATE = (Time.local - 1.month).to_s("%Y-%m-%d")

API_KEY_NEWS = init_env()["API_KEY_NEWS"]
URL_NEWS = "http://newsapi.org/v2/everything?q=georgia+foreign+agent+law&from=#{DATE}&sortBy=publishedAt&apiKey=#{API_KEY_NEWS}"
last_checked_news = Time::UNIX_EPOCH
data_news = ""

get "/get_articles" do |env|
  if Time.utc - last_checked_news > Time::Span.new(hours: 2)
    response = HTTP::Client.get URL_NEWS
    data_news = response.body
  end

  data_news
end
