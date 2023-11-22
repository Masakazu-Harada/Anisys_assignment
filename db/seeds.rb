# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Branch.find_or_create_by!(name: '東京本社') do |branch|
  branch.tel_number = '03-1234-5678'
  branch.fax_number = '03-1234-5679'
  branch.post_code = '100-0000'
  branch.address1 = '東京都千代田区'
  branch.address2 = '千代田1-1-1'
  branch.branch_type = 0 # 本社
end

kanto_prefectures = [ '神奈川', '埼玉', '千葉', '茨城', '栃木', '群馬' ]
kanto_prefectures.each do |prefecture| 
  Branch.find_or_create_by!(name: "#{prefecture}工場") do |branch|
    branch.tel_number = '未定'
    branch.fax_number = '未定'
    branch.post_code = '未定'
    branch.address1 = "#{prefecture}県のどこか"
    branch.address2 = '未定'
    branch.branch_type = 1 # 工場
  end
end

departments = %w(人事部 総務部 経理部 技術部 営業部 製造部)
departments.each do |department|
  Department.find_or_create_by!(name: department)
end

