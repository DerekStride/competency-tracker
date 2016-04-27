FactoryGirl.define do
  factory :competency do
    name 'Nginx'
    proficiency 'intermediate'
  end

  factory :tag do
    name 'Beginner'
  end

  factory :learning_source do
    name 'Khan Academy'
  end
end
