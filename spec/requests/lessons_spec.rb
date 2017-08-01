require 'rails_helper'

RSpec.describe 'Lessons API', type: :request do
  let(:lesson_id) { Lesson.all.first.id }
  describe 'GET /lessons' do
    before { get '/api/v1/lessons' }

    it 'returns lessons' do
      expect(json).not_to be_empty
      expect(json.size).to eq(4)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /lessons/:id' do
    before { get "/api/v1/lessons/#{lesson_id}" }

    context 'when the lesson exists' do
      it 'returns the lesson' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(lesson_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the lesson does not exist' do
      let(:lesson_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Lesson/)
      end
    end
  end

end
