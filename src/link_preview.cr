require "kemal"
require "http/client"

API_KEY_LINK = ENV["API_KEY_LINK"]
URL_LINK = "https://api.linkpreview.net/?q="

get "/link_preview/:url" do |env|
  url = env.params.url["url"]

  response = HTTP::Client.get("#{URL_LINK}#{url}", headers: HTTP::Headers {"X-Linkpreview-Api-Key:" => API_KEY_LINK})
  data = response.body

  data
end
