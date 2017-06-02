# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skill.destroy_all
User.destroy_all
puts "Desroyed previous users & skills"

roles = %(admin, freelance)
skills = %w(Ruby Rails Elixir Python HTML CSS Javascript Product Design SEO Growthhacking Analytics)
(1..20).each do |i|
  role = roles[i]
  User.create!(email: "role#{i}@gmail.com", password: '123456', role: role, active: true )
end

puts "Users created"

skills.each do |skill|
  Skill.create!(name: skill)
end

puts "Skills created"

User.all.each do |u|
  skills_count = (1..skills.count).to_a.sample
  u_skills = skills.sample(skills_count)
  u_skills.each do |s|
    skill = Skill.find_by(name: s)
    u.user_skills.build(skill: skill).save
  end
end

puts "Users' Skills created"
