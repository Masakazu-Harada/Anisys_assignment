require 'rails_helper'

RSpec.describe "WorkSchedules", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/work_schedules/index"
      expect(response).to have_http_status(:success)
    end
  end

end
