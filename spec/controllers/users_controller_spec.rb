require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #toplist" do
    it "returns http success" do
      get :toplist
      expect(response).to have_http_status(:success)
    end
  end

end
