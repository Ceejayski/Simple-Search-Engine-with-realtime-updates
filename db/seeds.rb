user_sessions = []
5.times do
  user_sessions << Faker::Lorem.characters(number: 10)
end

4000.times do |n|
  query_text = Faker::Lorem.sentence(word_count: 3)
  user_session = user_sessions.sample
  SearchQuery.create(query_text: query_text, user_session: user_session)
end

500.times do |n|
  title = Faker::Lorem.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 10)
  Article.create!(title: title, body: body)
end
