FactoryBot.define do
  factory :customer do
    organisation
    name

    transient do
      projects { 0 }
    end

    after :create do |customer, options|
      create_list(:project, options.projects, customer: customer)
    end
  end
end
