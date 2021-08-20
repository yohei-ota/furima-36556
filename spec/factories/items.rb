FactoryBot.define do
  factory :item do
    item_name {Faker::Commerce.product_name}
    text      {Faker::Lorem.sentence}
    category  {Category.find(2)}
    status    {Status.find(2)}
    cost      {Cost.find(2)}
    area      {Area.find(2)}
    day       {Day.find(2)}
    price     {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/sample1.png"), filename: "sample1.png")
    end
  end
end
