FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Test Article title#{n}" }
    body { "sample article body" }
  end
end
