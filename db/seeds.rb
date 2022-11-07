# Seed of Eventbrite project

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    
    User.create!(
        first_name: first_name,
        last_name: last_name,
        description: Faker::ChuckNorris.fact,
        email: "#{first_name.downcase}.#{last_name.downcase}@yopmail.com", 
        password: Faker::Alphanumeric.alphanumeric(number:10)       
    )
end

puts 'User created !'

15.times do
    Event.create(title: Faker::DcComics.title,
    start_date: Faker::Date.forward(days: 10),
    duration: [5,10,20,30].sample,
    description: Faker::Lorem.sentence(word_count: 15),
    price: Faker::Number.between(from: 1, to: 1000),
    location: Faker::JapaneseMedia::Naruto.village, admin_id: rand(1..10))
    
  end
  
  puts 'Event created !'
  puts "#{} "
  
  
  10.times do
  Attendance.create(
    stripe_customer_id: Faker::Number.between(from: 1, to: 10),
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id
  )
  end
  
  puts 'Attendances created !'




puts 'Sucessfuly done'