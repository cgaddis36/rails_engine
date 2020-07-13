FactoryBot.define do
  factory :transaction do
    invoice { Faker::TvShows::MichaelScott.quote }
    credit_card_number { Faker::Business.credit_card_number }
    credit_card_expiration_date { }
    result { "MyString" }
  end
end
