FactoryGirl.define do
  factory :item do
    sequence (:description) { |n| "To do item no. #{n}" }
    days 7
  end
end