require_relative '../lib/députés'


describe "the perform method" do
    it "should return at least 300 names" do
    expect(perform.length).to eq > 300 
    end
    
    it "should include LAST_NAME => last_name, NAME => name, EMAIL => random@email" do
    expect(perform[0]).to eq("Nom de famille"=>"Roussel", "Prénom"=>"Cédric", "email"=>"6circo03@en-marche.fr")
    expect(perform[10]).to eq("Nom de famille"=>"Anthoine", "Prénom"=>"Emmanuelle", "email"=>"emmanuelle.anthoine@assemblee-nationale.fr")
    expect(perform[15]).to eq("Nom de famille"=>"Bessot Ballot", "Prénom"=>"Barbara", "email"=>"barbara.bessotballot@assemblee-nationale.fr")
    end
    end