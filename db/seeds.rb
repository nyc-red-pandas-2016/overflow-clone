50.times do
  User.create(username: Faker::StarWars.character, email: Faker::Internet.email, password: "Password")
end

QUESTION_ARRAY = [{title: "What's up with Oreos?", content: "I'm like... super into them.", user_id: 1},
                {title: "Yo, anyone try the new Cheetos?", content: "They're dangerously cheesy. So dangerous that I'm now in the hospital. Buyer beware.", user_id: 2},
                {title: "Having a party tonight - snack suggestions?", content: "Keep in mind that not many people actually like me and probably won't show up.", user_id: 3},
                {title: "Salsa or hummus?", content: "What would make a better smoothie flavor - salsa or hummus?", user_id: 4},
                {title: "I can't stop eating snacks", content: "Help help help", user_id: 4},
                {title: "Snacks are cool", content: "Just wanted to say that", user_id: 1},
                {title: "Am I weird because I don't like snacks?", content: "I probably am, right?", user_id: 2}]

QUESTION_ARRAY.each do |question|
  Question.create(question)
end

TAG_ARRAY = [{name: "cheese"},
             {name: "general snacking"},
             {name: "suggestions"},
             {name: "help"},
             {name: "cookies"},
             {name: "snack revolution"}]

TAG_ARRAY.each do |tag|
  Tag.create(tag)
end

Question.find(1).tags << Tag.find(2)
Question.find(1).tags << Tag.find(5)
Question.find(1).tags << Tag.find(6)

Question.find(2).tags << Tag.find(2)
Question.find(2).tags << Tag.find(4)

Question.find(3).tags << Tag.find(2)
Question.find(3).tags << Tag.find(3)
Question.find(3).tags << Tag.find(4)

Question.find(4).tags << Tag.find(2)
Question.find(4).tags << Tag.find(6)

Question.find(5).tags << Tag.find(4)

Question.find(6).tags << Tag.find(2)
Question.find(6).tags << Tag.find(6)

Question.find(7).tags << Tag.find(2)
Question.find(7).tags << Tag.find(3)

ANSWER_ARRAY = [{content: "Love Oreos, great stuff" ,user_id: 2,question_id: 1}, 
  {content: "I hope you're ok.", user_id: 3, question_id: 2}, 
  {content: "SNACK SUGGESTIONS? YEAH ALL SNACKS BECAUSE SNACKS RULE", user_id: 4, question_id: 3}, 
  {content: "Salsa", user_id: 1, question_id: 4},
  {content: "Salsa", user_id: 2, question_id: 4},  
  {content: "Nothing wrong with you, continue eating snacks", user_id: 4, question_id: 5}, 
  {content: "You got it.", user_id: 3, question_id: 6},
  {content: "Yes very weird", user_id: 1, question_id: 7}, {content: "Agreed, super weird", user_id: 3, question_id: 7}, {content: "Please leave, you're too weird", user_id: 4, question_id: 7}]

ANSWER_ARRAY.each do |answer|
  Answer.create(answer)
end

COMMENT_ARRAY = [{content: "Ewwww" ,user_id: 3, commentable_id: 7, commentable_type: "Question"}, 
{content: "LOL love Oreo talk keep it up",user_id: 5, commentable_id: 1, commentable_type: "Question"}, 
{content: "Both are equally good please remove question not a good question",user_id: 5, commentable_id: 4, commentable_type: "Question"},
{content: "Great answer, love it",user_id: 5, commentable_id: 3, commentable_type: "Answer"},
{content: "Terrible answer, hate it",user_id: 5, commentable_id: 2, commentable_type: "Answer"},
{content: "This answer made me feel cool when I read it...",user_id: 5, commentable_id: 6, commentable_type: "Answer"}]

COMMENT_ARRAY.each do |comment|
  Comment.create(comment)
end

