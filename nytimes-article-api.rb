# Sample code provided by developer.nytimes.com

require 'uri'
require 'net/http'
require 'json'

def article_request(api_key, fq, begin_date, end_date, last_page)
  uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  for page in 0..last_page.to_i
    puts page
    uri.query = URI.encode_www_form({
      "api-key" => api_key,
      "fq" => "headline: #{fq}",
      "begin_date" => begin_date,
      "end_date" => end_date,
      "sort" => "oldest",
      "fl" => "headline, pub_date",
      "page" => page
    })
    begin
      request = Net::HTTP::Get.new(uri.request_uri)
      @result = JSON.parse(http.request(request).body)
      @result["response"]["docs"].each do |doc|
        headline = doc["pub_date"] + " " + doc["headline"]["main"]
        File.write("#{fq}-headlines.txt", headline + "\n", mode:'a')
      end
    rescue
      puts "Skipping"
      puts @result
    end
    sleep(1)
  end
end

article_request *ARGV
