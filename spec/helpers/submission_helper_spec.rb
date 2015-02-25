require 'rails_helper'

RSpec.describe SubmissionsHelper, type: :helper do
  subject do
    Submission.new({
      name: "name",
      content: "content",
      })
  end
  it 'should return starting workflow state' do 
    expect(helper.submission_workflow(subject)).to eq("begin")
  end
  it 'should return starting state description' do 
    expect(helper.workflow_state_helper_method(subject)).to eq("submission has been sent")
  end

end
