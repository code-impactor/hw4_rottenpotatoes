FactoryGirl.define do
  factory :movie do
    title 'A Fake Title'
    director 'A Fake Director'
    release_date Time.now - 7.days
  end
end
