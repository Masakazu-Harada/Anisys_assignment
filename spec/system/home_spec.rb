require 'rails_helper'

RSpec.describe "Homes", type: :system do
  before do
    driven_by :selenium_chrome_headless
  end

  describe 'トップページ' do
    it 'topページにアクセスできること' do
      visit '/'

      expect(page).to have_content('AnisysWebapp')
    end
  end
end
