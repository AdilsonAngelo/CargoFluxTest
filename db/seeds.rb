# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def sandwich(sentences = 3, repeat = 1)
    text_block = []
    text_block << Faker::Markdown.headers
    repeat.times do
        text_block << Faker::Lorem.paragraph(sentences)
        text_block << Faker::Markdown.random
    end
    text_block.join("\n")
end

5.times do
    Document.create({
        body: sandwich(5, 3)
    })
end
