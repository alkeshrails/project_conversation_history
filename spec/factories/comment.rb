FactoryBot.define do
  factory :comment do
    body { 'Great project' }
    user_id { 1 }
  end
end
