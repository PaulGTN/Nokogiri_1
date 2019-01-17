require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'



PAGE = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
#Récupère le contenu XML du lien donné

#def nom_prénom_mail(page)
def get_lastname 
	page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
	#Nom de famille
	last_name = []
	page.css("nom_de_famille").each do |name| 
		last_name << name.text 
	end
	return last_name
end

def get_first_name
	page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
	#Prénom
	first_name = []
	page.css("prenom").each do |name| 
		first_name << name.text
	end
	return first_name
end

def get_email
	page = Nokogiri::XML(open("https://www.nosdeputes.fr/deputes/enmandat/xml"))
	#Email
	emails = []
	page.css("email[1]").each do |email|
		emails << email.text 
	end
	return emails
end

def get_hash_complete(last_name,first_name,emails)
	list_depute = []
	list_depute = last_name.zip(first_name,emails) 

	info_depute_complete = []
  list_depute.each {|record| info_depute_complete << {"Nom de famille" => record[0], "Prénom" => record[1], "email" => record[2]}}
	return info_depute_complete
end


def perform
	last_name = get_lastname
	first_name = get_first_name
	emails = get_email
	puts get_hash_complete(last_name, first_name, emails).inspect
end

perform