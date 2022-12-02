500.times do |n|
  title = Faker::Lorem.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 10)
  Article.create!(title: title, body: body)
end
