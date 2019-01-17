require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

PAGE_URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_the_email(page)
  page = Nokogiri::HTML(open(page))
  text = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
  if text != "" 
    return text 
  else 
    return "AUCUN EMAIL" 
  end
end

def get_the_url(page) 
    url = page.chomp("val-d-oise.html") 
    page = Nokogiri::HTML(open(page))
    municipalities = [] 
    page.css("a.lientxt").each do |municipality| 
      municipalities << {municipality.text => get_the_email(url + municipality['href'].sub!("./", ""))}
    
  end
  return municipalities 
  end


  def perform
    municipalities = get_the_url(PAGE_URL)
    for municipality in municipalities 
      puts municipality
    end
  end
  
  perform