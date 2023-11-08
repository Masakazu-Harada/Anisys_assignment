require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe Employee do
    let(:full_name) { 'テスト太郎' }
    let(:email) { 'tarou@example.com' }
    let(:password) { '123456789' }
    let(:log_in_id) { 'tarou' }
    let(:employee) { FactoryBot.build(:employee, full_name: full_name, email: email, password: password, log_in_id: log_in_id) }

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

    describe 'Employeeモデルの各種validation' do      
      describe 'full_name属性' do
        describe '文字数の制限' do
          context 'full_nameが20文字以下の場合' do
            let(:full_name) { '黒田官兵衛' }

            it 'Employeeオブジェクトは有効であること' do
              expect(employee.valid?).to be(true)
            end
          end

          context 'full_nameが21文字以上の場合' do
            let(:full_name) { '黒田官兵衛' * 5 }

            it 'Employeeオブジェクトは無効であること' do
              employee.valid?

              expect(employee.valid?).to be(false)
            end
          end
        end
        describe 'full_name尊属性の検証' do
          context 'full_nameが空欄の場合' do
            let(:full_name) { '' }

            it 'Employeeオブジェクトは無効であること' do
              employee.valid?

              expect(employee.valid?).to be(false)
            end
          end
        end
      end
      describe 'log_in_id属性' do
        describe '文字数制限の検証' do
          context 'log_in_idが50文字以下の場合' do
            let(:log_in_id) { 'kuroda' }

            it 'Employeeオブジェクトは有効であること' do
              expect(employee.valid?).to be(true)
            end
          end

          context 'log_in_idが51文字以上の場合' do
            let(:log_in_id) { 'kuroda' * 11 }

            it 'Employeeオブジェクトは無効であること' do
              employee.valid?

              expect(employee.valid?).to be(false)
            end
          end
        end
      end
    end
  end
end
