FactoryBot.define do
  factory :employee do
    staff_number { 1 }
    full_name { "MyString" }
    kana_name { "MyString" }
    log_in_id { "MyString" }
    password_digest { "MyString" }
    admin { 1 }
    enable { 1 }
    email { "MyString" }
    pwup_day { "2023-11-04 15:47:18" }
    branch { nil }
    department { nil }
    boss { nil }
  end
end
