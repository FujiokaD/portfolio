# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             )

User.create!(name:  "Other User",
             email: "othre@example.com",
             )

# メインユーザを対象にタスクを生成する
user = User.first
30.times do |i|
  #毎日のタスクを生成する
  user.tasks.create!(title: "daily #{i}",
                     start_time: Time.new(2000, 1, i+1, 12, 0, 0),
                     end_time:   Time.new(2000, 1, i+1, 13, 0, 0),
                    )
  #週次のタスクを生成する
  a_week_ago = 86400*i*7
  user.tasks.create!(title: "weekly #{i}",
                     start_time: Time.new(2000, 1, i+1, 10, 0, 0) + a_week_ago,
                     end_time:   Time.new(2000, 1, i+1, 15, 0, 0) + a_week_ago,
                    )
  #月次のタスクを生成する
  month = i % 12 + 1                  
  user.tasks.create!(title: "monthly #{i}",
                     start_time: Time.new(2000 + i / 12, month, 1,  8, 0, 0),
                     end_time:   Time.new(2000 + i / 12, month, 1, 20, 0, 0),
                    )                  
end
