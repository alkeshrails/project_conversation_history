FactoryBot.define do
  factory :project do
    name { "Test" }
    status { 'draft' }
    user_id { 1 }
  end
end
