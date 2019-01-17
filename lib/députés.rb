require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))

PAGE = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
#Récupère le contenu XML du lien donné

#def nom_prénom_mail(page)

	#Nom de famille
	@last_name = []
	page.css("nom_de_famille").each do |name| 
		@last_name << name.text 
	end
	#Prénom
	@first_name = []
	page.css("prenom").each do |name| 
		@first_name << name.text
	end

	#Email
	@emails = []
	page.css("email[1]").each do |email|
		@emails << email.text 
	end
=begin
	return makeHash(@first_name, @last_name, @emails) 
#end 
=end 
	list_depute = []
	list_depute = @last_name.zip(@first_name,@emails) 

	info_depute_complete = []
  list_depute.each {|record| info_depute_complete << {"Nom de famille" => record[0], "Prénom" => record[1], "email" => record[2]}}
  #puts array_of_hashes.inspect


puts info_depute_complete.inspect