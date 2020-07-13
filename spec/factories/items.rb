FactoryBot.define do
  factory :item do
    name { Faker::TvShows::SiliconValley.invention }
    description { Faker::TvShows::SiliconValley.quote }
    unit_price { rand(11.2...76.9) }
    merchant { nil }
  end
end
