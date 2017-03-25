create_user = for i in 1..10 do
  User.create!([
    email: "#{i}@#{i}.com",
    password: "111111",
    password_confirmation: "111111"
                ])
end

puts "10 User created."

create_category = for i in 1..100 do
  Category.create!([
    name: "类别#{i}",
    user_id: rand(1..10)
    ])
end

puts "100 category created."

create_working_lists = for i in 1..100 do
  WorkingList.create!([
    category_name: Category.pluck(:name).sample,
    date: rand(1.month.ago..Time.now).to_date,
    department: "部门"+rand(1..6).to_s,
    colleague: "相关人员"+rand(1..10).to_s,
    title:     "项目#{i}",
    is_plan:   [true, false].sample,
    take_time:  rand(1.0..9.0).round(1),
    descrption: "描述#{i}",
    progress:  ["完成","进行中","准备中"].sample,
    user_id: rand(1..10)
    ])
end

puts "100 working_lists created."
