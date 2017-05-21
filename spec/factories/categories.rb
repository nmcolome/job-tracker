FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "Web Development #{i}"
    end

    trait :with_jobs do
      transient do
        job_count 3
      end

      after(:create) do |category, evaluator|
        create_list(:job, evaluator.job_count, category: category)
      end
    end
  end
end
