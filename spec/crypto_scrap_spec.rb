require_relative '../lib/crypto_scrap'

describe "the perform method" do
it "should return at least 2000 cryptocurrencies" do
  expect(perform.length).to be > 2000
  end
    
it "should include NAME => VALUE" do
  expect(perform[0]).to eq("BTC"=>"$3664.83")
  expect(perform[10]).to eq("MIOTA"=>"$0.311389")
  expect(perform[15]).to eq("NEO"=>"$7.75")
  end
end