require "kemal"
require "http/client"

API_KEY_LINK = init_env()["API_KEY_LINK"][1..-2]
URL_LINK = "https://api.linkpreview.net/?q="

hash_table = Hash(String, String).new

get "/link_preview/:url" do |env|
  url = env.params.url["url"]

  data = ""

  if hash_table.has_key? url
    data = hash_table[url]

    puts data
  else
    response = HTTP::Client.get("#{URL_LINK}#{url}", headers: HTTP::Headers {"X-Linkpreview-Api-Key:" => API_KEY_LINK})
    hash_table[url] = response.body
    data = response.body
  end

  data
end
