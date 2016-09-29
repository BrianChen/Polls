# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_text(x)
  (1..x).map {("a".."z").to_a.sample}.join
end

names = ['Ronald Stump', 'Goldie Flowers',
        'Trevor Travers', 'Indistinct Blob']

names.each do |name|
  User.create(user_name: name)
end

#user
[1,2].each do |user_id|
  (3-user_id).times do
    Poll.create(user_id: user_id, title: random_text(15))
  end
end

#question
[1,2,3].each do |poll_id|
  (4-poll_id).times do
    Question.create(poll_id: poll_id, text: random_text(20))
  end
end

#answer choices
(1..6).each do |question_id|
  ["yes", "no"].each do |text|
    AnswerChoice.create(question_id: question_id, text: text)
  end
end

Response.create(user_id: 1, answer_choice_id: 1)
Response.create(user_id: 1, answer_choice_id: 3)
Response.create(user_id: 1, answer_choice_id: 5)
Response.create(user_id: 2, answer_choice_id: 2)
Response.create(user_id: 2, answer_choice_id: 4)
Response.create(user_id: 2, answer_choice_id: 6)
Response.create(user_id: 3, answer_choice_id: 1)
Response.create(user_id: 3, answer_choice_id: 3)
Response.create(user_id: 3, answer_choice_id: 5)

Response.create(user_id: 2, answer_choice_id: 8)
Response.create(user_id: 2, answer_choice_id: 10)
Response.create(user_id: 3, answer_choice_id: 9)
Response.create(user_id: 3, answer_choice_id: 7)

Response.create(user_id: 3, answer_choice_id: 11)
