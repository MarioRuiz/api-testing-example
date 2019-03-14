
require_relative '../../settings/general'
include Requests

RSpec.describe ExampleReqres, '#create_user' do

    before do |example|
        @http = NiceHttp.new(REQREST)
        @http.logger.info("\n\n#{"=" * 100}\nTest: #{example.description}\n#{"-" * 100}")
    end

    context 'when adding a good user' do
        it 'should return 201 and Created' do
            resp = @http.post(ExampleReqres.create_user)
            expect(resp.code).to eq 201
            expect(resp.message).to eq 'Created'
        end

        it 'should return the name and job we sent' do
            req = ExampleReqres.create_user
            req.values_for = {name: 'Pedro', job: 'Writer'}
            resp = @http.post(req)
            expect(resp.data.json(:name,:job)).to eq req.values_for
        end

        it 'accepts 20 random good values for name and job' do
            req = ExampleReqres.create_user
            20.times {
                req.values_for = {
                    name: :"5-15:Ln".gen, 
                    job: ['leader','developer','tester','accountant'].sample
                }
                resp = @http.post(req)
                expect(resp.code).to eq 201
                expect(resp.data.json(:name, :job)).to eq req.values_for
            }
        end
    end

    context 'when adding a wrong user' do
    
        it 'should not return 201 or Created when no name' do
            req = ExampleReqres.create_user
            req.data.delete(:name)
            resp = @http.post(req)

            expect(resp.code).not_to eq 201
            expect(resp.message).not_to eq 'Created'
        end

        it 'should not return 201 or Created when wrong name' do
            req = ExampleReqres.create_user
            req.values_for = {name: 'A'*1000}
            resp = @http.post(req)

            expect(resp.code).not_to eq 201
            expect(resp.message).not_to eq 'Created'
        end

        it 'doesn\'t accept 20 random wrong values for name' do
            req = ExampleReqres.create_user
            20.times {
                req.values_for = {
                    name: :"!5-15:Ln".gen, 
                    job: ['leader','developer','tester','accountant'].sample
                }
                resp = @http.post(req)
                expect(resp.code).not_to eq 201
                expect(resp.data.json(:name, :job)).not_to eq req.values_for
            }
        end
    
    end
end