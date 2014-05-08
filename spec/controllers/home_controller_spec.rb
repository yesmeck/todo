require 'spec_helper'

describe HomeController do
  describe 'GET index' do
    it 'get the index page' do
      get :index
      expect(response).to be_success
    end
  end
end
