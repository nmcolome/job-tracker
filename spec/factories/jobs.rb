FactoryGirl.define do
  factory :job do
    sequence :title do |i|
      "Developer #{i}"
    end
    description "so fun"
    level_of_interest 90
    city "Denver"
    company
    category

    trait :with_comments do
      transient do
        comment_count 2
      end
      
      after(:create) do |job, evaluator|
        create_list(:comment, evaluator.comment_count, job: job)
      end
    end
  end
end
