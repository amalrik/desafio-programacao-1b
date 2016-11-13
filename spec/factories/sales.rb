FactoryGirl.define do
  factory :sale do
    buyer 'João Silva'
    description 'R$10 off R$20 of food'
    price 10.0
    quantity 2
    address "987 Fake St"
    supplier "Bob's Pizza"
    batch
  end
end