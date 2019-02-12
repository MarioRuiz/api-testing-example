
require_relative '../../settings/general'
include Requests


# This is an example using the request hash: create_user_ex1
RSpec.describe ExampleReqres, '#create_user_ex1' do

    before do
        @http = NiceHttp.new(REQREST)
    end

    context 'when adding a good random user' do
        it 'should return 201 and Created' do
            resp = @http.post(ExampleReqres.create_user_ex1.gen)
            expect(resp.code).to eq 201
            expect(resp.message).to eq 'Created'
        end

        it 'should return the random name and job we sent' do
            req = ExampleReqres.create_user.gen
            resp = @http.post(req)
            expect(resp.data.json(:name,:job)).to eq req.data
        end

        it 'accepts 20 random good values for name and job' do
            20.times {
                req = ExampleReqres.create_user.gen
                resp = @http.post(req)
                expect(resp.code).to eq 201
                expect(resp.data.json(:name, :job)).to eq req.data
            }
        end
    end

    context 'when adding a wrong user' do
    
        it 'should not return 201 or Created when minimum length is wrong' do
            req = ExampleReqres.create_user_ex1.gen(expected_errors: :min_length)
            resp = @http.post(req)
            expect(resp.code).not_to eq 201
            expect(resp.message).not_to eq 'Created'
        end

        it 'doesn\'t accept 20 random wrong values' do
            20.times do
                req = ExampleReqres.create_user_ex1.gen(expected_errors: :value)
                resp = @http.post(req)
                expect(resp.code).not_to eq 201
                expect(resp.message).not_to eq 'Created'
            end
        end    
    end
end