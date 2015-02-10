class LocationCourse < ActiveRecord::Base
  belongs_to :location
  belongs_to :course
end
