FactoryGirl.define do
  factory :comment do
    sequence :content do |i|
      "strings #{i}"
    end
    job
  end
end
