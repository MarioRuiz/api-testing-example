require_relative '../../settings/general'
require_relative 'fixtures/coords'
include Swagger::UberApi::V1_0_0

RSpec.describe Products, '#list_products' do
  before do
    @http = NiceHttp.new(UBER)
  end

  context 'correct latitude and longitude, Madrid' do
    let(:request) {Products.list_products(Madrid.latitude, Madrid.longitude)}
    let(:resp) {@http.get(request)}

    it 'returns correct code and message' do
      expect(resp.code).to eq 200
      expect(resp.message).to eq "OK"
    end

    it 'costs the service more than zero euros per minute' do
      expect(resp.data.json(:cost_per_minute)[0]).to be > 0
    end

    it 'returns in response a correct data structure' do
      structure = request[:responses][:'200'][:data]
      expect(NiceHash.compare_structure(structure, resp.data.json, true)).to eq true
    end
  end

  context 'incorrect latitude and longitude, Reykjavik' do
    let(:request) {Products.list_products(Reykjavik.latitude, Reykjavik.longitude)}
    let(:resp) {@http.get(request)}

    it 'returns correct code and message' do
      expect(resp.code).to eq 200
      expect(resp.message).to eq "OK"
    end
    
    it 'shows no products in Reykjavik' do
      expect(resp.data.json(:cost_per_minute)).to be nil
    end

  end

end
