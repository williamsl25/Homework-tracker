require 'rails_helper'

RSpec.describe Assignment, type: :model do
  subject do
    Assignment.new({
      name: "An assignment",
      requirements: "some requirements",
      })
  end
# to make a new comment variable
  let(:comment) do
    Comment.new({
      content: "I am a comment", 
      
    })
  end
  it "should have a name" do
    assignment = Assignment.new
    assignment.name = "Testing assignment"
    expect(assignment.name).to eq("Testing assignment")
  end
# .to eq only expects the variable to be equal
# to run spec files in terminal = use the command:
  # rspec

  it "should have a name" do
    assignment = Assignment.new
    assignment.name = "Testing assignment"
    expect(assignment.name).not_to eq(nil)
  end
# run rspec in terminal to test
# positive test
  it "should have requirements" do
    assignment = Assignment.new
    assignment.requirements = "testing requirements"
    expect(assignment.requirements).to eq("testing requirements")
  end
# negative test
  it "should have requirements" do
    assignment = Assignment.new
    assignment.requirements = "testing requirements"
    expect(assignment.requirements).not_to eq(nil)
  end

  it "should have name and requirements" do
    assignment = Assignment.new({
      name: "Lindsay's assignment",
      requirements: "add specs to models and controllers."
    })
    expect(assignment.name).to eq("Lindsay's assignment")
    expect(assignment.requirements).to eq("add specs to models and controllers.")
  end
  it "should have comments that can be added" do
    subject.comments << comment
    expect(subject.comments.length).to eq(1)
  
  end
end