Question.find(1).votes << Vote.create(user_id: 2, votable_id: 1, votable_type: "Question", point_value: 1)
Question.find(1).votes << Vote.create(user_id: 3, votable_id: 1, votable_type: "Question", point_value: 1)
Question.find(1).votes << Vote.create(user_id: 4, votable_id: 1, votable_type: "Question", point_value: 1)
Question.find(2).votes << Vote.create(user_id: 1, votable_id: 2, votable_type: "Question", point_value: 1)
Question.find(2).votes << Vote.create(user_id: 3, votable_id: 2, votable_type: "Question", point_value: -1)
Question.find(2).votes << Vote.create(user_id: 4, votable_id: 2, votable_type: "Question", point_value: 1)
Question.find(3).votes << Vote.create(user_id: 1, votable_id: 3, votable_type: "Question", point_value: -1)
Question.find(3).votes << Vote.create(user_id: 2, votable_id: 3, votable_type: "Question", point_value: -1)
Question.find(3).votes << Vote.create(user_id: 4, votable_id: 3, votable_type: "Question", point_value: -1)
Question.find(4).votes << Vote.create(user_id: 2, votable_id: 1, votable_type: "Question", point_value: 1)
Question.find(4).votes << Vote.create(user_id: 3, votable_id: 1, votable_type: "Question", point_value: 1)
Question.find(4).votes << Vote.create(user_id: 1, votable_id: 1, votable_type: "Question", point_value: -1)
Question.find(5).votes << Vote.create(user_id: 2, votable_id: 5, votable_type: "Question", point_value: 1)
Question.find(6).votes << Vote.create(user_id: 3, votable_id: 6, votable_type: "Question", point_value: 1)
Question.find(7).votes << Vote.create(user_id: 4, votable_id: 7, votable_type: "Question", point_value: 1)

Answer.find(1).votes << Vote.create(user_id: 4, votable_id: 1, votable_type: "Answer", point_value: 1)
Answer.find(1).votes << Vote.create(user_id: 3, votable_id: 1, votable_type: "Answer", point_value: 1)
Answer.find(1).votes << Vote.create(user_id: 2, votable_id: 1, votable_type: "Answer", point_value: 1)
Answer.find(2).votes << Vote.create(user_id: 2, votable_id: 2, votable_type: "Answer", point_value: -1)
Answer.find(2).votes << Vote.create(user_id: 3, votable_id: 2, votable_type: "Answer", point_value: -1)
Answer.find(2).votes << Vote.create(user_id: 4, votable_id: 2, votable_type: "Answer", point_value: -1)
Answer.find(3).votes << Vote.create(user_id: 2, votable_id: 3, votable_type: "Answer", point_value: -1)
Answer.find(3).votes << Vote.create(user_id: 4, votable_id: 3, votable_type: "Answer", point_value: -1)
Answer.find(4).votes << Vote.create(user_id: 2, votable_id: 4, votable_type: "Answer", point_value: -1)
Answer.find(5).votes << Vote.create(user_id: 4, votable_id: 5, votable_type: "Answer", point_value: 1)
Answer.find(6).votes << Vote.create(user_id: 2, votable_id: 6, votable_type: "Answer", point_value: -1)
Answer.find(6).votes << Vote.create(user_id: 4, votable_id: 6, votable_type: "Answer", point_value: -1)
Answer.find(7).votes << Vote.create(user_id: 2, votable_id: 7, votable_type: "Answer", point_value: 1)
Answer.find(7).votes << Vote.create(user_id: 4, votable_id: 7, votable_type: "Answer", point_value: 1)
Answer.find(8).votes << Vote.create(user_id: 2, votable_id: 8, votable_type: "Answer", point_value: 1)
Answer.find(9).votes << Vote.create(user_id: 4, votable_id: 3, votable_type: "Answer", point_value: -1)
Comment.find(1).votes << Vote.create(user_id: 4, votable_id: 1, votable_type: "Answer", point_value: -1)
Comment.find(2).votes << Vote.create(user_id: 4, votable_id: 2, votable_type: "Answer", point_value: -1)
Comment.find(3).votes << Vote.create(user_id: 4, votable_id: 3, votable_type: "Answer", point_value: -1)
Comment.find(4).votes << Vote.create(user_id: 4, votable_id: 4, votable_type: "Answer", point_value: 1)
Comment.find(5).votes << Vote.create(user_id: 4, votable_id: 5, votable_type: "Answer", point_value: 1)
Comment.find(6).votes << Vote.create(user_id: 4, votable_id: 6, votable_type: "Answer", point_value: 1)


