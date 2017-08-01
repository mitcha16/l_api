require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  let(:course_id) { Course.all.first.id }
  describe 'GET /courses' do
    before { get '/api/v1/courses' }

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /courses/:id' do
    before { get "/api/v1/courses/#{course_id}" }

    context 'when the course exists' do
      it 'returns the course' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(course_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the course does not exist' do
      let(:course_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

end
