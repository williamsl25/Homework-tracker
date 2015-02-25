class Assignment < ActiveRecord::Base
  belongs_to :user
  has_many :submissions
  has_many :users, through: :submissions
  accepts_nested_attributes_for :user
  has_many :comments, as: :commentable
end
