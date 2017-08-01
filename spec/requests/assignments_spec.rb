require 'rails_helper'

RSpec.describe 'Assignments API', type: :request do
  let(:assignment) { Assignment.all.first }
  let(:assignment_id) { assignment.id }
  let(:user) { User.all.first }
  let(:user_id) { user.id }

  describe 'GET /assignments' do
    before { get '/api/v1/assignments' }

    it 'returns assignments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(24)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /assignments/:id' do
    before { get "/api/v1/assignments/#{assignment_id}" }

    context 'when the assignment exists' do
      it 'returns the assignment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(assignment_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the assignment does not exist' do
      let(:assignment_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Assignment/)
      end
    end
  end
end
