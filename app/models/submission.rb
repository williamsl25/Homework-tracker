class Submission < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :links, dependent: :destroy

include Workflow
  workflow do 
    state :begin do
      event :submit,  transitions_to: :submit
      event :review, transitions_to: :review
      event :complete, transitions_to: :complete
    end
    state :submit do
      event :review, transitions_to: :review
      event :complete, transitions_to: :complete
    end
    state :review do
      event :submit, transitions_to: :submit
      event :complete, transitions_to: :complete
    end
    state :complete do
    end
  end
end
    

