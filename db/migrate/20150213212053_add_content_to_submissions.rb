class AddContentToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :content, :text
  end
end
