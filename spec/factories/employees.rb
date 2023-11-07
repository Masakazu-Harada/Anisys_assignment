FactoryBot.define do
  factory :employee do
    staff_number { 1 }
    full_name { "テスト太郎" }
    kana_name { "てすとたろう" }
    log_in_id { "tarou" }
    password_digest { "MyString" }
    admin { 1 }
    enable { 1 }
    email { "tarou@example.com" }
    pwup_day { "2023-11-04 15:47:18" }
    branch { nil }
    department { nil }
    boss { nil }
  end
end
