require "kemal"
require "http/client"

API_KEY_NEWS = ENV["API_KEY_NEWS"][1..-2]
URL_NEWS = "http://newsapi.org/v2/everything?q=georgia+foreign+agent+law&from=2024-04-28&sortBy=publishedAt&apiKey=#{API_KEY_NEWS}"
last_checked_news = Time::UNIX_EPOCH
data_news = ""

get "/get_articles" do |env|
  if Time.utc - last_checked_news > Time::Span.new(hours: 2)
    response = HTTP::Client.get URL_NEWS
    data_news = response.body
  end

  data_news
end
