require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe Employee do
    let(:full_name) { 'テスト太郎' }
    let(:email) { 'tarou@example.com' }

    describe '.first' do
      before do
        FactoryBot.create(:employee, full_name: full_name, email: email)
      end

      subject { described_class.first }

      it '事前に作成した通りのEmployeeを返すこと' do
        expect(subject.full_name).to eq('テスト太郎')
        expect(subject.email).to eq('tarou@example.com')
      end
    end
  end
end
