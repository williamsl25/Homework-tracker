class Course < ActiveRecord::Base
  has_many :location_courses
  has_many :locations, through: :location_courses
end
