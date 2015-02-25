require 'rails_helper'

RSpec.describe Submission, type: :model do
  subject do
    Submission.new({
      name: "A submission",
      content: "submission content"
      })
  end

  it "should have a name" do
    submission = Submission.new({
      name: "Lindsay's submission",
      content: "this is the content of the submission"
      })
    expect(submission.name).to eq("Lindsay's submission")
    expect(submission.content).to eq("this is the content of the submission")
  end

  it "should have a name" do
    submission = Submission.new({
      name: "Lindsay's submission",
      content: "this is the content of the submission"
      })
    expect(submission.name).not_to eq(nil)
    expect(submission.content).not_to eq(nil)
  end
  it "should start in the state of begin" do
    expect(subject.current_state).to eq("begin")
  end
  it "should be able to transition to 3 states from begin" do 
    expect(subject.current_state.events.keys).to eq([
      :submit,
      :review,
      :complete
      ])
  end
  
end

  