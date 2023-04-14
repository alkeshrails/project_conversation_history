user = User.create!(email: "test@yopmail.com", password: "123456")

(0..10).each do |num|
  name = Faker::Alphanumeric.alpha(number: 10)
  Project.create(name: name, status: "draft", user_id: user.id)
end

(0..5).each do |num|
  body = Faker::Markdown.emphasis
  Comment.create(user_id: user.id, body: Faker::Markdown.emphasis, project_id: Project.first.id)
end
