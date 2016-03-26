require 'sinatra' #sinatra  puts ruby into server
require 'httparty' #it breaks the html into headers body code msg
require 'nokogiri' #it parse the html for files
require 'active_support/all'
#^^^^A toolkit of support libraries and Ruby core extensions extracted from the Rails framework. Rich support for multibyte strings, internationalization, time zones, and testing.

# get '/' do
#   'Hello World'
# end
#
#
# get '/sinatra' do
#   "<h1>Sinatra Rocks!</h1>"
# end

get '/stock' do

  # puts "Please enter stock symbol."
  # stock = gets.chomp.downcase
   response = HTTParty.get("https://finance.yahoo.com/q?s=aapl")
   # puts response.body  #| .get it requests the api
  # puts response.headers

   dom = Nokogiri::HTML(response.body)
  # stock = gets.chomp
  # ticker_span = dom.xpath("#{stock}")#.first.content
  #puts ticker_span
  ticker_span = dom.xpath("//span[@id='yfs_l84_aapl']").first
  price = ticker_span.content.to_f.to_s(:currency)
  "current price is #{price}"

  # .first is a mtd to get an element of the object
  # .content mtd that puts only the content within the object
end
