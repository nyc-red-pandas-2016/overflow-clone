5.times do
  User.create(username: Faker::StarWars.character, email: Faker::Internet.email, password: "Password")
end

User.all.each do |user|
  2.times do
    Question.create(title: Faker::Name.title , content: Faker::Lorem.sentence, user_id: user.id )
  end
end

Question.all.each do |question|
  2.times do
    Answer.create(content: Faker::Lorem.sentence, user_id: question.user_id, question_id: question.id)
  end
end
