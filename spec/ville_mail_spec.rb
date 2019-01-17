require_relative '../lib/ville_mail'

describe "the perform method" do
it "should return at least 185 cities" do
  expect(perform.length).to eq(185) 
end

it "should include MUNICIPALITY => name@email" do
expect(perform[0]).to eq("ABLEIGES"=>"mairie.ableiges95@wanadoo.fr")
expect(perform[10]).to eq("ATTAINVILLE"=>"mairie@attainville.fr")
expect(perform[15]).to eq("BEAUCHAMP"=>"accueil-mairie@ville-beauchamp.fr")
end
end

