FactoryBot.define do
  factory :vote do
    user { nil }
    article { nil }
  end

  factory :user do
    sequence(:name) { |n| "test-#{n.to_s.rjust(3, '0')}" }
    email { "#{name}@example.com" }
    password { 'foobar' }
  end

  factory :article do
    title { 'Article' }
    text { 'Lorem ipsum' }
  end
end
