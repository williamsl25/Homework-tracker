class AddContentUserIdCommentableTypeCommentableIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :content, :text
    add_column :comments, :user_id, :integer
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
  end
end
