FactoryBot.define do
  factory :project do
    customer
    title
    status { Project.statuses.keys.sample }
  end
end
