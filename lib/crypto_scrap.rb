require 'rubygems'
require 'nokogiri'
require 'open-uri'   

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def array_name(page)
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  name = []
  page.css("td.text-left.col-symbol").each do |symbol|
    name << symbol.text
  end
  return name
end
#puts array_name(page)


def array_currencies(page)
  currencies = []
  page.css('td:nth-child(5) > a').each do |price|
    currencies << price.text
  end
  return currencies
end
#puts array_currencies(page)


def hashes_into_array(name, currencies)
  array_name_currencies = name.zip(currencies)
#puts array_name_currencies.inspect

  array_of_hashes = []
  array_name_currencies.each {|record| array_of_hashes <<  {record[0] => record[1]}}
  #puts array_of_hashes.inspect
  return array_of_hashes
end
#puts hashes_into_array(name, currencies)


def perform
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
name = array_name(page)
currencies = array_currencies(page)
puts hashes_into_array(name, currencies)
end

perform
