30.times do
  Review.create user_id: User.first.id, title: Faker::Lorem.sentence(3),
    content: "", device: Device.first
end
