class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :courses
  has_many :assignments, through: :submissions
  has_many :submissions
  has_many :location_courses, through: :location_course_users
  has_many :location_course_users
  has_many :comments 



end
