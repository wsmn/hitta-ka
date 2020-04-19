require "rails_helper"

RSpec.describe(Task, type: :model) do
  it("gets custom task rate as float") do
    expect(Task.new(custom_rate: "995.0").rate).to eq(995.0)
  end

  it("gets project task rate as float") do
    project = build(:project)
    allow(project.customer).to receive(:task_rate) { 337.5 }
    expect(Task.new(project: project).rate).to eq(337.5)
  end
end
