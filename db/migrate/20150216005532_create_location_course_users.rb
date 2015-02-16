class CreateLocationCourseUsers < ActiveRecord::Migration
  def change
    create_table :location_course_users do |t|
      t.integer :user_id
      t.integer :location_course_id

      t.timestamps null: false
    end
  end
end
