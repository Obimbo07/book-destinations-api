# spec/requests/users_spec.rb

require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  describe 'POST /signup' do
    it 'creates a new user' do
        # Define the user attributes to send in the request body
        user_params = {
          user: {
            username: 'testuser',
            email: 'testuser@example.com',
            password: 'password'
          }
        }
  
        # Make a POST request to the endpoint with the request body
        post '/signup', params: user_params.to_json, headers: { 'Content-Type' => 'application/json' }
        
        # Expectations
        expect(JSON.parse(response.body)["status"]).to eq({"code"=>200, "message"=>"Signed up sucessfully."})
        expect(JSON.parse(response.body)["data"]["username"]).to eq('testuser')
        expect(JSON.parse(response.body)["data"]["email"]).to eq('testuser@example.com')
    end

    it 'login a new user' do
        # Define the user attributes to send in the request body
        user_params = {
          user: {
            username: 'testuser',
            email: 'testuser@example.com',
            password: 'password'
          }
        }
  
        # Make a POST request to the endpoint with the request body
        post '/signup', params: user_params.to_json, headers: { 'Content-Type' => 'application/json' }
        post '/login', params: user_params.to_json, headers: { 'Content-Type' => 'application/json' }
        
        expect(JSON.parse(response.body)["status"]).to eq({"code"=>200, "message"=>"Logged in sucessfully."})
    end
  end
end