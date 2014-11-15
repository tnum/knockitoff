FactoryGirl.define do
  factory :item do
    sequence (:description) { |n| "To do item no. #{n}" }
  end
end