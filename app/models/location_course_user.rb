class LocationCourseUser < ActiveRecord::Base
  belongs_to :location_course
  belongs_to :user
  has_many :location_course_users, through: :location_course_users 
  has_many :users
end
