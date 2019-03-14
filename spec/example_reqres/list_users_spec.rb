
require_relative '../../settings/general'
include Requests

RSpec.describe ExampleReqres, '#list_users' do

    before do |example|
        @http = NiceHttp.new(REQREST)
        @http.logger.info("\n\n#{"=" * 100}\nTest: #{example.description}\n#{"-" * 100}")
    end

    it 'returns 200 code and OK on response' do
        resp = @http.get(ExampleReqres.list_users(1))
        expect(resp.code).to eq 200
        expect(resp.message).to eq 'OK'
    end

    it 'returns response as expected when code 200 compared to given response data for page 2' do
        request = ExampleReqres.list_users(2)
        resp = @http.get(request)
        expect(resp.code).to eq 200
        expect(resp.data.json).to eq (request.responses[:'200'].data.json)
    end

    it 'returns response as expected when code 200 for page 1 compared to given response for page 2' do
        request = ExampleReqres.list_users(1)
        response_structure = request.responses[:'200'].data.json
        resp = @http.get(request)
        expect(resp.code).to eq 200
        expect(NiceHash.compare_structure(response_structure,resp.data.json)).to eq true
    end

    it 'returns empty data array when page doesn\'t exist' do
        resp = @http.get(ExampleReqres.list_users(6666))
        expect(resp.code).to eq 200
        expect(resp.message).to eq 'OK'
        expect(resp.data.json(:data)).to eq []
    end

end