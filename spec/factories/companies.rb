FactoryGirl.define do
  factory :company do
    sequence :name do |i|
      "Google #{i}"
    end

    trait :with_jobs do
      transient do
        job_count 2
      end
      
      after(:create) do |company, evaluator|
        create_list(:job, evaluator.job_count, company: company)
      end
    end
  end
end
